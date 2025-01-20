@interface OSAAppUsageAccumulator
- (NSDictionary)versions;
- (OSAAppUsageAccumulator)initWithStartDate:(id)a3 endDate:(id)a4 targetAppVersions:(id)a5 firstPartyBundleIDs:(id)a6;
- (void)addEvent:(id)a3;
@end

@implementation OSAAppUsageAccumulator

- (OSAAppUsageAccumulator)initWithStartDate:(id)a3 endDate:(id)a4 targetAppVersions:(id)a5 firstPartyBundleIDs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___OSAAppUsageAccumulator;
  v15 = -[OSAAccumulator init](&v21, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_startDate, a3);
    objc_storeStrong((id *)&v16->_endDate, a4);
    objc_storeStrong((id *)&v16->_targetAppVersions, a5);
    objc_storeStrong((id *)&v16->_firstPartyBundleIDs, a6);
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    denyList = v16->_denyList;
    v16->_denyList = (NSMutableSet *)v17;

    if (v13) {
      v19 = 0LL;
    }
    else {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    }
    objc_storeStrong((id *)&v16->_versions, v19);
    if (!v13) {
  }
    }

  return v16;
}

- (NSDictionary)versions
{
  if (self->_versions) {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](&OBJC_CLASS___NSDictionary, "dictionaryWithDictionary:"));
  }
  else {
    v2 = 0LL;
  }
  return (NSDictionary *)v2;
}

- (void)addEvent:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[_DKApplicationMetadataKey shortVersionString]( &OBJC_CLASS____DKApplicationMetadataKey,  "shortVersionString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[_DKApplicationMetadataKey exactBundleVersion]( &OBJC_CLASS____DKApplicationMetadataKey,  "exactBundleVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  id v11 = sub_10000D440((uint64_t)v7, (uint64_t)v10);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator targetKey](self, "targetKey"));
  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator targetKey](self, "targetKey"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    unsigned int v16 = [v14 isEqualToString:v15];

    if (!v16) {
      goto LABEL_40;
    }
  }

  denyList = self->_denyList;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  LOBYTE(denyList) = -[NSMutableSet containsObject:](denyList, "containsObject:", v18);

  if (!v12)
  {
    uint64_t v26 = OSAStabilityMonitorLogDomain(v19);
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v28;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Omitting %{public}@ because version is missing",  buf,  0xCu);
    }

    v29 = self->_denyList;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    -[NSMutableSet addObject:](v29, "addObject:", v22);
    goto LABEL_39;
  }

  targetAppVersions = self->_targetAppVersions;
  if (!targetAppVersions)
  {
    versions = self->_versions;
    v31 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](versions, "objectForKeyedSubscript:", v31));

    id v33 = [v12 isEqualToString:v32];
    if ((v33 & 1) == 0)
    {
      if (v32)
      {
        uint64_t v34 = OSAStabilityMonitorLogDomain(v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          v36 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
          *(_DWORD *)buf = 138543874;
          *(void *)&buf[4] = v36;
          *(_WORD *)&buf[12] = 2114;
          *(void *)&buf[14] = v32;
          *(_WORD *)&buf[22] = 2114;
          v85 = (uint64_t (*)(uint64_t, uint64_t))v12;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "Migrating version for %{public}@: %{public}@ to %{public}@",  buf,  0x20u);
        }

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator totals](self, "totals"));
        v38 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
        [v37 removeObjectForKey:v38];
      }

      v39 = self->_versions;
      v40 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v39, "setObject:forKeyedSubscript:", v12, v40);
    }

    goto LABEL_21;
  }

  objc_super v21 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](targetAppVersions, "objectForKeyedSubscript:", v21));

  if (!v22)
  {
LABEL_36:
    uint64_t v69 = OSAStabilityMonitorLogDomain(v23);
    v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v71;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2114;
      v85 = (uint64_t (*)(uint64_t, uint64_t))v12;
      _os_log_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_DEFAULT,  "Omitting %{public}@ because its version changed from the baseline (%{public}@) to %{public}@",  buf,  0x20u);
    }

    v72 = self->_denyList;
    v73 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    -[NSMutableSet addObject:](v72, "addObject:", v73);

LABEL_39:
LABEL_40:
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator totals](self, "totals"));
    v75 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    [v74 removeObjectForKey:v75];

    v76 = self->_versions;
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
    -[NSMutableDictionary removeObjectForKey:](v76, "removeObjectForKey:", v46);
    goto LABEL_41;
  }

  firstPartyBundleIDs = self->_firstPartyBundleIDs;
  v25 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
  if (!-[NSSet containsObject:](firstPartyBundleIDs, "containsObject:", v25))
  {
    unsigned __int8 v41 = [v12 isEqualToString:v22];

    if ((v41 & 1) != 0) {
      goto LABEL_20;
    }
    goto LABEL_36;
  }

LABEL_20:
LABEL_21:
  uint64_t v42 = objc_claimAutoreleasedReturnValue([v4 startDate]);
  v43 = (void *)v42;
  if (!v42
    || (v44 = (void *)objc_claimAutoreleasedReturnValue([v4 endDate]),
        BOOL v45 = v44 == 0LL,
        v44,
        v43,
        v45))
  {
    uint64_t v67 = OSAStabilityMonitorLogDomain(v42);
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
    {
      v68 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v68;
      _os_log_impl( (void *)&_mh_execute_header,  v46,  OS_LOG_TYPE_DEFAULT,  "Skipping event for %{public}@ due to missing start or end date",  buf,  0xCu);
    }
  }

  else
  {
    v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v4 startDate]);
    [v47 timeIntervalSinceDate:self->_startDate];
    BOOL v49 = v48 < 0.0;

    if (v49)
    {
      uint64_t v51 = OSAStabilityMonitorLogDomain(v50);
      v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG)) {
        sub_1000158FC(v4);
      }

      v53 = self->_startDate;
      v46 = (os_log_s *)v53;
    }

    v54 = (NSDate *)objc_claimAutoreleasedReturnValue([v4 endDate]);
    v55 = (void *)objc_claimAutoreleasedReturnValue([v4 endDate]);
    [v55 timeIntervalSinceDate:self->_endDate];
    BOOL v57 = v56 > 0.0;

    if (v57)
    {
      uint64_t v59 = OSAStabilityMonitorLogDomain(v58);
      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
        sub_10001585C(v4);
      }

      v61 = self->_endDate;
      v54 = v61;
    }

    id v62 = -[NSDate timeIntervalSinceDate:](v54, "timeIntervalSinceDate:", v46);
    if (v63 >= 0.0)
    {
      v65 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
      -[NSDateComponents setHour:](v65, "setHour:", 0LL);
      -[NSDateComponents setMinute:](v65, "setMinute:", 0LL);
      -[NSDateComponents setSecond:](v65, "setSecond:", 0LL);
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      v85 = sub_10000B3E4;
      v86 = sub_10000B3F4;
      v77 = v46;
      v87 = v77;
      v78 = (void *)objc_claimAutoreleasedReturnValue(-[OSAAccumulator calendar](self, "calendar"));
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_10000D48C;
      v79[3] = &unk_100020EA0;
      v80 = v54;
      v81 = self;
      v83 = buf;
      id v82 = v4;
      [v78 enumerateDatesStartingAfterDate:v77 matchingComponents:v65 options:1024 usingBlock:v79];

      _Block_object_dispose(buf, 8);
    }

    else
    {
      uint64_t v64 = OSAStabilityMonitorLogDomain(v62);
      v65 = (NSDateComponents *)objc_claimAutoreleasedReturnValue(v64);
      if (os_log_type_enabled((os_log_t)v65, OS_LOG_TYPE_ERROR))
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue([v4 stringValue]);
        *(_DWORD *)buf = 138543874;
        *(void *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v46;
        *(_WORD *)&buf[22] = 2114;
        v85 = (uint64_t (*)(uint64_t, uint64_t))v54;
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v65,  OS_LOG_TYPE_ERROR,  "Skipping event for %{public}@ with start date %{public}@ after end date %{public}@",  buf,  0x20u);
      }
    }
  }

- (void).cxx_destruct
{
}

@end
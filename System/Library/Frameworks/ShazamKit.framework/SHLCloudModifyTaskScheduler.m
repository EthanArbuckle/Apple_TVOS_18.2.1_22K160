@interface SHLCloudModifyTaskScheduler
- (NSArray)preconditions;
- (SHLCloudModifyTaskScheduler)initWithConfiguration:(id)a3;
- (SHLCloudModifyTaskTransformer)taskTransformer;
- (void)scheduleModifyTask:(id)a3;
- (void)setTaskTransformer:(id)a3;
@end

@implementation SHLCloudModifyTaskScheduler

- (SHLCloudModifyTaskScheduler)initWithConfiguration:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___SHLCloudModifyTaskScheduler;
  v5 = -[SHLCloudTaskScheduler initWithConfiguration:](&v9, "initWithConfiguration:", v4);
  if (v5)
  {
    v6 = -[SHLCloudModifyTaskTransformer initWithConfiguration:]( objc_alloc(&OBJC_CLASS___SHLCloudModifyTaskTransformer),  "initWithConfiguration:",  v4);
    taskTransformer = v5->_taskTransformer;
    v5->_taskTransformer = v6;
  }

  return v5;
}

- (NSArray)preconditions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  id v4 = objc_alloc(&OBJC_CLASS___SHLCloudAccountStatusPrecondition);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudBackedContainer]);
  v7 = -[SHLCloudAccountStatusPrecondition initWithContainer:](v4, "initWithContainer:", v6);

  [v3 addObject:v7];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler configuration](self, "configuration"));
  id v9 = [v8 sessionScope];

  if (v9 == (id)1)
  {
    v10 = objc_alloc(&OBJC_CLASS___SHLCloudEncryptionPrecondition);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 cloudBackedContainer]);
    v13 = -[SHLCloudEncryptionPrecondition initWithContainer:](v10, "initWithContainer:", v12);

    [v3 addObject:v13];
  }

  id v14 = [v3 copy];

  return (NSArray *)v14;
}

- (void)scheduleModifyTask:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler containerTransformer](self, "containerTransformer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 cloudBackedContainer]);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SHLCloudContext sharedContext](&OBJC_CLASS___SHLCloudContext, "sharedContext"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 shazamLibraryZone]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler cache](self, "cache"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v8 zoneID]);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 zoneName]);
  unsigned __int8 v12 = [v9 zoneExistsForIdentifier:v11];

  p_vtable = (void **)(&OBJC_CLASS___SHServerResourcesResponse + 24);
  if ((v12 & 1) == 0)
  {
    v56 = v6;
    id v14 = -[SHLCloudBackedZone initWithZone:](objc_alloc(&OBJC_CLASS___SHLCloudBackedZone), "initWithZone:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler cache](self, "cache"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedZone zone](v14, "zone"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 zoneID]);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 zoneName]);
    id v58 = 0LL;
    unsigned __int8 v19 = [v15 storeZoneIdentifier:v18 error:&v58];
    id v20 = v58;

    if ((v19 & 1) == 0)
    {
      id v21 = sub_10002D0D8();
      v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedZone zone](v14, "zone"));
        v24 = (void *)objc_claimAutoreleasedReturnValue([v23 zoneID]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 zoneName]);
        *(_DWORD *)buf = 138412546;
        id v61 = v25;
        __int16 v62 = 2114;
        id v63 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Failed to cache the zone identifier for zone named %@ in the modify task with error %{public}@",  buf,  0x16u);
      }
    }

    v55 = v20;
    id v26 = sub_10002D0D8();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v28 = (objc_class *)objc_opt_class(v4);
      v29 = NSStringFromClass(v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudBackedZone zone](v14, "zone"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 zoneID]);
      v34 = (void *)objc_claimAutoreleasedReturnValue([v33 zoneName]);
      *(_DWORD *)buf = 138543874;
      id v61 = v30;
      __int16 v62 = 2112;
      id v63 = v31;
      __int16 v64 = 2114;
      v65 = v34;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "<task: %{public}@ %@> <zone: %{public}@> does not exist locally, so we are creating one",  buf,  0x20u);
    }

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler zoneTransformer](self, "zoneTransformer"));
    v59 = v14;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v59, 1LL));
    v6 = v56;
    v37 = (void *)objc_claimAutoreleasedReturnValue([v35 cloudBackedOperationForZonesToSave:v36 container:v56]);

    p_vtable = &OBJC_CLASS___SHServerResourcesResponse.vtable;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[SHLOperationQueue defaultQueue](&OBJC_CLASS___SHLOperationQueue, "defaultQueue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v37 operation]);
    [v38 addOperation:v39];
  }

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudTaskScheduler cache](self, "cache"));
  id v57 = 0LL;
  unsigned __int8 v41 = [v40 storeTask:v4 ofType:0 error:&v57];
  id v42 = v57;

  if ((v41 & 1) == 0)
  {
    id v43 = sub_10002D0D8();
    v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v61 = v42;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_ERROR,  "Failed to store the inflight task in the modify task scheduler with error %{public}@",  buf,  0xCu);
    }
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SHLCloudModifyTaskScheduler taskTransformer](self, "taskTransformer"));
  v46 = (void *)objc_claimAutoreleasedReturnValue([v45 cloudBackedOperationFromModifyTask:v4 container:v6]);

  id v47 = sub_10002D0D8();
  v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    v49 = (objc_class *)objc_opt_class(v4);
    v50 = NSStringFromClass(v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    *(_DWORD *)buf = 138543618;
    id v61 = v51;
    __int16 v62 = 2112;
    id v63 = v52;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "<task: %{public}@ %@> is scheduled", buf, 0x16u);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue([p_vtable + 367 defaultQueue]);
  v54 = (void *)objc_claimAutoreleasedReturnValue([v46 operation]);
  [v53 addOperation:v54];
}

- (SHLCloudModifyTaskTransformer)taskTransformer
{
  return self->_taskTransformer;
}

- (void)setTaskTransformer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
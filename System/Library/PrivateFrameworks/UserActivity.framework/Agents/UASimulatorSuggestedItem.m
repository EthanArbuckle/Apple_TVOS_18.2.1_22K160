@interface UASimulatorSuggestedItem
- (BOOL)requestPayloadWithCompletionHandler:(id)a3;
- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3;
- (UASimulator)simulator;
- (UASimulatorSuggestedItem)initWithArchivedUserActivityInfo:(id)a3 peerDevice:(id)a4 simulator:(id)a5;
- (UASimulatorSuggestedItem)initWithUserActivityInfo:(id)a3 peerDevice:(id)a4 simulator:(id)a5;
- (void)clearPayload;
- (void)setSimulator:(id)a3;
@end

@implementation UASimulatorSuggestedItem

- (UASimulatorSuggestedItem)initWithUserActivityInfo:(id)a3 peerDevice:(id)a4 simulator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UASimulatorSuggestedItem;
  v11 = -[UASimulatorSuggestedItem initWithUserActivityInfo:](&v14, "initWithUserActivityInfo:", v8);
  v12 = v11;
  if (v11)
  {
    -[UASimulatorSuggestedItem setPeerDevice:](v11, "setPeerDevice:", v9);
    objc_storeStrong((id *)&v12->_simulator, a5);
  }

  return v12;
}

- (UASimulatorSuggestedItem)initWithArchivedUserActivityInfo:(id)a3 peerDevice:(id)a4 simulator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UASimulatorSuggestedItem;
  v11 = -[UASimulatorSuggestedItem initWithArchivedUserActivityInfo:](&v14, "initWithArchivedUserActivityInfo:", v8);
  v12 = v11;
  if (v11)
  {
    -[UASimulatorSuggestedItem setPeerDevice:](v11, "setPeerDevice:", v9);
    -[UASimulatorSuggestedItem setSimulator:](v12, "setSimulator:", v10);
    -[UASimulatorSuggestedItem setPayloadAvailable:](v12, "setPayloadAvailable:", 0LL);
  }

  return v12;
}

- (BOOL)requestPayloadWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void))a3;
  -[UASimulatorSuggestedItem setPayloadRequested:](self, "setPayloadRequested:", 1LL);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem simulator](self, "simulator"));

  if (v5)
  {
    __int128 v45 = 0uLL;
    size[0] = 0;
    int v36 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
    [v6 getUUIDBytes:&v45];

    os_log_t v7 = sub_100039584(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 UUIDString]);
      *(_DWORD *)buf = 138543362;
      v40 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Requesting payload from paired client, uuid=%{public}@",  buf,  0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem simulator](self, "simulator"));
    BOOL v12 = sub_100076270((mach_port_t)[v11 pairedClientPort], &v45, 0x7A1200u, &v37, &v36, &size[1], size) == 0;

    if (v12)
    {
      uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSURL);
      id v20 = sub_100006B98(v19, v37, v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      -[UASimulatorSuggestedItem setWebpageURL:](self, "setWebpageURL:", v21);

      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  *(void *)&size[1],  size[0]));
      uint64_t v23 = UAUserActivityUserInfoPayload;
      -[UASimulatorSuggestedItem setPayload:identifier:]( self,  "setPayload:identifier:",  v22,  UAUserActivityUserInfoPayload);

      os_log_t v24 = sub_100039584(0LL);
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 UUIDString]);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem webpageURL](self, "webpageURL"));
        if (v28) {
          v29 = @"<private>";
        }
        else {
          v29 = @"-";
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem payloadForIdentifier:](self, "payloadForIdentifier:", v23));
        id v31 = sub_1000034D8(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        v33 = sub_10005BB68(v32, 0x10u);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        *(_DWORD *)buf = 138543875;
        v40 = v27;
        __int16 v41 = 2114;
        v42 = v29;
        __int16 v43 = 2113;
        v44 = v34;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Received payload from paired client, uuid=%{public}@, webPageURL=%{public}@ payload=%{private}@",  buf,  0x20u);
      }

      vm_deallocate(mach_task_self_, *(vm_address_t *)&size[1], size[0]);
      v4[2](v4, 0LL);
    }

    else
    {
      os_log_t v13 = sub_100039584(0LL);
      objc_super v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue([v15 UUIDString]);
        *(_DWORD *)buf = 138543362;
        v40 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Failed to get payload for activity %{public}@",  buf,  0xCu);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  -1LL,  0LL));
      ((void (**)(id, void *))v4)[2](v4, v17);
    }
  }

  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  -1LL,  0LL));
    ((void (**)(id, void *))v4)[2](v4, v18);
  }

  -[UASimulatorSuggestedItem setPayloadRequested:](self, "setPayloadRequested:", 0LL);

  return 1;
}

- (BOOL)wasResumedOnAnotherDeviceWithCompletionHandler:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem simulator](self, "simulator"));

  if (v5)
  {
    __int128 v30 = 0uLL;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
    [v6 getUUIDBytes:&v30];

    uint64_t v22 = 0LL;
    LODWORD(v23) = 0;
    BYTE4(v23) = 0;
    os_log_t v7 = sub_100039584(0LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid", v22, v23));
      *(_DWORD *)buf = 138543362;
      v25 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "SIMULATOR: Requesting payload from paired client, uuid=%{public}@",  buf,  0xCu);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem simulator](self, "simulator"));
    BOOL v11 = sub_100076470((mach_port_t)[v10 pairedClientPort], &v30, 0x7A1200u, &v22, &v23) == 0;

    if (v11)
    {
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSError);
      id v15 = sub_100006E78((uint64_t)&v22, v14, NSKeyedArchiveRootObjectKey);
      uint64_t v12 = objc_claimAutoreleasedReturnValue(v15);
      BOOL v13 = v12 == 0;
    }

    else
    {
      uint64_t v12 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  -1LL,  0LL));
      BOOL v13 = 0;
    }

    v16 = (void *)v12;
    os_log_t v17 = sub_100039584(0LL);
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[UASimulatorSuggestedItem uuid](self, "uuid"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 UUIDString]);
      *(_DWORD *)buf = 138543875;
      v25 = v20;
      __int16 v26 = 2113;
      v27 = self;
      __int16 v28 = 2114;
      v29 = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "SIMULATOR: Calling completion handler because activity %{public}@/%{private}@ was resumed, error=%{public}@",  buf,  0x20u);
    }

    v4[2](v4, v16);
    -[UASimulatorSuggestedItem clearPayload](self, "clearPayload");
    sub_100007098((uint64_t)&v22);
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (void)clearPayload
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___UASimulatorSuggestedItem;
  -[UASimulatorSuggestedItem clearPayload](&v2, "clearPayload");
}

- (UASimulator)simulator
{
  return (UASimulator *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setSimulator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
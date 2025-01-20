@interface MRDConenctToGroupLeaderOperation
- (MRAVEndpoint)endpoint;
- (MRDConenctToGroupLeaderOperation)initWithGroupID:(id)a3;
- (void)execute;
- (void)finishWithError:(id)a3;
- (void)setEndpoint:(id)a3;
@end

@implementation MRDConenctToGroupLeaderOperation

- (MRDConenctToGroupLeaderOperation)initWithGroupID:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDConenctToGroupLeaderOperation;
  v6 = -[MRDConenctToGroupLeaderOperation init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_groupID, a3);
  }

  return v7;
}

- (void)execute
{
  v3 = -[MRRequestDetails initWithName:requestID:reason:]( objc_alloc(&OBJC_CLASS___MRRequestDetails),  "initWithName:requestID:reason:",  @"create remoteControlConnection to groupLeader",  0LL,  @"PreemptiveRemoteControlConnectionManager.conenctToGroupLeaderOperation");
  details = self->_details;
  self->_details = v3;

  id v5 = objc_alloc(&OBJC_CLASS___NSMutableString);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails reason](self->_details, "reason"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
  v8 = -[NSMutableString initWithFormat:](v5, "initWithFormat:", @"%@<%@>", v6, v7);

  if (self->_groupID) {
    -[NSMutableString appendFormat:](v8, "appendFormat:", @" for %@", self->_groupID);
  }
  uint64_t v10 = _MRLogForCategory(10LL, v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___MRAVLightweightReconnaissanceSession);
  groupID = self->_groupID;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestReasonID](self->_details, "requestReasonID"));
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10013842C;
  v17[3] = &unk_10039F308;
  v17[4] = self;
  [v12 searchEndpointsForGroupUID:groupID timeout:v14 reason:v16 queue:v17 completion:30.0];
}

- (void)finishWithError:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = _MRLogForCategory(10LL, v4);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1002BAB7C((id *)self);
    }
  }

  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConenctToGroupLeaderOperation endpoint](self, "endpoint"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 debugName]);

    uint64_t v11 = _MRLogForCategory(10LL, v10);
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    BOOL v12 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (!v12) {
        goto LABEL_10;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails reason](self->_details, "reason"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MRDConenctToGroupLeaderOperation endpoint](self, "endpoint"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 debugName]);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
      [v17 timeIntervalSinceDate:v18];
      *(_DWORD *)buf = 138544130;
      v25 = v13;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2112;
      v29 = v16;
      __int16 v30 = 2048;
      uint64_t v31 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds",  buf,  0x2Au);
    }

    else
    {
      if (!v12) {
        goto LABEL_10;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails reason](self->_details, "reason"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestID](self->_details, "requestID"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails startDate](self->_details, "startDate"));
      [v15 timeIntervalSinceDate:v16];
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      __int16 v26 = 2114;
      v27 = v14;
      __int16 v28 = 2048;
      v29 = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    }
  }

- (void)setEndpoint:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](self->_endpoint, "debugName"));

  uint64_t v7 = _MRLogForCategory(0LL, v6);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestReasonID](self->_details, "requestReasonID"));
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVEndpoint debugName](self->_endpoint, "debugName"));
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v4 debugName]);
      int v14 = 138544130;
      v15 = v10;
      __int16 v16 = 2114;
      v17 = @"endpoint";
      __int16 v18 = 2112;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ from <%@> to <%@>",  (uint8_t *)&v14,  0x2Au);

LABEL_6:
    }
  }

  else if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MRRequestDetails requestReasonID](self->_details, "requestReasonID"));
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 debugName]);
    int v14 = 138543874;
    v15 = v10;
    __int16 v16 = 2114;
    v17 = @"endpoint";
    __int16 v18 = 2112;
    uint64_t v19 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Set: %{public}@ setting %{public}@ to <%@>",  (uint8_t *)&v14,  0x20u);
    goto LABEL_6;
  }

  endpoint = self->_endpoint;
  self->_endpoint = (MRAVEndpoint *)v4;
}

- (MRAVEndpoint)endpoint
{
  return self->_endpoint;
}

- (void).cxx_destruct
{
}

@end
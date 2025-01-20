@interface MRDOutputContextModification
+ (id)_modifyPredictedOutputDevicesWithRequest:(id)a3 outputContext:(id)a4;
- (MRDOutputContextModification)initWithRequest:(id)a3;
- (MRGroupTopologyModificationRequest)request;
- (NSArray)avOutputDevices;
- (NSArray)discoveredConcreteOutputDevices;
- (id)description;
- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5;
@end

@implementation MRDOutputContextModification

- (MRDOutputContextModification)initWithRequest:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MRDOutputContextModification;
  v6 = -[MRDOutputContextModification init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_request, a3);
  }

  return v7;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@:%p/%@/discovered=%@>",  objc_opt_class(self),  self,  self->_request,  self->_discoveredConcreteOutputDevices);
}

- (void)modifyWithOutputContext:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v48 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MRGroupTopologyModificationRequest requestDetails](self->_request, "requestDetails"));
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 requestID]);

  unsigned int v13 = -[MRGroupTopologyModificationRequest shouldModifyPredictedRoutes]( self->_request,  "shouldModifyPredictedRoutes");
  v14 = @"modifyOutputContext";
  if (v13) {
    v14 = @"modifyPredictedOutputDevices";
  }
  v15 = v14;
  qos_class_t v16 = qos_class_self();
  v17 = objc_alloc(&OBJC_CLASS___NSString);
  v18 = (void *)objc_claimAutoreleasedReturnValue([v8 contextID]);
  v19 = -[NSString initWithFormat:](v17, "initWithFormat:", @"%@, contextID=%@", self, v18);

  v20 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  v15,  v12);
  v22 = v20;
  if (v19) {
    -[NSMutableString appendFormat:](v20, "appendFormat:", @" for %@", v19);
  }
  v50 = v19;
  uint64_t v23 = _MRLogForCategory(10LL, v21);
  v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v64 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_10013003C;
  v55[3] = &unk_1003A0E30;
  qos_class_t v62 = v16;
  v25 = v15;
  v56 = v25;
  id v26 = v12;
  id v57 = v26;
  id v27 = v8;
  id v58 = v27;
  id v28 = v10;
  id v59 = v28;
  id v29 = v9;
  id v61 = v29;
  id v30 = v48;
  id v60 = v30;
  v31 = objc_retainBlock(v55);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputContextModification request](self, "request"));
  unsigned int v33 = [v32 shouldModifyPredictedRoutes];

  if (v33)
  {
    v34 = (void *)objc_opt_class(self);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputContextModification request](self, "request"));
    v36 = (void *)objc_claimAutoreleasedReturnValue([v34 _modifyPredictedOutputDevicesWithRequest:v35 outputContext:v27]);

    ((void (*)(void *, void *))v31[2])(v31, v36);
  }

  else
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue([v27 outputDevices]);
    id v49 = [v37 count];

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputContextModification request](self, "request"));
    unsigned int v39 = [v38 shouldClearPredictedRoutes];

    if (v39)
    {
      sub_1001303E8((uint64_t)self, v27);
      v40 = objc_alloc(&OBJC_CLASS___MRGroupTopologyModificationRequest);
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MRDOutputContextModification request](self, "request"));
      id v47 = v29;
      id v42 = v26;
      v43 = v25;
      v44 = (void *)objc_claimAutoreleasedReturnValue([v41 requestDetails]);
      v45 = -[MRGroupTopologyModificationRequest initWithRequestDetails:type:outputDevices:]( v40,  "initWithRequestDetails:type:outputDevices:",  v44,  3LL,  &__NSArray0__struct);

      v25 = v43;
      id v26 = v42;
      id v29 = v47;

      id v46 =  [(id)objc_opt_class(self) _modifyPredictedOutputDevicesWithRequest:v45 outputContext:v27];
    }

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472LL;
    v51[2] = sub_100130544;
    v51[3] = &unk_1003A1E80;
    v53 = v31;
    v51[4] = self;
    id v52 = v28;
    id v54 = v49;
    sub_1001306C0((uint64_t)self, v27, v30, v51);

    v36 = v53;
  }
}

+ (id)_modifyPredictedOutputDevicesWithRequest:(id)a3 outputContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 requestDetails]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 requestID]);

  id v10 = [v5 type];
  v11 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v12 = MRGroupTopologyModificationRequestTypeDescription(v10);
  unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = -[NSString initWithFormat:](v11, "initWithFormat:", @"%@PredictedOutputDevices", v13);

  v15 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@<%@>",  v14,  v9);
  qos_class_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 requestDetails]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v16 reason]);

  if (v17)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 requestDetails]);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 reason]);
    -[NSMutableString appendFormat:](v15, "appendFormat:", @" for %@", v20);
  }

  uint64_t v21 = _MRLogForCategory(10LL, v18);
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    qos_class_t v62 = v15;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Request: %{public}@", buf, 0xCu);
  }

  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(+[MRUserSettings currentSettings](&OBJC_CLASS___MRUserSettings, "currentSettings"));
  unsigned __int8 v24 = [v23 supportPredictedRoutes];

  if ((v24 & 1) == 0)
  {
    id v29 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v30 = 132LL;
LABEL_13:
    v32 = -[NSError initWithMRError:](v29, "initWithMRError:", v30);
    goto LABEL_25;
  }

  if ([v6 type] != 1)
  {
    id v29 = objc_alloc(&OBJC_CLASS___NSError);
    uint64_t v30 = 32LL;
    goto LABEL_13;
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 outputDeviceUIDs]);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v6 predictedOutputDeviceUIDs]);
  id v27 = v26;
  id v58 = v25;
  if (v10 == (id)1)
  {
    id v33 = (id)objc_claimAutoreleasedReturnValue([v26 arrayByAddingObjectsFromArray:v25]);
  }

  else
  {
    if (v10 != (id)3)
    {
      if (v10 == (id)2)
      {
        v59[0] = _NSConcreteStackBlock;
        v59[1] = 3221225472LL;
        v59[2] = sub_100130F98;
        v59[3] = &unk_10039B1C0;
        id v60 = v25;
        uint64_t v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "msv_filter:", v59));
      }

      else
      {
        uint64_t v28 = 0LL;
      }

      goto LABEL_18;
    }

    id v33 = v25;
  }

  uint64_t v28 = (uint64_t)v33;
LABEL_18:
  v56 = (void *)v28;
  v34 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Setting predictedOutputDevices: <%@>",  v28);
  uint64_t v36 = _MRLogForCategory(10LL, v35);
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    qos_class_t v62 = (NSMutableString *)v14;
    __int16 v63 = 2114;
    v64 = v9;
    __int16 v65 = 2112;
    v66 = (NSError *)v34;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v55 = v34;

  id v57 = v27;
  v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"Existing predictedOutputDevices: <%@>",  v27);
  uint64_t v40 = _MRLogForCategory(10LL, v39);
  v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    qos_class_t v62 = (NSMutableString *)v14;
    __int16 v63 = 2114;
    v64 = v9;
    __int16 v65 = 2112;
    v66 = (NSError *)v38;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

  v32 = -[NSError initWithMRError:](objc_alloc(&OBJC_CLASS___NSError), "initWithMRError:", 132LL);
  id v42 = objc_alloc(&OBJC_CLASS___NSString);
  v43 = (void *)objc_claimAutoreleasedReturnValue([v6 predictedOutputDeviceUIDs]);
  v44 = -[NSString initWithFormat:](v42, "initWithFormat:", @"Final predictedOutputDevices: <%@>", v43);

  uint64_t v46 = _MRLogForCategory(10LL, v45);
  id v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    qos_class_t v62 = (NSMutableString *)v14;
    __int16 v63 = 2114;
    v64 = v9;
    __int16 v65 = 2112;
    v66 = (NSError *)v44;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Update: %{public}@<%{public}@> %@", buf, 0x20u);
  }

LABEL_25:
  uint64_t v48 = _MRLogForCategory(10LL, v31);
  id v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
  v50 = v49;
  if (v32)
  {
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      [v51 timeIntervalSinceDate:v7];
      *(_DWORD *)buf = 138544130;
      qos_class_t v62 = (NSMutableString *)v14;
      __int16 v63 = 2114;
      v64 = v9;
      __int16 v65 = 2114;
      v66 = v32;
      __int16 v67 = 2048;
      uint64_t v68 = v52;
      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "Response: %{public}@<%{public}@> returned with error <%{public}@> in %.4lf seconds",  buf,  0x2Au);
LABEL_30:
    }
  }

  else if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    [v51 timeIntervalSinceDate:v7];
    *(_DWORD *)buf = 138543874;
    qos_class_t v62 = (NSMutableString *)v14;
    __int16 v63 = 2114;
    v64 = v9;
    __int16 v65 = 2048;
    v66 = v53;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Response: %{public}@<%{public}@> returned in %.4lf seconds",  buf,  0x20u);
    goto LABEL_30;
  }

  return v32;
}

- (MRGroupTopologyModificationRequest)request
{
  return self->_request;
}

- (NSArray)discoveredConcreteOutputDevices
{
  return self->_discoveredConcreteOutputDevices;
}

- (NSArray)avOutputDevices
{
  return self->_avOutputDevices;
}

- (void).cxx_destruct
{
}

@end
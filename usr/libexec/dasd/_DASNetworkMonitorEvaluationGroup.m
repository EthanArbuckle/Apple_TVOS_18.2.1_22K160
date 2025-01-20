@interface _DASNetworkMonitorEvaluationGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isMonitoringActivityID:(id)a3;
- (BOOL)isMonitoringWithParameters:(id)a3 endpoint:(id)a4;
- (BOOL)isNetworkPathAvailable;
- (BOOL)stopMonitoringForActivityID:(id)a3;
- (NSMutableSet)activityIDs;
- (NWEndpoint)endpoint;
- (NWParameters)parameters;
- (OS_nw_path_evaluator)evaluator;
- (OS_os_log)log;
- (_DASNetworkMonitorEvaluationGroup)initWithEndpoint:(id)a3 parameters:(id)a4 activityID:(id)a5 callback:(id)a6 onQueue:(id)a7;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)startMonitoringForActivityID:(id)a3;
@end

@implementation _DASNetworkMonitorEvaluationGroup

- (_DASNetworkMonitorEvaluationGroup)initWithEndpoint:(id)a3 parameters:(id)a4 activityID:(id)a5 callback:(id)a6 onQueue:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS____DASNetworkMonitorEvaluationGroup;
  v18 = -[_DASNetworkMonitorEvaluationGroup init](&v36, "init");
  v19 = v18;
  if (!v18) {
    goto LABEL_4;
  }
  objc_storeStrong((id *)&v18->_endpoint, a3);
  objc_storeStrong((id *)&v19->_parameters, a4);
  id v20 = [v13 copyCEndpoint];
  id v21 = [v14 copyCParameters];
  uint64_t evaluator_for_endpoint = nw_path_create_evaluator_for_endpoint(v20, v21);
  evaluator = v19->_evaluator;
  v19->_evaluator = (OS_nw_path_evaluator *)evaluator_for_endpoint;

  uint64_t v24 = objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](&OBJC_CLASS___NSMutableSet, "setWithObject:", v15));
  activityIDs = v19->_activityIDs;
  v19->_activityIDs = (NSMutableSet *)v24;

  os_log_t v26 = os_log_create("com.apple.duetactivityscheduler", "NetworkMonitorEvaluationGroup");
  log = v19->_log;
  v19->_log = v26;

  v28 = v19->_evaluator;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_1000A2480;
  v33[3] = &unk_100117430;
  id v35 = v16;
  v29 = v19;
  v34 = v29;
  if ((nw_path_evaluator_set_update_handler(v28, v17, v33) & 1) != 0)
  {

LABEL_4:
    v30 = v19;
    goto LABEL_8;
  }

  v31 = v19->_log;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1000B8D3C(v31, v29);
  }

  v30 = 0LL;
LABEL_8:

  return v30;
}

- (void)startMonitoringForActivityID:(id)a3
{
  id v5 = a3;
  v4 = self->_activityIDs;
  objc_sync_enter(v4);
  -[NSMutableSet addObject:](self->_activityIDs, "addObject:", v5);
  objc_sync_exit(v4);
}

- (BOOL)stopMonitoringForActivityID:(id)a3
{
  id v4 = a3;
  id v5 = self->_activityIDs;
  objc_sync_enter(v5);
  -[NSMutableSet removeObject:](self->_activityIDs, "removeObject:", v4);
  id v6 = -[NSMutableSet count](self->_activityIDs, "count");
  if (!v6) {
    nw_path_evaluator_cancel(self->_evaluator);
  }
  objc_sync_exit(v5);

  return v6 == 0LL;
}

- (BOOL)isMonitoringActivityID:(id)a3
{
  id v4 = a3;
  id v5 = self->_activityIDs;
  objc_sync_enter(v5);
  LOBYTE(self) = -[NSMutableSet containsObject:](self->_activityIDs, "containsObject:", v4);
  objc_sync_exit(v5);

  return (char)self;
}

- (BOOL)isMonitoringWithParameters:(id)a3 endpoint:(id)a4
{
  id v6 = a4;
  parameters = self->_parameters;
  id v8 = a3;
  id v9 = -[NWParameters copyCParameters](parameters, "copyCParameters");
  id v10 = [v8 copyCParameters];

  else {
    unsigned __int8 v11 = 0;
  }

  return v11;
}

- (BOOL)isNetworkPathAvailable
{
  v2 = (nw_path *)nw_path_evaluator_copy_path(self->_evaluator, a2);
  BOOL v3 = nw_path_get_status(v2) != nw_path_status_unsatisfied;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (_DASNetworkMonitorEvaluationGroup *)a3;
  if (v4 == self)
  {
    unsigned __int8 v15 = 1;
  }

  else
  {
    v17.receiver = self;
    v17.super_class = (Class)&OBJC_CLASS____DASNetworkMonitorEvaluationGroup;
    if (-[_DASNetworkMonitorEvaluationGroup isEqual:](&v17, "isEqual:", v4))
    {
      id v5 = v4;
      id v6 = self->_activityIDs;
      objc_sync_enter(v6);
      endpoint = self->_endpoint;
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup endpoint](v5, "endpoint"));
      if (-[NWEndpoint isEqual:](endpoint, "isEqual:", v8))
      {
        parameters = self->_parameters;
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup parameters](v5, "parameters"));
        if (-[NWParameters isEqual:](parameters, "isEqual:", v10))
        {
          evaluator = self->_evaluator;
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup evaluator](v5, "evaluator"));
          if (-[OS_nw_path_evaluator isEqual:](evaluator, "isEqual:", v12))
          {
            activityIDs = self->_activityIDs;
            id v14 = (void *)objc_claimAutoreleasedReturnValue(-[_DASNetworkMonitorEvaluationGroup activityIDs](v5, "activityIDs"));
            unsigned __int8 v15 = -[NSMutableSet isEqual:](activityIDs, "isEqual:", v14);
          }

          else
          {
            unsigned __int8 v15 = 0;
          }
        }

        else
        {
          unsigned __int8 v15 = 0;
        }
      }

      else
      {
        unsigned __int8 v15 = 0;
      }

      objc_sync_exit(v6);
    }

    else
    {
      unsigned __int8 v15 = 0;
    }
  }

  return v15;
}

- (unint64_t)hash
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = (unint64_t)-[NWEndpoint hash](self->_endpoint, "hash");
  id v5 = -[NWParameters hash](self->_parameters, "hash");
  id v6 = -[OS_nw_path_evaluator hash](self->_evaluator, "hash");
  unint64_t v7 = v4 ^ (2LL * (void)v5) ^ (4LL * (void)v6) ^ (8LL * (void)-[NSMutableSet hash](self->_activityIDs, "hash"));
  objc_sync_exit(v3);

  return v7;
}

- (id)description
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> Activity IDs: %@",  objc_opt_class(self),  self,  self->_activityIDs);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_exit(v3);

  return v5;
}

- (id)debugDescription
{
  BOOL v3 = self->_activityIDs;
  objc_sync_enter(v3);
  unint64_t v4 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@: %p> Endpoint: %@, Parameters: %@, Activity IDs: %@",  objc_opt_class(self),  self,  self->_endpoint,  self->_parameters,  self->_activityIDs);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_sync_exit(v3);

  return v5;
}

- (NWEndpoint)endpoint
{
  return self->_endpoint;
}

- (NWParameters)parameters
{
  return self->_parameters;
}

- (NSMutableSet)activityIDs
{
  return self->_activityIDs;
}

- (OS_nw_path_evaluator)evaluator
{
  return self->_evaluator;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
}

@end
@interface MLRTrialManager
- (MLRTrialManager)init;
- (MLRTrialManager)initWithProvider:(id)a3;
- (NSMutableDictionary)shadowExperimentTasks;
- (id)shadowExperimentTasksForPluginID:(id)a3;
@end

@implementation MLRTrialManager

- (MLRTrialManager)init
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TRIEvaluationStatus freshProvider](&OBJC_CLASS___TRIEvaluationStatus, "freshProvider"));
  v4 = -[MLRTrialManager initWithProvider:](self, "initWithProvider:", v3);

  return v4;
}

- (MLRTrialManager)initWithProvider:(id)a3
{
  id v4 = a3;
  if (objc_opt_class(&OBJC_CLASS___TRIClient))
  {
    v37.receiver = self;
    v37.super_class = (Class)&OBJC_CLASS___MLRTrialManager;
    v5 = -[MLRTrialManager init](&v37, "init");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      if (!v4)
      {
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_100002214(v7, v8, v9, v10, v11, v12, v13, v14);
        }
      }

      id v36 = 0LL;
      v31 = _NSConcreteStackBlock;
      uint64_t v32 = 3221225472LL;
      v33 = sub_100001F34;
      v34 = &unk_100014640;
      v15 = v6;
      v35 = v15;
      unsigned __int8 v16 = [v4 enumerateActiveEvaluationsForMLRuntimeWithError:&v36 block:&v31];
      id v17 = v36;
      if ((v16 & 1) == 0)
      {
        v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel", v31, v32, v33, v34));
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1000021A0((uint64_t)v17, v18);
        }
      }

      shadowExperimentTasks = v5->_shadowExperimentTasks;
      v5->_shadowExperimentTasks = v15;
      v20 = v15;
    }

    self = v5;
    v21 = self;
  }

  else
  {
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[DESLogging coreChannel](&OBJC_CLASS___DESLogging, "coreChannel"));
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_10000216C(v22, v23, v24, v25, v26, v27, v28, v29);
    }

    v21 = 0LL;
  }

  return v21;
}

- (id)shadowExperimentTasksForPluginID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKeyedSubscript:]( self->_shadowExperimentTasks,  "objectForKeyedSubscript:",  v4));

    return v6;
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSInvalidArgumentException,  @"Nil pluginID",  0LL));
    objc_exception_throw(v8);
    return -[MLRTrialManager shadowExperimentTasks](v9, v10);
  }

- (NSMutableDictionary)shadowExperimentTasks
{
  return self->_shadowExperimentTasks;
}

- (void).cxx_destruct
{
}

@end
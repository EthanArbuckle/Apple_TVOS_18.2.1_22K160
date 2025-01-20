@interface DMDActivationiCloudAccountObserver
- (DMDActivationiCloudAccountObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 iCloudAccountPredicate:(id)a5;
- (NSString)DSID;
- (id)evaluatePredicateWithError:(id *)a3;
- (void)_extractComponentsFromPredicate:(id)a3;
- (void)setDSID:(id)a3;
@end

@implementation DMDActivationiCloudAccountObserver

- (DMDActivationiCloudAccountObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 iCloudAccountPredicate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DMDActivationiCloudAccountObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v12,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  v8);
  v10 = v9;
  if (v9) {
    -[DMDActivationiCloudAccountObserver _extractComponentsFromPredicate:](v9, "_extractComponentsFromPredicate:", v8);
  }

  return v10;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___ACAccountStore);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACAccountStore aa_primaryAppleAccount](v4, "aa_primaryAppleAccount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_personID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationiCloudAccountObserver DSID](self, "DSID"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationiCloudAccountObserver DSID](self, "DSID"));
    -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  [v6 isEqualToString:v8]);
  }

  else
  {
    -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:](self, "setLastPredicateEvaluationValue:", 1LL);
  }

  uint64_t v10 = DMFConfigurationEngineLog(v9);
  v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    unsigned int v14 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationiCloudAccountObserver DSID](self, "DSID"));
    int v18 = 138544386;
    v19 = v12;
    __int16 v20 = 2114;
    v21 = v13;
    __int16 v22 = 1024;
    unsigned int v23 = v14;
    __int16 v24 = 2114;
    v25 = v15;
    __int16 v26 = 2114;
    v27 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, DSID %{public}@, primary ac count DSID %{public}@",  (uint8_t *)&v18,  0x30u);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  return v16;
}

- (void)_extractComponentsFromPredicate:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 payloadDSID]);
  -[DMDActivationiCloudAccountObserver setDSID:](self, "setDSID:", v4);

  uint64_t v6 = DMFConfigurationEngineLog(v5);
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationiCloudAccountObserver DSID](self, "DSID"));
    int v11 = 138543874;
    objc_super v12 = v8;
    __int16 v13 = 2114;
    unsigned int v14 = v9;
    __int16 v15 = 2114;
    v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Predicate type: %{public}@ with unique identifier: %{public}@ extracted DSID: %{public}@",  (uint8_t *)&v11,  0x20u);
  }
}

- (NSString)DSID
{
  return self->_DSID;
}

- (void)setDSID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
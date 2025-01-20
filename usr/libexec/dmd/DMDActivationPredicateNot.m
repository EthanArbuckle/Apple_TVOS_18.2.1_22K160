@interface DMDActivationPredicateNot
- (DMDActivationPredicateNot)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObserver:(id)a5 predicate:(id)a6;
- (DMDActivationPredicateObserver)subPredicateObserver;
- (id)evaluatePredicateWithError:(id *)a3;
- (id)metadata;
- (void)setSubPredicateObserver:(id)a3;
@end

@implementation DMDActivationPredicateNot

- (DMDActivationPredicateNot)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 subPredicateObserver:(id)a5 predicate:(id)a6
{
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateNot;
  v12 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v15,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  a6);
  v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_subPredicateObserver, a5);
  }

  return v13;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateNot subPredicateObserver](self, "subPredicateObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 evaluatePredicateWithError:a3]);

  if (v6)
  {
    uint64_t v7 = DMFConfigurationEngineLog( -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  [v6 BOOLValue] ^ 1));
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      int v13 = 138543874;
      v14 = v9;
      __int16 v15 = 2114;
      v16 = v10;
      __int16 v17 = 1024;
      unsigned int v18 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d",  (uint8_t *)&v13,  0x1Cu);
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue]( self,  "lastPredicateEvaluationValue")));
  }

  else
  {
    id v11 = 0LL;
  }

  return v11;
}

- (id)metadata
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___DMDActivationPredicateNot;
  id v3 = -[DMDActivationPredicateObserver metadata](&v9, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateNot subPredicateObserver](self, "subPredicateObserver"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 metadata]);

  if (v6)
  {
    v10 = v6;
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v10, 1LL));
    [v4 setObject:v7 forKeyedSubscript:DMFDeclarationStatePredicateSubPredicatesKey];
  }

  return v4;
}

- (DMDActivationPredicateObserver)subPredicateObserver
{
  return self->_subPredicateObserver;
}

- (void)setSubPredicateObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
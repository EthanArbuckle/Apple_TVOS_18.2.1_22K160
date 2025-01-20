@interface DMDActivationPredicateTrue
- (id)evaluatePredicateWithError:(id *)a3;
@end

@implementation DMDActivationPredicateTrue

- (id)evaluatePredicateWithError:(id *)a3
{
  uint64_t v4 = DMFConfigurationEngineLog( -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  1LL));
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    int v9 = 138543874;
    v10 = v6;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 1024;
    unsigned int v14 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d",  (uint8_t *)&v9,  0x1Cu);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue]( self,  "lastPredicateEvaluationValue")));
}

@end
@interface DMDActivationPredicateAll
- (id)evaluatePredicateWithError:(id *)a3;
@end

@implementation DMDActivationPredicateAll

- (id)evaluatePredicateWithError:(id *)a3
{
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateCompound subPredicateObservers](self, "subPredicateObservers", 0LL));
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) evaluatePredicateWithError:a3]);
        if (!v10)
        {

          return 0LL;
        }

        v11 = v10;
        unsigned int v12 = [v10 BOOLValue];

        if (!v12)
        {
          uint64_t v13 = 0LL;
          goto LABEL_13;
        }

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  uint64_t v13 = 1LL;
LABEL_13:

  uint64_t v15 = DMFConfigurationEngineLog( -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  v13));
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    unsigned int v19 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    *(_DWORD *)buf = 138543874;
    v25 = v17;
    __int16 v26 = 2114;
    v27 = v18;
    __int16 v28 = 1024;
    unsigned int v29 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d",  buf,  0x1Cu);
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue]( self,  "lastPredicateEvaluationValue")));
}

@end
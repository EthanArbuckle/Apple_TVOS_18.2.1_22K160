@interface DMDActivationOneTimeObserver
- (BOOL)_extractComponentsFromPredicate:(id)a3;
- (DMDActivationOneTimeObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 oneTimePredicate:(id)a5;
- (NSDate)endDate;
- (id)evaluatePredicateWithError:(id *)a3;
- (void)_registerPredicateObserver;
- (void)invalidate;
- (void)setEndDate:(id)a3;
@end

@implementation DMDActivationOneTimeObserver

- (DMDActivationOneTimeObserver)initWithDelegate:(id)a3 uniqueIdentifier:(id)a4 oneTimePredicate:(id)a5
{
  id v8 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___DMDActivationOneTimeObserver;
  v9 = -[DMDActivationPredicateObserver initWithDelegate:uniqueIdentifier:predicate:]( &v13,  "initWithDelegate:uniqueIdentifier:predicate:",  a3,  a4,  v8);
  v10 = v9;
  if (v9)
  {
    if (!-[DMDActivationOneTimeObserver _extractComponentsFromPredicate:](v9, "_extractComponentsFromPredicate:", v8))
    {
      v11 = 0LL;
      goto LABEL_6;
    }

    -[DMDActivationOneTimeObserver _registerPredicateObserver](v10, "_registerPredicateObserver");
  }

  v11 = v10;
LABEL_6:

  return v11;
}

- (id)evaluatePredicateWithError:(id *)a3
{
  v4 = objc_opt_new(&OBJC_CLASS___NSDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  -[DMDActivationPredicateObserver setLastPredicateEvaluationValue:]( self,  "setLastPredicateEvaluationValue:",  -[NSDate compare:](v4, "compare:", v5) == NSOrderedAscending);

  uint64_t v7 = DMFConfigurationEngineLog(v6);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    unsigned int v11 = -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    int v15 = 138544386;
    v16 = v9;
    __int16 v17 = 2114;
    v18 = v10;
    __int16 v19 = 1024;
    unsigned int v20 = v11;
    __int16 v21 = 2114;
    v22 = v12;
    __int16 v23 = 2114;
    v24 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ evaluated predicate: %d, end date: %{public}@, now: %{public}@",  (uint8_t *)&v15,  0x30u);
  }

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[DMDActivationPredicateObserver lastPredicateEvaluationValue](self, "lastPredicateEvaluationValue")));
  return v13;
}

- (void)invalidate
{
  id v3 = [@"com.apple.alarm" UTF8String];
  id v4 = objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
  xpc_set_event(v3, [v4 UTF8String], 0);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___DMDActivationOneTimeObserver;
  -[DMDActivationPredicateObserver invalidate](&v5, "invalidate");
}

- (BOOL)_extractComponentsFromPredicate:(id)a3
{
  id v4 = a3;
  objc_super v5 = objc_opt_new(&OBJC_CLASS___NSDate);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 payloadDateTime]);

  if (!v6)
  {
    uint64_t v18 = DMFConfigurationEngineLog(v7);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100060550(self);
    }
    goto LABEL_10;
  }

  id v8 = objc_opt_new(&OBJC_CLASS___NSISO8601DateFormatter);
  -[os_log_s setFormatOptions:](v8, "setFormatOptions:", 1907LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s dateFromString:](v8, "dateFromString:", v6));
  -[DMDActivationOneTimeObserver setEndDate:](self, "setEndDate:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  if (!v10)
  {
    uint64_t v19 = DMFConfigurationEngineLog(v11);
    unsigned int v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100060608(self);
    }

LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }

  uint64_t v13 = DMFConfigurationEngineLog(v12);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  BOOL v14 = 1;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v15 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    int v22 = 138544642;
    __int16 v23 = v15;
    __int16 v24 = 2114;
    v25 = v16;
    __int16 v26 = 2048;
    uint64_t v27 = 0LL;
    __int16 v28 = 2114;
    v29 = v6;
    __int16 v30 = 2114;
    v31 = v17;
    __int16 v32 = 2114;
    v33 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Predicate type: %{public}@ with unique identifier: %{public}@ extracted seconds: %f, end time string: %{public}@, end date: %{public}@, now: %{public}@",  (uint8_t *)&v22,  0x3Eu);
  }

- (void)_registerPredicateObserver
{
  id v3 = objc_opt_new(&OBJC_CLASS___NSDate);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  @"com.apple.dmd.alarm",  v4));

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
  [v6 timeIntervalSinceDate:v3];
  double v8 = v7;

  if (v8 <= 0.0)
  {
    uint64_t v20 = DMFConfigurationEngineLog(v9);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1000606C0(self);
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
    [v10 timeIntervalSince1970];
    int64_t v12 = (uint64_t)(v11 * 1000000000.0);

    uint64_t v14 = DMFConfigurationEngineLog(v13);
    int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver predicateType](self, "predicateType"));
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPredicateObserver uniqueIdentifier](self, "uniqueIdentifier"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationOneTimeObserver endDate](self, "endDate"));
      *(_DWORD *)buf = 138544642;
      int v22 = v16;
      __int16 v23 = 2114;
      __int16 v24 = v17;
      __int16 v25 = 2114;
      __int16 v26 = v5;
      __int16 v27 = 2114;
      __int16 v28 = v18;
      __int16 v29 = 2048;
      int64_t v30 = v12;
      __int16 v31 = 2114;
      __int16 v32 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Predicate type: %{public}@ with unique identifier: %{public}@ will schedule alarm with identifier: %{public}@ to fire at date: %{public}@, epoch time in nano seconds: %lld, now: %{public}@",  buf,  0x3Eu);
    }

    uint64_t v19 = (os_log_s *)xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v19, (const char *)[@"ShouldWake" UTF8String], 0);
    xpc_dictionary_set_date(v19, (const char *)[@"Date" UTF8String], v12);
    xpc_set_event( [@"com.apple.alarm" UTF8String], objc_msgSend(v5, "UTF8String"), v19);
  }
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

@end
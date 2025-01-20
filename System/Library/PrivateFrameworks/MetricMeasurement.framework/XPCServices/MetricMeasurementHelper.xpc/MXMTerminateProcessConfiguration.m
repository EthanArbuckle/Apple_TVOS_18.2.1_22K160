@interface MXMTerminateProcessConfiguration
+ (id)configWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)requiredForTestContinuation;
- (NSString)processName;
- (double)timeout;
- (void)setProcessName:(id)a3;
- (void)setRequiredForTestContinuation:(BOOL)a3;
- (void)setTimeout:(double)a3;
@end

@implementation MXMTerminateProcessConfiguration

+ (id)configWithDictionary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if (!v5 || (uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    uint64_t v7 = _MXMGetLog();
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Invalid dictionary received. Unable to create MXMTerminateProcessConfiguration.",  buf,  2u);
    }

    if (a4)
    {
      NSErrorUserInfoKey v46 = NSLocalizedDescriptionKey;
      v47 = @"terminateProcessConfigDictionary is not a valid dictionary.";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v47,  &v46,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMTerminateProcessConfigurationErrorDomain",  1LL,  v9));
    }
  }

  v10 = objc_alloc_init(&OBJC_CLASS___MXMTerminateProcessConfiguration);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"processName"]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"processName"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) == 0)
    {
      NSErrorUserInfoKey v44 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a string type.",  @"processName"));
      v45 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v45,  &v44,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMTerminateProcessConfigurationErrorDomain",  1LL,  v16));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"processName"]);
    -[MXMTerminateProcessConfiguration setProcessName:](v10, "setProcessName:", v17);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"timeout"]);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"timeout"]);
    uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v21 = objc_opt_isKindOfClass(v19, v20);

    if ((v21 & 1) == 0)
    {
      NSErrorUserInfoKey v42 = NSLocalizedDescriptionKey;
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a double type.",  @"timeout"));
      v43 = v22;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v43,  &v42,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMTerminateProcessConfigurationErrorDomain",  1LL,  v23));
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"timeout"]);
    [v24 doubleValue];
    -[MXMTerminateProcessConfiguration setTimeout:](v10, "setTimeout:");
  }

  v25 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
    uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v28 = objc_opt_isKindOfClass(v26, v27);

    if ((v28 & 1) == 0)
    {
      NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a BOOLean type.",  @"requiredForTestContinuation"));
      v41 = v29;
      v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMTerminateProcessConfigurationErrorDomain",  1LL,  v30));
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
    if ([v31 unsignedLongValue])
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
      id v33 = [v32 unsignedLongValue];

      if (v33 == (id)1)
      {
LABEL_22:
        v35 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
        -[MXMTerminateProcessConfiguration setRequiredForTestContinuation:]( v10,  "setRequiredForTestContinuation:",  [v35 BOOLValue]);

        goto LABEL_23;
      }

      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a BOOLean type.",  @"requiredForTestContinuation"));
      v39 = v31;
      v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMTerminateProcessConfigurationErrorDomain",  1LL,  v34));
    }

    goto LABEL_22;
  }

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (BOOL)requiredForTestContinuation
{
  return self->_requiredForTestContinuation;
}

- (void)setRequiredForTestContinuation:(BOOL)a3
{
  self->_requiredForTestContinuation = a3;
}

- (void).cxx_destruct
{
}

@end
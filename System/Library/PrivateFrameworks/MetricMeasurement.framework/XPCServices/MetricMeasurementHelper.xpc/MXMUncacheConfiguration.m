@interface MXMUncacheConfiguration
+ (id)configWithDictionary:(id)a3 error:(id *)a4;
- (BOOL)requiredForTestContinuation;
- (NSString)filepath;
- (void)setFilepath:(id)a3;
- (void)setRequiredForTestContinuation:(BOOL)a3;
@end

@implementation MXMUncacheConfiguration

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
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "Invalid dictionary received. Unable to create MXMUncacheConfiguration.",  buf,  2u);
    }

    if (a4)
    {
      NSErrorUserInfoKey v38 = NSLocalizedDescriptionKey;
      v39 = @"uncacheConfigDictionary is not a valid dictionary.";
      v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v39,  &v38,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMUncacheConfigurationErrorDomain",  1LL,  v9));
    }
  }

  v10 = objc_alloc_init(&OBJC_CLASS___MXMUncacheConfiguration);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"filepath"]);

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"filepath"]);
    uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v12, v13);

    if ((isKindOfClass & 1) == 0)
    {
      NSErrorUserInfoKey v36 = NSLocalizedDescriptionKey;
      v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a string type.",  @"filepath"));
      v37 = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v37,  &v36,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMUncacheConfigurationErrorDomain",  1LL,  v16));
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"filepath"]);
    id v18 = [v17 copy];
    -[MXMUncacheConfiguration setFilepath:](v10, "setFilepath:", v18);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
    uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char v22 = objc_opt_isKindOfClass(v20, v21);

    if ((v22 & 1) == 0)
    {
      NSErrorUserInfoKey v34 = NSLocalizedDescriptionKey;
      v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a BOOLean type.",  @"requiredForTestContinuation"));
      v35 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v35,  &v34,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMUncacheConfigurationErrorDomain",  1LL,  v24));
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
    if ([v25 unsignedLongValue])
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
      id v27 = [v26 unsignedLongValue];

      if (v27 == (id)1)
      {
LABEL_18:
        v29 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForKey:@"requiredForTestContinuation"]);
        -[MXMUncacheConfiguration setRequiredForTestContinuation:]( v10,  "setRequiredForTestContinuation:",  [v29 BOOLValue]);

        goto LABEL_19;
      }

      NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
      v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ is not a BOOLean type.",  @"requiredForTestContinuation"));
      v33 = v25;
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
      *a4 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MXMUncacheConfigurationErrorDomain",  1LL,  v28));
    }

    goto LABEL_18;
  }

- (NSString)filepath
{
  return self->_filepath;
}

- (void)setFilepath:(id)a3
{
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
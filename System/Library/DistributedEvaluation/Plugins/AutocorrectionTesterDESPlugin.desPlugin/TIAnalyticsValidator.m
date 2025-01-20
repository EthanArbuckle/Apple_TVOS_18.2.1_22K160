@interface TIAnalyticsValidator
- (TIAnalyticsValidator)initWithRequiredFieldValues:(id)a3 andOptionalFieldValues:(id)a4;
- (id)validateEvent:(id)a3 withExpectedFieldValues:(id)a4;
@end

@implementation TIAnalyticsValidator

- (TIAnalyticsValidator)initWithRequiredFieldValues:(id)a3 andOptionalFieldValues:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TIAnalyticsValidator;
  v9 = -[TIAnalyticsValidator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requiredFieldValues, a3);
    objc_storeStrong((id *)&v10->_optionalFieldValues, a4);
  }

  return v10;
}

- (id)validateEvent:(id)a3 withExpectedFieldValues:(id)a4
{
  id v67 = a3;
  id v6 = a4;
  v66 = objc_opt_new(&OBJC_CLASS___TIAnalyticsValidationResult);
  __int128 v84 = 0u;
  __int128 v85 = 0u;
  __int128 v86 = 0u;
  __int128 v87 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary allKeys](self->_optionalFieldValues, "allKeys"));
  id v8 = [v7 countByEnumeratingWithState:&v84 objects:v92 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v85;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v85 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v84 + 1) + 8LL * (void)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_requiredFieldValues, "objectForKey:", v12));

        if (v13)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' is found in both the required and optional field values",  v12));
          -[TIAnalyticsValidationResult addError:](v66, "addError:", v14);
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v84 objects:v92 count:16];
    }

    while (v9);
  }

  __int128 v82 = 0u;
  __int128 v83 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  id obj = v6;
  id v15 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v81;
    do
    {
      v18 = 0LL;
      do
      {
        if (*(void *)v81 != v17) {
          objc_enumerationMutation(obj);
        }
        v19 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)v18);
        if (([v19 isEqualToString:@"finalPreferenceValue"] & 1) == 0)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_requiredFieldValues, "objectForKey:", v19));
          if (v20) {
            goto LABEL_17;
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_optionalFieldValues, "objectForKey:", v19));

          if (!v21)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' in the expected field values is not found in the required or optional field values",  v19));
            -[TIAnalyticsValidationResult addError:](v66, "addError:", v20);
LABEL_17:
          }
        }

        v18 = (char *)v18 + 1;
      }

      while (v16 != v18);
      id v22 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      id v16 = v22;
    }

    while (v22);
  }

  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v76 = 0u;
  __int128 v77 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v67 allKeys]);
  id v24 = [v23 countByEnumeratingWithState:&v76 objects:v90 count:16];
  if (!v24) {
    goto LABEL_36;
  }
  id v25 = v24;
  uint64_t v26 = *(void *)v77;
  do
  {
    v27 = 0LL;
    do
    {
      if (*(void *)v77 != v26) {
        objc_enumerationMutation(v23);
      }
      v28 = *(void **)(*((void *)&v76 + 1) + 8LL * (void)v27);
      if (([v28 isEqualToString:@"finalPreferenceValue"] & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_requiredFieldValues, "objectForKey:", v28));
        if (v29) {
          goto LABEL_30;
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_optionalFieldValues, "objectForKey:", v28));

        if (!v30)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' unexpected",  v28));
          -[TIAnalyticsValidationResult addError:](v66, "addError:", v29);
LABEL_30:
        }
      }

      v27 = (char *)v27 + 1;
    }

    while (v25 != v27);
    id v31 = [v23 countByEnumeratingWithState:&v76 objects:v90 count:16];
    id v25 = v31;
  }

  while (v31);
LABEL_36:

  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v72 = 0u;
  __int128 v73 = 0u;
  v32 = self->_requiredFieldValues;
  id v33 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v72,  v89,  16LL);
  if (!v33) {
    goto LABEL_53;
  }
  id v34 = v33;
  uint64_t v35 = *(void *)v73;
  while (2)
  {
    uint64_t v36 = 0LL;
    while (2)
    {
      if (*(void *)v73 != v35) {
        objc_enumerationMutation(v32);
      }
      uint64_t v37 = *(void *)(*((void *)&v72 + 1) + 8 * v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue([v67 objectForKey:v37]);
      if (!v38
        || (v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null")),
            v39,
            v38 == v39))
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' missing",  v37));
        -[TIAnalyticsValidationResult addError:](v66, "addError:", v43);
      }

      else
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue([obj objectForKey:v37]);
        v41 = v40;
        if (v40) {
          id v42 = v40;
        }
        else {
          id v42 = (id)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_requiredFieldValues, "objectForKey:", v37));
        }
        v43 = v42;

        uint64_t v44 = objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
        v45 = v43;
        if (v43 == (void *)v44)
        {
LABEL_50:
        }

        else
        {
          v46 = (void *)v44;
          unsigned __int8 v47 = [v38 isEqual:v43];

          if ((v47 & 1) == 0)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Field '%@' expected: %@ actual: %@",  v37,  v43,  v38));
            -[TIAnalyticsValidationResult addError:](v66, "addError:", v45);
            goto LABEL_50;
          }
        }
      }

      if (v34 != (id)++v36) {
        continue;
      }
      break;
    }

    id v34 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v32,  "countByEnumeratingWithState:objects:count:",  &v72,  v89,  16LL);
    if (v34) {
      continue;
    }
    break;
  }

- (void).cxx_destruct
{
}

@end
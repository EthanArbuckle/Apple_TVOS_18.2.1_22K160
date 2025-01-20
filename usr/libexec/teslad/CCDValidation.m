@interface CCDValidation
+ (BOOL)validateCloudConfiguration:(id)a3 withResultDictionary:(id)a4;
+ (BOOL)validateGroupDependenciesInCloudConfiguration:(id)a3;
+ (id)cloudConfigurationValidationDictionary;
@end

@implementation CCDValidation

+ (id)cloudConfigurationValidationDictionary
{
  if (qword_100021628 != -1) {
    dispatch_once(&qword_100021628, &stru_100018C68);
  }
  return (id)qword_100021620;
}

+ (BOOL)validateCloudConfiguration:(id)a3 withResultDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  uint64_t isKindOfClass = objc_opt_isKindOfClass(v6, v8);
  if ((isKindOfClass & 1) == 0)
  {
    v26 = *(os_log_s **)(DEPLogObjects(isKindOfClass, v10) + 8);
    BOOL v25 = 0;
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "Cloud configuration is not a dictionary!",  buf,  2u);
LABEL_19:
    BOOL v25 = 0;
    goto LABEL_20;
  }

  id v11 = [a1 validateGroupDependenciesInCloudConfiguration:v6];
  if (!(_DWORD)v11) {
    goto LABEL_19;
  }
  v13 = *(os_log_s **)(DEPLogObjects(v11, v12) + 8);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Cloud configuration group dependencies are valid.",  buf,  2u);
  }

  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v14 = (id)objc_claimAutoreleasedReturnValue([a1 cloudConfigurationValidationDictionary]);
  id v15 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v30;
    while (2)
    {
      for (i = 0LL; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)i);
        v20 = objc_alloc(&OBJC_CLASS___CCDValidationGroupInfo);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v19, (void)v29));
        v22 = -[CCDValidationGroupInfo initWithName:validationInfo:](v20, "initWithName:validationInfo:", v19, v21);

        BOOL v23 = -[CCDValidationInfo validateSelfWithDictionary:resultsDictionary:]( v22,  "validateSelfWithDictionary:resultsDictionary:",  v6,  v7);
        if (!v23)
        {
          v27 = *(os_log_s **)(DEPLogObjects(v23, v24) + 8);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Cloud configuration is NOT valid.",  buf,  2u);
          }

          goto LABEL_19;
        }
      }

      id v16 = [v14 countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  BOOL v25 = 1;
LABEL_20:

  return v25;
}

+ (BOOL)validateGroupDependenciesInCloudConfiguration:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a3 allKeys]);
  if ([v3 containsObject:@"user"])
  {
    else {
      unsigned int v4 = [v3 containsObject:@"enrollment"] ^ 1;
    }
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

@end
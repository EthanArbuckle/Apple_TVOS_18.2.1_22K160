@interface CCDValidationGroupInfo
- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (CCDValidationGroupInfo)initWithName:(id)a3 validationInfo:(id)a4;
- (NSArray)keyInfo;
- (id)_mutableKeyInfoArrayFromValidationInfo:(id)a3;
- (void)setKeyInfo:(id)a3;
@end

@implementation CCDValidationGroupInfo

- (CCDValidationGroupInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CCDValidationGroupInfo;
  v7 = -[CCDValidationInfo initWithName:validationInfo:](&v12, "initWithName:validationInfo:", a3, v6);
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = objc_claimAutoreleasedReturnValue( -[CCDValidationGroupInfo _mutableKeyInfoArrayFromValidationInfo:]( v7,  "_mutableKeyInfoArrayFromValidationInfo:",  v6));
    keyInfo = v8->_keyInfo;
    v8->_keyInfo = (NSArray *)v9;
  }

  return v8;
}

- (id)_mutableKeyInfoArrayFromValidationInfo:(id)a3
{
  id v3 = a3;
  v5 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"keyInfo"]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)i);
        objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v11]);
        v13 = -[CCDValidationKeyInfo initWithName:validationInfo:]( objc_alloc(&OBJC_CLASS___CCDValidationKeyInfo),  "initWithName:validationInfo:",  v11,  v12);
        [v5 addObject:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }

    while (v8);
  }

  return v5;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);

  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationGroupInfo keyInfo](self, "keyInfo", 0LL));
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v25;
    while (2)
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        __int128 v15 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)i);
        id v16 = [v15 validateSelfWithDictionary:v9 resultsDictionary:v7];
        if ((v16 & 1) == 0)
        {
          v19 = *(void **)(DEPLogObjects(v16, v17) + 8);
          if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
          {
            v20 = v19;
            v21 = (void *)objc_claimAutoreleasedReturnValue([v9 description]);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
            *(_DWORD *)buf = 138543618;
            v29 = v21;
            __int16 v30 = 2114;
            v31 = v22;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "Validation error in the following part of cloud config dictionary: \n %{public}@\n Validation information: %{public}@",  buf,  0x16u);
          }

          BOOL v18 = 0;
          goto LABEL_13;
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 1;
LABEL_13:

  return v18;
}

- (NSArray)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
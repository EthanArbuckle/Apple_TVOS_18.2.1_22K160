@interface EligibilityAsset
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (id)_policiesForRawArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4;
- (unint64_t)hash;
- (void)_initEnabledKeyWithDictionary:(id)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setName:(id)a3;
@end

@implementation EligibilityAsset

- (id)_policiesForRawArray:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  if (v3)
  {
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v22;
      do
      {
        v9 = 0LL;
        do
        {
          if (*(void *)v22 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)v9);
          uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
          {
            id v12 = v10;
            v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472LL;
            v19[2] = sub_10001877C;
            v19[3] = &unk_100034DE0;
            v14 = v13;
            v20 = v14;
            [v12 enumerateKeysAndObjectsUsingBlock:v19];
            if (-[NSMutableDictionary count](v14, "count"))
            {
              id v15 = -[NSMutableDictionary copy](v14, "copy");
              -[NSMutableArray addObject:](v4, "addObject:", v15);
            }
          }

          else
          {
            id v16 = sub_10000C968();
            id v12 = (id)objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 136315394;
              v26 = "-[EligibilityAsset _policiesForRawArray:]";
              __int16 v27 = 2112;
              v28 = @"Policies";
              _os_log_fault_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_FAULT,  "%s: Mobile Asset has a policy in %@ that is not of NSDictionary type",  buf,  0x16u);
            }
          }

          v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
      }

      while (v7);
    }

    id v17 = -[NSMutableArray copy](v4, "copy");
  }

  else
  {
    id v17 = 0LL;
  }

  return v17;
}

- (void)_initEnabledKeyWithDictionary:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:@"Enabled"]);
  if (v4)
  {
    id v7 = v4;
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v7, v5) & 1) != 0) {
      unsigned __int8 v6 = [v7 BOOLValue];
    }
    else {
      unsigned __int8 v6 = 1;
    }
    v4 = v7;
  }

  else
  {
    unsigned __int8 v6 = 1;
  }

  self->_isEnabled = v6;
}

- (id)initForMobileAssetRootKey:(id)a3 withDictionary:(id)a4
{
  id v7 = (__CFString *)a3;
  id v8 = a4;
  v54.receiver = self;
  v54.super_class = (Class)&OBJC_CLASS___EligibilityAsset;
  v9 = -[EligibilityAsset init](&v54, "init");
  if (!v9)
  {
LABEL_52:
    v18 = v9;
    goto LABEL_53;
  }

  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v7]);
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    objc_storeStrong((id *)&v9->_name, a3);
    -[EligibilityAsset _initEnabledKeyWithDictionary:](v9, "_initEnabledKeyWithDictionary:", v11);
    if (-[EligibilityAsset conformsToProtocol:]( v9,  "conformsToProtocol:",  &OBJC_PROTOCOL___LocatedCountryAssetProtocol_private))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Country Codes"]);
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v14 = v12;
      if ((objc_opt_isKindOfClass(v14, v13) & 1) != 0) {
        id v15 = v14;
      }
      else {
        id v15 = 0LL;
      }

      if (v15 && (uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSString), sub_100017A60(v15, v19)))
      {
        v20 = v9;
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15));
        -[EligibilityAsset setCountryCodes:](v20, "setCountryCodes:", v21);
      }

      else
      {
        id v22 = sub_10000C968();
        __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v57 = 2112;
          v58 = @"Country Codes";
          _os_log_error_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_ERROR,  "%s: Mobile Asset is missing key %@ of NSArray type",  buf,  0x16u);
        }
      }
    }

    if (-[EligibilityAsset conformsToProtocol:]( v9,  "conformsToProtocol:",  &OBJC_PROTOCOL___GracePeriodAssetProtocol_private))
    {
      __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Grace Period"]);
      uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v25 = v23;
      if ((objc_opt_isKindOfClass(v25, v24) & 1) != 0) {
        id v26 = v25;
      }
      else {
        id v26 = 0LL;
      }

      __int16 v27 = v9;
      if (v26)
      {
        id v28 = [v26 unsignedIntegerValue];
      }

      else
      {
        id v29 = sub_10000C968();
        v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v57 = 2112;
          v58 = @"Grace Period";
          _os_log_error_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_ERROR,  "%s: Mobile Asset is missing key %@ of NSNumber type",  buf,  0x16u);
        }

        id v28 = 0LL;
      }

      -[EligibilityAsset setGracePeriodInSeconds:](v27, "setGracePeriodInSeconds:", v28);
    }

    if (-[EligibilityAsset conformsToProtocol:]( v9,  "conformsToProtocol:",  &OBJC_PROTOCOL___BillingCountryAssetProtocol_private))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Billing Countries"]);
      uint64_t v32 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v33 = v31;
      if ((objc_opt_isKindOfClass(v33, v32) & 1) != 0) {
        id v34 = v33;
      }
      else {
        id v34 = 0LL;
      }

      if (v34 && (uint64_t v35 = objc_opt_class(&OBJC_CLASS___NSString), sub_100017A60(v34, v35)))
      {
        v36 = v9;
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v34));
        -[EligibilityAsset setBillingCountryCodes:](v36, "setBillingCountryCodes:", v37);
      }

      else
      {
        id v38 = sub_10000C968();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v57 = 2112;
          v58 = @"Billing Countries";
          _os_log_error_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_ERROR,  "%s: Mobile Asset is missing key %@ of NSArray type",  buf,  0x16u);
        }
      }
    }

    if (-[EligibilityAsset conformsToProtocol:]( v9,  "conformsToProtocol:",  &OBJC_PROTOCOL___RegionSKUAssetProtocol_private))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Region SKUs"]);
      uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v41 = v39;
      if ((objc_opt_isKindOfClass(v41, v40) & 1) != 0) {
        id v42 = v41;
      }
      else {
        id v42 = 0LL;
      }

      if (v42 && (uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSString), sub_100017A60(v42, v43)))
      {
        v44 = v9;
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v42));
        -[EligibilityAsset setRegionSKUs:](v44, "setRegionSKUs:", v45);
      }

      else
      {
        id v46 = sub_10000C968();
        v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
          __int16 v57 = 2112;
          v58 = @"Region SKUs";
          _os_log_error_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_ERROR,  "%s: Mobile Asset is missing key %@ of NSArray type",  buf,  0x16u);
        }
      }
    }

    if (-[EligibilityAsset conformsToProtocol:]( v9,  "conformsToProtocol:",  &OBJC_PROTOCOL___PolicyAssetProtocol_private))
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKey:@"Policies"]);
      uint64_t v48 = objc_opt_class(&OBJC_CLASS___NSArray);
      id v49 = v47;
      if ((objc_opt_isKindOfClass(v49, v48) & 1) != 0) {
        id v50 = v49;
      }
      else {
        id v50 = 0LL;
      }

      v51 = v9;
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset _policiesForRawArray:](v51, "_policiesForRawArray:", v50));
      -[EligibilityAsset setPolicies:](v51, "setPolicies:", v52);
    }

    goto LABEL_52;
  }

  id v16 = sub_10000C968();
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v56 = "-[EligibilityAsset initForMobileAssetRootKey:withDictionary:]";
    __int16 v57 = 2112;
    v58 = v7;
    _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Mobile Asset does not contain the %@ domain",  buf,  0x16u);
  }

  v18 = 0LL;
LABEL_53:

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setName:v7];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (EligibilityAsset *)a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___EligibilityAsset;
  if (!-[EligibilityAsset isEqual:](&v13, "isEqual:", v4)) {
    goto LABEL_9;
  }
  if (v4 == self)
  {
    char v9 = 1;
    goto LABEL_11;
  }

  uint64_t v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    unsigned __int8 v6 = v4;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](v6, "name"));
    char v9 = sub_1000179E0(v7, v8);

    if ((v9 & 1) == 0)
    {
      id v10 = sub_10000C968();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        id v15 = "-[EligibilityAsset isEqual:]";
        __int16 v16 = 2080;
        id v17 = "name";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", buf, 0x16u);
      }
    }
  }

  else
  {
LABEL_9:
    char v9 = 0;
  }

- (id)description
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityAsset name](self, "name"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[Eligibility Asset name:%@]",  v2));

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (void).cxx_destruct
{
}

@end
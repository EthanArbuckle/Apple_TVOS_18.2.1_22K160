@interface CCDValidationKeyInfo
- (BOOL)_validateCertificateArrayInDictionary:(id)a3;
- (BOOL)_validateCredentialTokenInDictionary:(id)a3;
- (BOOL)_validateDictionaryInDictionary:(id)a3 resultsDictionary:(id)a4;
- (BOOL)_validateHttpsURLStringInDictionary:(id)a3;
- (BOOL)_validateNumberInDictionary:(id)a3;
- (BOOL)_validateStringArrayInDictionary:(id)a3;
- (BOOL)_validateStringInDictionary:(id)a3;
- (BOOL)_validateUnstructureddDictionaryInDictionary:(id)a3;
- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (CCDValidationKeyInfo)initWithName:(id)a3 validationInfo:(id)a4;
- (NSArray)subKeys;
- (NSString)destinationKey;
- (id)_certificateDataFromBase64EncodedString:(id)a3;
- (id)description;
- (unint64_t)validationType;
- (void)setDestinationKey:(id)a3;
- (void)setSubKeys:(id)a3;
- (void)setValidationType:(unint64_t)a3;
@end

@implementation CCDValidationKeyInfo

- (CCDValidationKeyInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)&OBJC_CLASS___CCDValidationKeyInfo;
  v7 = -[CCDValidationInfo initWithName:validationInfo:](&v32, "initWithName:validationInfo:", a3, v6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"validationType"]);
    v7->_validationType = (unint64_t)[v8 integerValue];

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"destinationKey"]);
    destinationKey = v7->_destinationKey;
    v7->_destinationKey = (NSString *)v9;

    if (v7->_validationType == 8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"subKey"]);

      if (v11)
      {
        id v27 = v6;
        v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"subKey"]);
        v14 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v13);
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v30 = 0u;
        __int128 v31 = 0u;
        id v15 = v12;
        id v16 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v29;
          do
          {
            v19 = 0LL;
            do
            {
              if (*(void *)v29 != v18) {
                objc_enumerationMutation(v15);
              }
              uint64_t v20 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)v19);
              v21 = objc_alloc(&OBJC_CLASS___CCDValidationKeyInfo);
              v22 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v20]);
              v23 = -[CCDValidationKeyInfo initWithName:validationInfo:](v21, "initWithName:validationInfo:", v20, v22);
              [v14 addObject:v23];

              v19 = (char *)v19 + 1;
            }

            while (v17 != v19);
            id v17 = [v15 countByEnumeratingWithState:&v28 objects:v33 count:16];
          }

          while (v17);
        }

        v24 = (NSArray *)[v14 copy];
        subKeys = v7->_subKeys;
        v7->_subKeys = v24;

        id v6 = v27;
      }
    }
  }

  return v7;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  if (-[CCDValidationInfo isRequired](self, "isRequired")) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo validationInfo](self, "validationInfo"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:@"validationType"]);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"\n***********\nCloud Config Key Name: %@\nRequired: %@\nValidation Type: %@\nDestination Key: %@\n***********\n",  v3,  v4,  v6,  v7));

  return v8;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  switch(-[CCDValidationKeyInfo validationType](self, "validationType"))
  {
    case 0uLL:
    case 3uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateBooleanInDictionary:](self, "_validateBooleanInDictionary:", v6);
      goto LABEL_13;
    case 1uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateCertificateArrayInDictionary:]( self,  "_validateCertificateArrayInDictionary:",  v6);
      goto LABEL_13;
    case 2uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateHttpsURLStringInDictionary:]( self,  "_validateHttpsURLStringInDictionary:",  v6);
      goto LABEL_13;
    case 4uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateNumberInDictionary:](self, "_validateNumberInDictionary:", v6);
      goto LABEL_13;
    case 5uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateStringInDictionary:](self, "_validateStringInDictionary:", v6);
      goto LABEL_13;
    case 6uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateStringArrayInDictionary:](self, "_validateStringArrayInDictionary:", v6);
      goto LABEL_13;
    case 7uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateCredentialTokenInDictionary:]( self,  "_validateCredentialTokenInDictionary:",  v6);
      goto LABEL_13;
    case 8uLL:
      v11 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableDictionary, v8);
      LODWORD(v10) = -[CCDValidationKeyInfo _validateDictionaryInDictionary:resultsDictionary:]( self,  "_validateDictionaryInDictionary:resultsDictionary:",  v6,  v11);
      if (!v7) {
        break;
      }
      goto LABEL_14;
    case 9uLL:
      unsigned int v9 = -[CCDValidationKeyInfo _validateUnstructureddDictionaryInDictionary:]( self,  "_validateUnstructureddDictionaryInDictionary:",  v6);
LABEL_13:
      LODWORD(v10) = v9;
      v11 = 0LL;
      if (v7)
      {
LABEL_14:
        if ((_DWORD)v10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
          v10 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v12]);

          if (v10)
          {
            switch(-[CCDValidationKeyInfo validationType](self, "validationType"))
            {
              case 1uLL:
                __int128 v30 = v10;
                id v13 = v10;
                id v15 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v14);
                __int128 v31 = 0u;
                __int128 v32 = 0u;
                __int128 v33 = 0u;
                __int128 v34 = 0u;
                id v16 = v13;
                id v17 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
                if (v17)
                {
                  id v18 = v17;
                  uint64_t v19 = *(void *)v32;
                  do
                  {
                    for (i = 0LL; i != v18; i = (char *)i + 1)
                    {
                      if (*(void *)v32 != v19) {
                        objc_enumerationMutation(v16);
                      }
                      v21 = (void *)objc_claimAutoreleasedReturnValue( -[CCDValidationKeyInfo _certificateDataFromBase64EncodedString:]( self,  "_certificateDataFromBase64EncodedString:",  *(void *)(*((void *)&v31 + 1) + 8LL * (void)i)));
                      if (v21) {
                        [v15 addObject:v21];
                      }
                    }

                    id v18 = [v16 countByEnumeratingWithState:&v31 objects:v35 count:16];
                  }

                  while (v18);
                }

                v22 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                [v7 setObject:v15 forKeyedSubscript:v22];

                v10 = v30;
                break;
              case 3uLL:
                id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v10 BOOLValue] ^ 1));
                goto LABEL_32;
              case 7uLL:
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                v25 = &__kCFBooleanTrue;
                v24 = v7;
                goto LABEL_30;
              case 8uLL:
                id v26 = [v11 copy];
LABEL_32:
                id v27 = v26;
                __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                [v7 setObject:v27 forKeyedSubscript:v28];

                break;
              default:
                v23 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo destinationKey](self, "destinationKey"));
                v24 = v7;
                v25 = v10;
LABEL_30:
                [v24 setObject:v25 forKeyedSubscript:v23];

                break;
            }
          }

          LOBYTE(v10) = 1;
        }
      }

      break;
    default:
      LOBYTE(v10) = 0;
      v11 = 0LL;
      break;
  }

  return (char)v10;
}

- (id)_certificateDataFromBase64EncodedString:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0) {
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[CCDCertificateSupport decodeCertificateFromBase64String:]( &OBJC_CLASS___CCDCertificateSupport,  "decodeCertificateFromBase64String:",  v3));
  }
  else {
    v5 = 0LL;
  }

  return v5;
}

- (BOOL)_validateCertificateArrayInDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = (void *)objc_claimAutoreleasedReturnValue( -[CCDValidationKeyInfo _certificateDataFromBase64EncodedString:]( self,  "_certificateDataFromBase64EncodedString:",  *(void *)(*((void *)&v16 + 1) + 8LL * (void)i),  (void)v16));

          if (!v13)
          {
            BOOL v14 = 0;
            goto LABEL_13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v14 = 1;
LABEL_13:
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_validateHttpsURLStringInDictionary:(id)a3
{
  id v4 = a3;
  if (-[CCDValidationKeyInfo _validateStringInDictionary:](self, "_validateStringInDictionary:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

    if (v6)
    {
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v6));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scheme]);
      unsigned __int8 v9 = [@"https" isEqualToString:v8];
    }

    else
    {
      unsigned __int8 v9 = 1;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)_validateNumberInDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSNumber);
  LOBYTE(v4) = objc_opt_isKindOfClass(v6, v7);

  return v4 & 1;
}

- (BOOL)_validateStringInDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSString);
  LOBYTE(v4) = objc_opt_isKindOfClass(v6, v7);

  return v4 & 1;
}

- (BOOL)_validateStringArrayInDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSArray);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v18;
      while (2)
      {
        for (i = 0LL; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
          uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) == 0)
          {
            BOOL v15 = 0;
            goto LABEL_13;
          }
        }

        id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v15 = 1;
LABEL_13:
  }

  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_validateCredentialTokenInDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDKeychain dataFromString:](&OBJC_CLASS___CCDKeychain, "dataFromString:", v6));
  id v16 = 0LL;
  LOWORD(v15) = 0;
  +[CCDKeychain setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:]( &OBJC_CLASS___CCDKeychain,  "setData:forService:account:label:description:access:group:useSystemKeychain:sysBound:outError:",  v7,  @"DEP-FastTime-Service",  @"DEP-FastTime-Account",  0LL,  0LL,  kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly,  0LL,  v15,  &v16);
  id v8 = v16;

  if (v8)
  {
    uint64_t v11 = *(void **)(DEPLogObjects(v9, v10) + 8);
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      v12 = v11;
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v8 description]);
      *(_DWORD *)buf = 138543362;
      __int128 v18 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Error trying to store credentials in keychain!! \n Error:  %{public}@ \n Failing CloudConfig Validation...",  buf,  0xCu);
    }
  }

  return v8 == 0LL;
}

- (BOOL)_validateDictionaryInDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v8]);

  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 allKeys]);
    id v12 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v29;
LABEL_4:
      uint64_t v15 = 0LL;
      while (1)
      {
        if (*(void *)v29 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v28 + 1) + 8 * v15);
        uint64_t v17 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v28 objects:v33 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }

    else
    {
LABEL_10:

      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v24 = 0u;
      __int128 v25 = 0u;
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[CCDValidationKeyInfo subKeys](self, "subKeys", 0LL));
      id v18 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (!v18)
      {
        BOOL v22 = 1;
        goto LABEL_21;
      }

      id v19 = v18;
      uint64_t v20 = *(void *)v25;
LABEL_12:
      uint64_t v21 = 0LL;
      while (1)
      {
        if (*(void *)v25 != v20) {
          objc_enumerationMutation(v11);
        }
        if (![*(id *)(*((void *)&v24 + 1) + 8 * v21) validateSelfWithDictionary:v9 resultsDictionary:v7]) {
          break;
        }
        if (v19 == (id)++v21)
        {
          id v19 = [v11 countByEnumeratingWithState:&v24 objects:v32 count:16];
          BOOL v22 = 1;
          if (v19) {
            goto LABEL_12;
          }
          goto LABEL_21;
        }
      }
    }

    BOOL v22 = 0;
LABEL_21:

    goto LABEL_22;
  }

  BOOL v22 = 0;
LABEL_22:

  return v22;
}

- (BOOL)_validateUnstructureddDictionaryInDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[CCDValidationInfo name](self, "name"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:v5]);

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  LOBYTE(v5) = objc_opt_isKindOfClass(v6, v7);

  return v5 & 1;
}

- (unint64_t)validationType
{
  return self->_validationType;
}

- (void)setValidationType:(unint64_t)a3
{
  self->_validationType = a3;
}

- (NSString)destinationKey
{
  return self->_destinationKey;
}

- (void)setDestinationKey:(id)a3
{
}

- (NSArray)subKeys
{
  return self->_subKeys;
}

- (void)setSubKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
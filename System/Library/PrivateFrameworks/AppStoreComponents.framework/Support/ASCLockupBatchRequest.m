@interface ASCLockupBatchRequest
+ (BOOL)supportsSecureCoding;
+ (id)lockupBatchRequestsFromRequests:(id)a3;
- (ASCLockupBatchRequest)initWithCoder:(id)a3;
- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5;
- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3;
- (BOOL)enableAppDistribution;
- (BOOL)isEqual:(id)a3;
- (NSArray)requests;
- (NSDictionary)mediaQueryParams;
- (NSSet)ids;
- (NSString)clientID;
- (NSString)context;
- (NSString)kind;
- (NSString)platformOverride;
- (id)_initWithIDs:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7 mediaQueryParams:(id)a8 platformOverride:(id)a9;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupBatchRequest

+ (id)lockupBatchRequestsFromRequests:(id)a3
{
  id v3 = a3;
  v43 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 clientID]);

  v6 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  unsigned int v42 = [v6 enableAppDistribution];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v41 = (void *)objc_claimAutoreleasedReturnValue([v7 mediaQueryParams]);

  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 firstObject]);
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 platformOverride]);

  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  id v10 = v3;
  id v11 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v51;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
        if ((unint64_t)[v10 count] >= 2)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 mediaQueryParams]);

          if (v16) {
            goto LABEL_29;
          }
        }

        v17 = (void *)objc_claimAutoreleasedReturnValue([v15 clientID]);
        v18 = v17;
        if (v5 && v17)
        {
          unsigned __int8 v19 = [v17 isEqual:v5];

          if ((v19 & 1) == 0) {
            goto LABEL_24;
          }
        }

        else
        {

          if (v18 != v5)
          {
LABEL_24:
            v35 = (void *)objc_claimAutoreleasedReturnValue([v15 clientID]);
            uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Requests with different clientID cannot be included in batch request: %@ != %@",  v35,  v5));

LABEL_27:
            v38 = objc_alloc(&OBJC_CLASS___NSException);
            NSExceptionName v39 = NSInvalidArgumentException;
            for (j = (const __CFString *)v36;
                  ;
                  j = @"Request specifying custom media query parameters cannot be included in batch request with more than one request")
            {
              objc_exception_throw(-[NSException initWithName:reason:userInfo:](v38, "initWithName:reason:userInfo:", v39, j, 0LL));
LABEL_29:
              v38 = objc_alloc(&OBJC_CLASS___NSException);
              NSExceptionName v39 = NSInvalidArgumentException;
            }
          }
        }

        if (v42 != [v15 enableAppDistribution])
        {
          uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Requests with different AppDistribution options cannot be included in batch request: %d != %d",  [v15 enableAppDistribution],  v42));
          goto LABEL_27;
        }

        v20 = (void *)objc_claimAutoreleasedReturnValue([v15 platformOverride]);
        v21 = v20;
        if (v9 && v20)
        {
          unsigned __int8 v22 = [v20 isEqual:v9];

          if ((v22 & 1) == 0) {
            goto LABEL_26;
          }
        }

        else
        {

          if (v21 != v9)
          {
LABEL_26:
            v37 = (void *)objc_claimAutoreleasedReturnValue([v15 platformOverride]);
            uint64_t v36 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Requests with different platformOverride options cannot be included in batch request: %@ != %@",  v37,  v9));

            goto LABEL_27;
          }
        }

        v23 = objc_alloc(&OBJC_CLASS___ASCPair);
        v24 = (void *)objc_claimAutoreleasedReturnValue([v15 kind]);
        v25 = (void *)objc_claimAutoreleasedReturnValue([v15 context]);
        v26 = -[ASCPair initWithFirst:second:](v23, "initWithFirst:second:", v24, v25);

        v27 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v43, "objectForKeyedSubscript:", v26));
        if (!v27)
        {
          v27 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v43, "setObject:forKeyedSubscript:", v27, v26);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue([v15 id]);
        -[NSMutableSet addObject:](v27, "addObject:", v28);
      }

      id v12 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
    }

    while (v12);
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = sub_100015AF0;
  v44[3] = &unk_10011F118;
  char v49 = v42;
  id v45 = v5;
  id v46 = v41;
  id v47 = v9;
  v48 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v29 = v48;
  id v30 = v9;
  id v31 = v41;
  id v32 = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v43, "enumerateKeysAndObjectsUsingBlock:", v44);
  id v33 = -[NSMutableArray copy](v29, "copy");

  return v33;
}

- (ASCLockupBatchRequest)initWithIDs:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ASCLockupBatchRequest;
  id v11 = -[ASCLockupBatchRequest init](&v19, "init");
  if (v11)
  {
    id v12 = (NSSet *)[v8 copy];
    ids = v11->_ids;
    v11->_ids = v12;

    v14 = (NSString *)[v9 copy];
    kind = v11->_kind;
    v11->_kind = v14;

    v16 = (NSString *)[v10 copy];
    context = v11->_context;
    v11->_context = v16;
  }

  return v11;
}

- (id)_initWithIDs:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7 mediaQueryParams:(id)a8 platformOverride:(id)a9
{
  id v15 = a6;
  id v16 = a8;
  id v17 = a9;
  v18 = -[ASCLockupBatchRequest initWithIDs:kind:context:](self, "initWithIDs:kind:context:", a3, a4, a5);
  objc_super v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientID, a6);
    v19->_enableAppDistribution = a7;
    objc_storeStrong((id *)&v19->_mediaQueryParams, a8);
    objc_storeStrong((id *)&v19->_platformOverride, a9);
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupBatchRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSSet);
  v6 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v5,  objc_opt_class(&OBJC_CLASS___ASCAdamID),  0LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v7 forKey:@"ids"]);

  if (v8)
  {
    id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kind"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      id v11 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"context"];
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        uint64_t v13 = -[ASCLockupBatchRequest initWithIDs:kind:context:](self, "initWithIDs:kind:context:", v8, v10, v12);
        if (v13)
        {
          id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientID"];
          uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
          clientID = v13->_clientID;
          v13->_clientID = (NSString *)v15;

          v13->_enableAppDistribution = [v4 decodeBoolForKey:@"enableAppDistribution"];
          id v17 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          objc_super v19 = -[NSSet initWithObjects:](v17, "initWithObjects:", v18, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
          uint64_t v20 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v19 forKey:@"mediaQueryParams"]);
          mediaQueryParams = v13->_mediaQueryParams;
          v13->_mediaQueryParams = (NSDictionary *)v20;

          id v22 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"platformOverride"];
          uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);
          platformOverride = v13->_platformOverride;
          v13->_platformOverride = (NSString *)v23;
        }

        self = v13;
        v25 = self;
      }

      else
      {
        BOOL v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v42) {
          sub_1000E1220(v42, v43, v44, v45, v46, v47, v48, v49);
        }
        v25 = 0LL;
      }
    }

    else
    {
      BOOL v34 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v34) {
        sub_1000E11EC(v34, v35, v36, v37, v38, v39, v40, v41);
      }
      v25 = 0LL;
    }
  }

  else
  {
    BOOL v26 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v26) {
      sub_1000E11B8(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    v25 = 0LL;
  }

  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
  [v4 encodeObject:v5 forKey:@"ids"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
  [v4 encodeObject:v6 forKey:@"kind"];

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
  [v4 encodeObject:v7 forKey:@"context"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
  [v4 encodeObject:v8 forKey:@"clientID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"),  @"enableAppDistribution");
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
  [v4 encodeObject:v9 forKey:@"mediaQueryParams"];

  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
  [v4 encodeObject:v10 forKey:@"platformOverride"];
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  unint64_t v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupBatchRequest *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupBatchRequest);
    v6 = v4;
    v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        id v8 = v7;
      }
      else {
        id v8 = 0LL;
      }
    }

    else
    {
      id v8 = 0LL;
    }

    unint64_t v10 = v8;

    if (!v10)
    {
      BOOL v9 = 0;
LABEL_48:

      goto LABEL_49;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](v10, "ids"));
    uint64_t v13 = (void *)v12;
    if (v11 && v12)
    {
      if ([v11 isEqual:v12])
      {
LABEL_12:
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](v10, "kind"));
        id v16 = (void *)v15;
        if (v14 && v15)
        {
          if ([v14 isEqual:v15])
          {
LABEL_15:
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](v10, "context"));
            objc_super v19 = (void *)v18;
            if (v17 && v18)
            {
              if ([v17 isEqual:v18])
              {
LABEL_18:
                uint64_t v39 = v19;
                uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
                uint64_t v21 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](v10, "clientID"));
                id v22 = (void *)v21;
                if (v20 && v21)
                {
                }

                else if (v20 == (void *)v21)
                {
LABEL_21:
                  uint64_t v36 = v20;
                  uint64_t v38 = v22;
                  unsigned int v23 = -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution");
                  if (v23 != -[ASCLockupBatchRequest enableAppDistribution](v10, "enableAppDistribution"))
                  {
                    BOOL v9 = 0;
LABEL_43:
                    id v22 = v38;
                    goto LABEL_44;
                  }

                  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
                  uint64_t v25 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](v10, "mediaQueryParams"));
                  BOOL v26 = (void *)v25;
                  if (v24 && v25)
                  {
                    uint64_t v27 = (void *)v25;
                    unsigned int v28 = [v24 isEqual:v25];
                    BOOL v26 = v27;
                    uint64_t v20 = v36;
                    if (v28) {
                      goto LABEL_35;
                    }
                  }

                  else if (v24 == (void *)v25)
                  {
LABEL_35:
                    uint64_t v35 = v26;
                    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
                    uint64_t v30 = objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](v10, "platformOverride"));
                    uint64_t v31 = (void *)v30;
                    uint64_t v37 = v29;
                    if (v29 && v30)
                    {
                      BOOL v34 = (void *)v30;
                      unsigned __int8 v32 = [v29 isEqual:v30];
                      uint64_t v31 = v34;
                      BOOL v9 = v32;
                    }

                    else
                    {
                      BOOL v9 = v29 == (void *)v30;
                    }

                    BOOL v26 = v35;
                    goto LABEL_42;
                  }

                  BOOL v9 = 0;
LABEL_42:

                  goto LABEL_43;
                }

                BOOL v9 = 0;
LABEL_44:

                objc_super v19 = v39;
                goto LABEL_45;
              }
            }

            else if (v17 == (void *)v18)
            {
              goto LABEL_18;
            }

            BOOL v9 = 0;
LABEL_45:

            goto LABEL_46;
          }
        }

        else if (v14 == (void *)v15)
        {
          goto LABEL_15;
        }

        BOOL v9 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }

    else if (v11 == (void *)v12)
    {
      goto LABEL_12;
    }

    BOOL v9 = 0;
LABEL_47:

    goto LABEL_48;
  }

  BOOL v9 = 1;
LABEL_49:

  return v9;
}

- (id)description
{
  id v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"ids");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"kind");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"context");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, @"clientID");

  -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution"),  @"enableAppDistribution");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));

  if (v8)
  {
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, @"mediaQueryParams");
  }

  unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, @"platformOverride");
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return v12;
}

- (NSArray)requests
{
  id v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
  uint64_t v5 = -[NSMutableArray initWithCapacity:](v3, "initWithCapacity:", [v4 count]);

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest ids](self, "ids"));
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      BOOL v9 = 0LL;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v25 + 1) + 8LL * (void)v9);
        id v11 = objc_alloc(&OBJC_CLASS___ASCLockupRequest);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
        id v15 = -[ASCLockupRequest _initWithID:kind:context:clientID:]( v11,  "_initWithID:kind:context:clientID:",  v10,  v12,  v13,  v14);

        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
        if (v16)
        {
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
          uint64_t v18 = objc_claimAutoreleasedReturnValue([v15 lockupRequestWithMediaQueryParams:v17]);

          id v15 = (id)v18;
        }

        objc_super v19 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));

        if (v19)
        {
          uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
          uint64_t v21 = objc_claimAutoreleasedReturnValue([v15 _lockupRequestWithPlatformOverride:v20]);

          id v15 = (id)v21;
        }

        -[NSMutableArray addObject:](v5, "addObject:", v15);

        BOOL v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }

    while (v7);
  }

  id v22 = -[NSMutableArray copy](v5, "copy");
  return (NSArray *)v22;
}

- (ASCLockupBatchRequest)lockupBatchRequestWithIDs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___ASCLockupBatchRequest);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest kind](self, "kind"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest context](self, "context"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest clientID](self, "clientID"));
  BOOL v9 = -[ASCLockupBatchRequest enableAppDistribution](self, "enableAppDistribution");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest mediaQueryParams](self, "mediaQueryParams"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupBatchRequest platformOverride](self, "platformOverride"));
  id v12 = -[ASCLockupBatchRequest _initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:]( v5,  "_initWithIDs:kind:context:clientID:enableAppDistribution:mediaQueryParams:platformOverride:",  v4,  v6,  v7,  v8,  v9,  v10,  v11);

  return (ASCLockupBatchRequest *)v12;
}

- (NSSet)ids
{
  return self->_ids;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
}

@end
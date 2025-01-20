@interface ASCLockupRequest
+ (BOOL)supportsSecureCoding;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8;
+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6;
- (ASCAdamID)id;
- (ASCLockupRequest)initWithCoder:(id)a3;
- (ASCLockupRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5;
- (ASCLockupRequest)lockupRequestWithAppDistributionEnabled;
- (ASCLockupRequest)lockupRequestWithMediaQueryParams:(id)a3;
- (BOOL)enableAppDistribution;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)mediaQueryParams;
- (NSString)clientID;
- (NSString)context;
- (NSString)kind;
- (NSString)platformOverride;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8;
- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6;
- (id)_lockupRequestWithAppDistributionEnabled;
- (id)_lockupRequestWithClientID:(id)a3;
- (id)_lockupRequestWithPlatformOverride:(id)a3;
- (id)clone;
- (id)description;
- (id)lockupRequestByAddingMediaQueryParams:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCLockupRequest

- (ASCLockupRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___ASCLockupRequest;
  v11 = -[ASCLockupRequest init](&v19, "init");
  if (v11)
  {
    v12 = (ASCAdamID *)[v8 copy];
    id = v11->_id;
    v11->_id = v12;

    v14 = (NSString *)[v9 copy];
    kind = v11->_kind;
    v11->_kind = v14;

    v16 = (NSString *)[v10 copy];
    context = v11->_context;
    v11->_context = v16;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCLockupRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(ASCAdamID) forKey:@"id"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kind"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"context"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        v11 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", v6, v8, v10);
        if (v11)
        {
          v12 = objc_alloc(&OBJC_CLASS___NSSet);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
          v14 = -[NSSet initWithObjects:](v12, "initWithObjects:", v13, objc_opt_class(&OBJC_CLASS___NSString), 0LL);
          uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v14 forKey:@"mediaQueryParams"]);
          mediaQueryParams = v11->_mediaQueryParams;
          v11->_mediaQueryParams = (NSDictionary *)v15;

          id v17 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientID"];
          uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
          clientID = v11->_clientID;
          v11->_clientID = (NSString *)v18;

          v11->_enableAppDistribution = [v4 decodeBoolForKey:@"enableAppDistribution"];
          id v20 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"platformOverride"];
          uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
          platformOverride = v11->_platformOverride;
          v11->_platformOverride = (NSString *)v21;
        }

        self = v11;
        v23 = self;
      }

      else
      {
        BOOL v40 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v40) {
          sub_1000E1220(v40, v41, v42, v43, v44, v45, v46, v47);
        }
        v23 = 0LL;
      }
    }

    else
    {
      BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v32) {
        sub_1000E11EC(v32, v33, v34, v35, v36, v37, v38, v39);
      }
      v23 = 0LL;
    }
  }

  else
  {
    BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v24) {
      sub_1000E1254(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    v23 = 0LL;
  }

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](self, "kind"));
  [v4 encodeObject:v6 forKey:@"kind"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](self, "context"));
  [v4 encodeObject:v7 forKey:@"context"];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
  [v4 encodeObject:v8 forKey:@"mediaQueryParams"];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));
  [v4 encodeObject:v9 forKey:@"clientID"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"),  @"enableAppDistribution");
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));
  [v4 encodeObject:v10 forKey:@"platformOverride"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](self, "kind"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](self, "context"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v8);

  -[ASCHasher combineBool:]( v3,  "combineBool:",  -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));
  -[ASCHasher combineObject:](v3, "combineObject:", v9);

  unint64_t v10 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCLockupRequest *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCLockupRequest);
    v6 = v4;
    id v7 = v6;
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

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](self, "id"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](v10, "id"));
    uint64_t v13 = (void *)v12;
    if (v11 && v12)
    {
      if ([v11 isEqual:v12])
      {
LABEL_12:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](self, "kind"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](v10, "kind"));
        v16 = (void *)v15;
        if (v14 && v15)
        {
          if ([v14 isEqual:v15])
          {
LABEL_15:
            id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](self, "context"));
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](v10, "context"));
            objc_super v19 = (void *)v18;
            if (v17 && v18)
            {
              if ([v17 isEqual:v18])
              {
LABEL_18:
                id v20 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
                uint64_t v21 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](v10, "mediaQueryParams"));
                v22 = (void *)v21;
                uint64_t v42 = v20;
                if (v20 && v21)
                {
                  v23 = v20;
                  BOOL v24 = v22;
                  unsigned int v25 = [v23 isEqual:v22];
                  v22 = v24;
                  id v20 = v42;
                  if (v25)
                  {
LABEL_21:
                    BOOL v40 = v22;
                    uint64_t v26 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));
                    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](v10, "clientID"));
                    uint64_t v28 = (void *)v27;
                    uint64_t v41 = (void *)v26;
                    if (v26 && v27)
                    {
                      uint64_t v29 = (void *)v27;
                      unsigned int v30 = [v41 isEqual:v27];
                      uint64_t v28 = v29;
                      if (v30)
                      {
LABEL_24:
                        unsigned int v31 = -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution", v28);
                        if (v31 == -[ASCLockupRequest enableAppDistribution](v10, "enableAppDistribution"))
                        {
                          BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));
                          uint64_t v33 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](v10, "platformOverride"));
                          uint64_t v34 = (void *)v33;
                          if (v32 && v33)
                          {
                            uint64_t v35 = (void *)v33;
                            unsigned __int8 v36 = [v32 isEqual:v33];
                            uint64_t v34 = v35;
                            uint64_t v37 = v32;
                            BOOL v9 = v36;
                          }

                          else
                          {
                            uint64_t v37 = v32;
                            BOOL v9 = v32 == (void *)v33;
                          }
                        }

                        else
                        {
                          BOOL v9 = 0;
                        }

                        uint64_t v28 = v39;
                        goto LABEL_43;
                      }
                    }

                    else if (v26 == v27)
                    {
                      goto LABEL_24;
                    }

                    BOOL v9 = 0;
LABEL_43:

                    v22 = v40;
                    id v20 = v42;
                    goto LABEL_44;
                  }
                }

                else if (v20 == (void *)v21)
                {
                  goto LABEL_21;
                }

                BOOL v9 = 0;
LABEL_44:

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
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](self, "kind"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"kind");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](self, "context"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"context");

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, @"mediaQueryParams");
  }

  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));

  if (v9)
  {
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, @"clientID");
  }

  if (-[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution")) {
    -[ASCDescriber addBool:withName:]( v3,  "addBool:withName:",  -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution"),  @"enableAppDistribution");
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));
    -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v12, @"platformOverride");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));

  return v13;
}

- (id)clone
{
  id v3 = objc_alloc((Class)objc_opt_class(self));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest id](self, "id"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest kind](self, "kind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest context](self, "context"));
  id v7 = [v3 initWithID:v4 kind:v5 context:v6];

  uint64_t v8 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest mediaQueryParams](self, "mediaQueryParams"));
  BOOL v9 = (void *)v7[5];
  v7[5] = v8;

  uint64_t v10 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clientID](self, "clientID"));
  v11 = (void *)v7[6];
  v7[6] = v10;

  *((_BYTE *)v7 + 8) = -[ASCLockupRequest enableAppDistribution](self, "enableAppDistribution");
  uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCLockupRequest platformOverride](self, "platformOverride"));
  uint64_t v13 = (void *)v7[7];
  v7[7] = v12;

  return v7;
}

- (ASCLockupRequest)lockupRequestWithMediaQueryParams:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clone](self, "clone"));
  v6 = (void *)v5[5];
  v5[5] = v4;

  return (ASCLockupRequest *)v5;
}

- (id)lockupRequestByAddingMediaQueryParams:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clone](self, "clone"));
  v6 = (void *)v5[5];
  if (v6) {
    id v7 = [v6 mutableCopy];
  }
  else {
    id v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  }
  uint64_t v8 = v7;
  [v7 addEntriesFromDictionary:v4];

  id v9 = [v8 copy];
  uint64_t v10 = (void *)v5[5];
  v5[5] = v9;

  return v5;
}

- (id)_lockupRequestWithClientID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clone](self, "clone"));
  v6 = (void *)v5[6];
  v5[6] = v4;

  return v5;
}

- (id)_lockupRequestWithAppDistributionEnabled
{
  id result = -[ASCLockupRequest clone](self, "clone");
  *((_BYTE *)result + 8) = 1;
  return result;
}

- (id)_lockupRequestWithPlatformOverride:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest clone](self, "clone"));
  v6 = (void *)v5[7];
  v5[7] = v4;

  return v5;
}

- (ASCAdamID)id
{
  return self->_id;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)context
{
  return self->_context;
}

- (NSDictionary)mediaQueryParams
{
  return self->_mediaQueryParams;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (BOOL)enableAppDistribution
{
  return self->_enableAppDistribution;
}

- (NSString)platformOverride
{
  return self->_platformOverride;
}

- (void).cxx_destruct
{
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  BOOL v6 = a6;
  id v7 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  uint64_t v8 = v7;
  id v9 = v7;
  if (v6)
  {
    id v9 = (ASCLockupRequest *)objc_claimAutoreleasedReturnValue( -[ASCLockupRequest lockupRequestWithAppDistributionEnabled]( v7,  "lockupRequestWithAppDistributionEnabled"));
  }

  return v9;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  uint64_t v13 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  v14 = v13;
  uint64_t v15 = v13;
  if (v7)
  {
    uint64_t v15 = (ASCLockupRequest *)objc_claimAutoreleasedReturnValue( -[ASCLockupRequest lockupRequestWithAppDistributionEnabled]( v13,  "lockupRequestWithAppDistributionEnabled"));
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest _lockupRequestWithClientID:](v15, "_lockupRequestWithClientID:", v12));

  return v16;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a6;
  id v15 = a7;
  v16 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  id v17 = v16;
  uint64_t v18 = v16;
  if (v8)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( -[ASCLockupRequest lockupRequestWithAppDistributionEnabled]( v16,  "lockupRequestWithAppDistributionEnabled"));
  }

  if (v15)
  {
    v23 = @"ppid";
    id v24 = v15;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v18 lockupRequestWithMediaQueryParams:v19]);

    uint64_t v18 = (void *)v20;
  }

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v18 _lockupRequestWithClientID:v14]);

  return v21;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 enableAppDistribution:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[ASCLockupRequest _initWithID:kind:context:enableAppDistribution:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:enableAppDistribution:",  v11,  v10,  v9,  v6);

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 enableAppDistribution:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = -[ASCLockupRequest _initWithID:kind:context:clientID:enableAppDistribution:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:clientID:enableAppDistribution:",  v14,  v13,  v12,  v11,  v7);

  return v15;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6 productVariantID:(id)a7 enableAppDistribution:(BOOL)a8
{
  BOOL v8 = a8;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = -[ASCLockupRequest _initWithID:kind:context:clientID:productVariantID:enableAppDistribution:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:clientID:productVariantID:enableAppDistribution:",  v17,  v16,  v15,  v14,  v13,  v8);

  return v18;
}

- (ASCLockupRequest)lockupRequestWithAppDistributionEnabled
{
  return (ASCLockupRequest *)-[ASCLockupRequest _lockupRequestWithAppDistributionEnabled]( self,  "_lockupRequestWithAppDistributionEnabled");
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  id v17 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  id v18 = v17;
  if (v14)
  {
    uint64_t v29 = @"minExternalVersionId";
    id v30 = v14;
    objc_super v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
    id v18 = (void *)objc_claimAutoreleasedReturnValue( -[ASCLockupRequest lockupRequestByAddingMediaQueryParams:]( v17,  "lockupRequestByAddingMediaQueryParams:",  v19));
  }

  if (v15)
  {
    uint64_t v27 = @"latestReleaseId";
    id v28 = v15;
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v28,  &v27,  1LL));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v18 lockupRequestByAddingMediaQueryParams:v20]);

    id v18 = (void *)v21;
  }

  if (v16)
  {
    unsigned int v25 = @"ppid";
    id v26 = v16;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
    uint64_t v23 = objc_claimAutoreleasedReturnValue([v18 lockupRequestByAddingMediaQueryParams:v22]);

    id v18 = (void *)v23;
  }

  return v18;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 minExternalVersionID:(id)a6 latestReleaseID:(id)a7 productVariantID:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = -[ASCLockupRequest _initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:minExternalVersionID:latestReleaseID:productVariantID:",  v18,  v17,  v16,  v15,  v14,  v13);

  return v19;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v10 = a6;
  id v11 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest lockupRequestWithClientID:](v11, "lockupRequestWithClientID:", v10));

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 clientID:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[ASCLockupRequest _initWithID:kind:context:clientID:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:clientID:",  v12,  v11,  v10,  v9);

  return v13;
}

- (id)_initWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v10 = a6;
  id v11 = -[ASCLockupRequest initWithID:kind:context:](self, "initWithID:kind:context:", a3, a4, a5);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ASCLockupRequest lockupRequestWithPlatformOverride:](v11, "lockupRequestWithPlatformOverride:", v10));

  return v12;
}

+ (id)_requestWithID:(id)a3 kind:(id)a4 context:(id)a5 platformOverride:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[ASCLockupRequest _initWithID:kind:context:platformOverride:]( objc_alloc(&OBJC_CLASS___ASCLockupRequest),  "_initWithID:kind:context:platformOverride:",  v12,  v11,  v10,  v9);

  return v13;
}

@end
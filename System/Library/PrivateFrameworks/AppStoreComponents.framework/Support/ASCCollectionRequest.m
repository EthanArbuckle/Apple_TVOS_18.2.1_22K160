@interface ASCCollectionRequest
+ (BOOL)supportsSecureCoding;
- (ASCCollectionRequest)initWithCoder:(id)a3;
- (ASCCollectionRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (NSString)clientID;
- (NSString)context;
- (NSString)id;
- (NSString)kind;
- (id)_collectionRequestWithClientID:(id)a3;
- (id)description;
- (int64_t)limit;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCCollectionRequest

- (ASCCollectionRequest)initWithID:(id)a3 kind:(id)a4 context:(id)a5 limit:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  sub_10000F4DC((uint64_t)&OBJC_CLASS___ASCEligibility);
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___ASCCollectionRequest;
  v13 = -[ASCCollectionRequest init](&v21, "init");
  if (v13)
  {
    v14 = (NSString *)[v10 copy];
    id = v13->_id;
    v13->_id = v14;

    v16 = (NSString *)[v11 copy];
    kind = v13->_kind;
    v13->_kind = v16;

    v18 = (NSString *)[v12 copy];
    context = v13->_context;
    v13->_context = v18;

    v13->_limit = a6;
  }

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCCollectionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"id"];
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    id v7 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"kind"];
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      id v9 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"context"];
      id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        id v11 = -[ASCCollectionRequest initWithID:kind:context:limit:]( self,  "initWithID:kind:context:limit:",  v6,  v8,  v10,  [v4 decodeIntegerForKey:@"limit"]);
        if (v11)
        {
          id v12 = [v4 decodeObjectOfClass:objc_opt_class(NSString) forKey:@"clientID"];
          uint64_t v13 = objc_claimAutoreleasedReturnValue(v12);
          clientID = v11->_clientID;
          v11->_clientID = (NSString *)v13;
        }

        self = v11;
        v15 = self;
      }

      else
      {
        BOOL v32 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
        if (v32) {
          sub_1000E0E74(v32, v33, v34, v35, v36, v37, v38, v39);
        }
        v15 = 0LL;
      }
    }

    else
    {
      BOOL v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v24) {
        sub_1000E0E40(v24, v25, v26, v27, v28, v29, v30, v31);
      }
      v15 = 0LL;
    }
  }

  else
  {
    BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v16) {
      sub_1000E0E0C(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    v15 = 0LL;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](self, "id"));
  [v4 encodeObject:v5 forKey:@"id"];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](self, "kind"));
  [v4 encodeObject:v6 forKey:@"kind"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](self, "context"));
  [v4 encodeObject:v7 forKey:@"context"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ASCCollectionRequest limit](self, "limit"), @"limit");
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest clientID](self, "clientID"));
  [v4 encodeObject:v8 forKey:@"clientID"];
}

- (unint64_t)hash
{
  v3 = objc_alloc_init(&OBJC_CLASS___ASCHasher);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](self, "id"));
  -[ASCHasher combineObject:](v3, "combineObject:", v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](self, "kind"));
  -[ASCHasher combineObject:](v3, "combineObject:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](self, "context"));
  -[ASCHasher combineObject:](v3, "combineObject:", v6);

  -[ASCHasher combineInteger:](v3, "combineInteger:", -[ASCCollectionRequest limit](self, "limit"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest clientID](self, "clientID"));
  -[ASCHasher combineObject:](v3, "combineObject:", v7);

  unint64_t v8 = -[ASCHasher finalizeHash](v3, "finalizeHash");
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ASCCollectionRequest *)a3;
  if (self != v4)
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___ASCCollectionRequest);
    v6 = v4;
    id v7 = v6;
    if (v6)
    {
      if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0) {
        unint64_t v8 = v7;
      }
      else {
        unint64_t v8 = 0LL;
      }
    }

    else
    {
      unint64_t v8 = 0LL;
    }

    id v10 = v8;

    if (!v10)
    {
      unsigned __int8 v9 = 0;
LABEL_35:

      goto LABEL_36;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](self, "id"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](v10, "id"));
    uint64_t v13 = (void *)v12;
    if (v11 && v12)
    {
      if ([v11 isEqual:v12])
      {
LABEL_12:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](self, "kind"));
        uint64_t v15 = objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](v10, "kind"));
        BOOL v16 = (void *)v15;
        if (v14 && v15)
        {
          if ([v14 isEqual:v15])
          {
LABEL_15:
            uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](self, "context"));
            uint64_t v18 = objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](v10, "context"));
            uint64_t v19 = (void *)v18;
            if (v17 && v18)
            {
            }

            else if (v17 != (void *)v18)
            {
              goto LABEL_29;
            }

            id v20 = -[ASCCollectionRequest limit](self, "limit");
            if (v20 == (id)-[ASCCollectionRequest limit](v10, "limit"))
            {
              uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest clientID](self, "clientID"));
              uint64_t v22 = objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest clientID](v10, "clientID"));
              uint64_t v23 = (void *)v22;
              uint64_t v25 = v21;
              if (v21 && v22) {
                unsigned __int8 v9 = [v21 isEqual:v22];
              }
              else {
                unsigned __int8 v9 = v21 == (void *)v22;
              }

              goto LABEL_32;
            }

- (id)description
{
  v3 = -[ASCDescriber initWithObject:](objc_alloc(&OBJC_CLASS___ASCDescriber), "initWithObject:", self);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](self, "id"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, @"id");

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](self, "kind"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, @"kind");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](self, "context"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, @"context");

  -[ASCDescriber addInteger:withName:]( v3,  "addInteger:withName:",  -[ASCCollectionRequest limit](self, "limit"),  @"limit");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest clientID](self, "clientID"));
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, @"clientID");

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCDescriber finalizeDescription](v3, "finalizeDescription"));
  return v8;
}

- (id)_collectionRequestWithClientID:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest id](self, "id"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest kind](self, "kind"));
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ASCCollectionRequest context](self, "context"));
  unsigned __int8 v9 = objc_msgSend(v5, "initWithID:kind:context:limit:", v6, v7, v8, -[ASCCollectionRequest limit](self, "limit"));

  id v10 = (void *)v9[5];
  v9[5] = v4;

  return v9;
}

- (NSString)id
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

- (int64_t)limit
{
  return self->_limit;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void).cxx_destruct
{
}

@end
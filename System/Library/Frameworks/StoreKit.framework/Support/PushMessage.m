@interface PushMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessage:(id)a3;
- (NSDictionary)userInfo;
- (NSNumber)accountID;
- (PushMessage)initWithMessage:(id)a3;
- (id)description;
- (id)getRevokedProductsMap;
- (id)valueForUserInfoKey:(id)a3;
- (unint64_t)actionType;
- (unint64_t)hash;
@end

@implementation PushMessage

- (PushMessage)initWithMessage:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PushMessage;
  v6 = -[PushMessage init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_message, a3);
  }

  return v7;
}

- (NSNumber)accountID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](self->_message, "userInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tcr_numberForKey:", @"0"));

  return (NSNumber *)v3;
}

- (unint64_t)actionType
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](self->_message, "userInfo"));
  id v3 = objc_msgSend(v2, "tcr_integerValueForKey:missingValue:", @"1", -1);

  return (unint64_t)v3;
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)-[APSIncomingMessage userInfo](self->_message, "userInfo");
}

- (BOOL)isEqualToMessage:(id)a3
{
  message = self->_message;
  v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](message, "userInfo"));
  v6 = (void *)v4[1];

  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  LOBYTE(v6) = [v5 isEqualToDictionary:v7];

  return (char)v6;
}

- (id)valueForUserInfoKey:(id)a3
{
  message = self->_message;
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](message, "userInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PushMessage *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }

  else
  {
    uint64_t v5 = objc_opt_class(&OBJC_CLASS___PushMessage);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
      BOOL v6 = -[PushMessage isEqualToMessage:](self, "isEqualToMessage:", v4);
    }
    else {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](self->_message, "userInfo"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (id)description
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage userInfo](self->_message, "userInfo"));
  id v4 = [v3 mutableCopy];

  uint64_t v5 = objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"0"]);
  BOOL v6 = (void *)v5;
  if (v5)
  {
    uint64_t v7 = AMSHashIfNeeded(v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v4 setObject:v8 forKeyedSubscript:@"0"];
  }

  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v4)
    || (uint64_t v9 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v4,  0LL,  0LL))) == 0 || (v10 = (void *)v9,  v11 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v9, 4LL),  v10,  !v11))
  {
    v11 = (NSString *)objc_claimAutoreleasedReturnValue([v4 description]);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSIncomingMessage timestamp](self->_message, "timestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "lib_loggableDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@: %@", v13, v11));

  return v14;
}

- (void).cxx_destruct
{
}

- (id)getRevokedProductsMap
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PushMessage valueForUserInfoKey:](self, "valueForUserInfoKey:", @"inAppsByAppBundleId"));
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    id v4 = v2;
    uint64_t v13 = 0LL;
    v14 = &v13;
    uint64_t v15 = 0x3032000000LL;
    v16 = sub_100061FB8;
    v17 = sub_100061FC8;
    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 allKeys]);
    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](&OBJC_CLASS___NSArray, "arrayWithArray:", v5));

    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100061FD0;
    v10[3] = &unk_1002E9A28;
    id v7 = v4;
    id v11 = v7;
    v12 = &v13;
    [v6 enumerateObjectsUsingBlock:v10];
    id v8 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

@end
@interface KTClientRequest
- (KTClientRequest)initWithType:(unint64_t)a3 application:(id)a4 uri:(id)a5 accountKey:(id)a6 serverLoggableDatas:(id)a7;
- (NSArray)clientLoggableDatas;
- (NSArray)serverLoggableDatas;
- (NSData)accountKey;
- (NSData)queryRequest;
- (NSData)queryResponse;
- (NSString)application;
- (NSString)uri;
- (id)addValidateRequest:(id)a3 dataStore:(id)a4 error:(id *)a5;
- (unint64_t)type;
- (void)setAccountKey:(id)a3;
- (void)setApplication:(id)a3;
- (void)setClientLoggableDatas:(id)a3;
- (void)setQueryRequest:(id)a3;
- (void)setQueryResponse:(id)a3;
- (void)setServerLoggableDatas:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUri:(id)a3;
@end

@implementation KTClientRequest

- (KTClientRequest)initWithType:(unint64_t)a3 application:(id)a4 uri:(id)a5 accountKey:(id)a6 serverLoggableDatas:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___KTClientRequest;
  v16 = -[KTClientRequest init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    -[KTClientRequest setType:](v16, "setType:", a3);
    -[KTClientRequest setApplication:](v17, "setApplication:", v12);
    -[KTClientRequest setUri:](v17, "setUri:", v13);
    -[KTClientRequest setAccountKey:](v17, "setAccountKey:", v14);
    -[KTClientRequest setServerLoggableDatas:](v17, "setServerLoggableDatas:", v15);
  }

  return v17;
}

- (id)addValidateRequest:(id)a3 dataStore:(id)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_1001A6DE0;
  v29 = sub_1001A6DF0;
  id v30 = 0LL;
  uint64_t v19 = 0LL;
  v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  v22 = sub_1001A6DE0;
  v23 = sub_1001A6DF0;
  id v24 = 0LL;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1001A6DF8;
  v14[3] = &unk_1002881C8;
  v14[4] = self;
  v17 = &v25;
  id v9 = a4;
  id v15 = v9;
  v18 = &v19;
  id v10 = v8;
  id v16 = v10;
  [v9 performBlockAndWait:v14];
  if (a5)
  {
    v11 = (void *)v20[5];
    if (v11) {
      *a5 = v11;
    }
  }

  id v12 = (id)v26[5];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApplication:(id)a3
{
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUri:(id)a3
{
}

- (NSData)accountKey
{
  return (NSData *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setAccountKey:(id)a3
{
}

- (NSArray)serverLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setServerLoggableDatas:(id)a3
{
}

- (NSArray)clientLoggableDatas
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setClientLoggableDatas:(id)a3
{
}

- (NSData)queryRequest
{
  return (NSData *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setQueryRequest:(id)a3
{
}

- (NSData)queryResponse
{
  return (NSData *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setQueryResponse:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface FARegisterPushTokenOperation
- (FARegisterPushTokenOperation)initWithNetworkService:(id)a3 pushToken:(id)a4;
- (NSData)pushToken;
- (id)pushTokenString;
- (id)registerToken;
@end

@implementation FARegisterPushTokenOperation

- (FARegisterPushTokenOperation)initWithNetworkService:(id)a3 pushToken:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___FARegisterPushTokenOperation;
  v8 = -[FANetworkClient initWithNetworkService:](&v11, "initWithNetworkService:", a3);
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_pushToken, a4);
  }

  return v9;
}

- (id)pushTokenString
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](&OBJC_CLASS___NSMutableString, "stringWithCapacity:", 64LL));
  size_t v4 = -[NSData length](self->_pushToken, "length");
  v5 = (char *)malloc(v4);
  -[NSData getBytes:length:](self->_pushToken, "getBytes:length:", v5, v4);
  if (v4)
  {
    v6 = v5;
    do
    {
      uint64_t v7 = *v6++;
      objc_msgSend(v3, "appendFormat:", @"%02.2hhX", v7);
      --v4;
    }

    while (v4);
  }

  free(v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue([v3 lowercaseString]);

  return v8;
}

- (id)registerToken
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FANetworkClient networkService](self, "networkService"));
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 ensureDeviceUnlockedSinceBoot]);
  v5 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v4 then]);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100019D34;
  v20[3] = &unk_100040EA0;
  v20[4] = self;
  uint64_t v6 = ((uint64_t (**)(void, void *))v5)[2](v5, v20);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v7 then]);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100019D70;
  v19[3] = &unk_1000416D8;
  v19[4] = self;
  uint64_t v9 = ((uint64_t (**)(void, void *))v8)[2](v8, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_super v11 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v10 then]);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100019E2C;
  v18[3] = &unk_100041358;
  v18[4] = self;
  uint64_t v12 = ((uint64_t (**)(void, void *))v11)[2](v11, v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (uint64_t (**)(void, void))objc_claimAutoreleasedReturnValue([v13 then]);
  uint64_t v15 = ((uint64_t (**)(void, Block_layout *))v14)[2](v14, &stru_100042370);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (NSData)pushToken
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void).cxx_destruct
{
}

@end
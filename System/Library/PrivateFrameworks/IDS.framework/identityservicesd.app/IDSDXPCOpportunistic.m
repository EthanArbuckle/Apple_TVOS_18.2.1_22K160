@interface IDSDXPCOpportunistic
- (IDSDXPCOpportunistic)initWithQueue:(id)a3 connection:(id)a4 opportunisticCache:(id)a5;
- (IDSOpportunisticCache)opportunisticCache;
- (IDSXPCConnection)connection;
- (void)copyOpportunisticCacheWithBlock:(id)a3;
- (void)setConnection:(id)a3;
- (void)setOpportunisticCache:(id)a3;
@end

@implementation IDSDXPCOpportunistic

- (IDSDXPCOpportunistic)initWithQueue:(id)a3 connection:(id)a4 opportunisticCache:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IDSDXPCOpportunistic;
  v10 = -[IDSDXPCOpportunistic init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a4);
    objc_storeStrong((id *)&v11->_opportunisticCache, a5);
  }

  return v11;
}

- (void)copyOpportunisticCacheWithBlock:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOpportunistic connection](self, "connection"));
  unsigned int v6 = [v5 hasEntitlement:kIDSTestToolEntitlement];

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCOpportunistic opportunisticCache](self, "opportunisticCache"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10005F844;
    v9[3] = &unk_1008F82D8;
    v9[4] = self;
    id v10 = v4;
    [v7 copyCacheWithBlock:v9];
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IDSFoundationLog opportunistic](&OBJC_CLASS___IDSFoundationLog, "opportunistic"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10069679C(self, v8);
    }

    (*((void (**)(id, void *))v4 + 2))(v4, &__NSDictionary0__struct);
  }
}

- (IDSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (IDSOpportunisticCache)opportunisticCache
{
  return self->_opportunisticCache;
}

- (void)setOpportunisticCache:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
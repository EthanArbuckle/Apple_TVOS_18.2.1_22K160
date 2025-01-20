@interface OctaneActionContext
+ (id)contextWithBundleID:(id)a3;
+ (id)contextWithBundleID:(id)a3 transactionID:(unint64_t)a4;
- (NSString)bundleID;
- (NSString)logKey;
- (NSXPCConnection)connection;
- (OctaneActionContext)init;
- (unint64_t)transactionID;
@end

@implementation OctaneActionContext

- (OctaneActionContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___OctaneActionContext;
  v2 = -[OctaneActionContext init](&v8, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSXPCConnection currentConnection](&OBJC_CLASS___NSXPCConnection, "currentConnection"));
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSUUID lib_shortLogKey](&OBJC_CLASS___NSUUID, "lib_shortLogKey"));
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v5;

    v2->_transactionID = -1LL;
  }

  return v2;
}

+ (id)contextWithBundleID:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new(&OBJC_CLASS___OctaneActionContext);
  uint64_t v5 = (NSString *)[v3 copy];

  bundleID = v4->_bundleID;
  v4->_bundleID = v5;

  return v4;
}

+ (id)contextWithBundleID:(id)a3 transactionID:(unint64_t)a4
{
  id result = +[OctaneActionContext contextWithBundleID:](&OBJC_CLASS___OctaneActionContext, "contextWithBundleID:", a3);
  *((void *)result + 4) = a4;
  return result;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (NSString)logKey
{
  return self->_logKey;
}

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (void).cxx_destruct
{
}

@end
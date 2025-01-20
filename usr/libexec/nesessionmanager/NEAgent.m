@interface NEAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (NEAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7;
- (id)description;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NEAgent

- (NEAgent)initWithPluginType:(id)a3 pluginVersion:(int64_t)a4 pluginClass:(int64_t)a5 pluginInfo:(id)a6 userID:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___NEAgent;
  v16 = -[NEAgent init](&v27, "init");
  if (v16)
  {
    dispatch_queue_attr_t v17 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v17);
    dispatch_queue_t v19 = dispatch_queue_create("NEAgent queue", v18);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v19;

    objc_storeStrong((id *)&v16->_uid, a7);
    objc_storeStrong((id *)&v16->_pluginType, a3);
    v16->_pluginClass = a5;
    v21 = (NSDictionary *)[v14 copy];
    pluginInfo = v16->_pluginInfo;
    v16->_pluginInfo = v21;

    uint64_t v23 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@[inactive]", v13));
    description = v16->_description;
    v16->_description = (NSString *)v23;

    v16->_pid = 0;
    v16->_pluginVersion = a4;
    v25 = v16;
  }

  return v16;
}

- (id)description
{
  return self->_description;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    Property = (dispatch_queue_s *)objc_getProperty(self, v4, 24LL, 1);
  }
  else {
    Property = 0LL;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10007EE1C;
  block[3] = &unk_1000BED58;
  block[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(Property, block);
}

- (BOOL)isPerUser
{
  return 1;
}

- (BOOL)isLocal
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
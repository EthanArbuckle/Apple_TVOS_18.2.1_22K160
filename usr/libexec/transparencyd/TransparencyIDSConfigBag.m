@interface TransparencyIDSConfigBag
+ (TransparencyIDSConfigBag)sharedInstance;
- (BOOL)ktDisable;
- (IDSServerBag)bag;
- (NSOperationQueue)operationQueue;
- (TransparencyIDSConfigBag)init;
- (id)kbInfoArticleUrl;
- (void)setBag:(id)a3;
- (void)setKtDisable:(BOOL)a3;
- (void)setOperationQueue:(id)a3;
@end

@implementation TransparencyIDSConfigBag

+ (TransparencyIDSConfigBag)sharedInstance
{
  if (qword_1002EEEC0 != -1) {
    dispatch_once(&qword_1002EEEC0, &stru_1002899E0);
  }
  return (TransparencyIDSConfigBag *)(id)qword_1002EEEC8;
}

- (TransparencyIDSConfigBag)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___TransparencyIDSConfigBag;
  v2 = -[TransparencyIDSConfigBag init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IDSServerBag sharedInstance](&OBJC_CLASS___IDSServerBag, "sharedInstance"));
    -[TransparencyIDSConfigBag setBag:](v2, "setBag:", v3);

    v4 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = v4;

    v6 = v2;
  }

  return v2;
}

- (BOOL)ktDisable
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSConfigBag bag](self, "bag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"kt-min-idv-im"]);

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    uint64_t v7 = _IDSIDProtocolVersionNumber();
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v8 doubleValue];
    double v10 = v9;
    [v4 doubleValue];
    BOOL v12 = v10 < v11;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (id)kbInfoArticleUrl
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyIDSConfigBag bag](self, "bag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 objectForKey:@"kt-disable-info-url"]);

  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0) {
    id v6 = v3;
  }
  else {
    id v6 = 0LL;
  }

  return v6;
}

- (void)setKtDisable:(BOOL)a3
{
  self->ktDisable = a3;
}

- (IDSServerBag)bag
{
  return (IDSServerBag *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setBag:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
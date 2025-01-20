@interface LACUserInterfaceSpringBoardAdapter
- (LACUserInterfaceSpringBoardAdapter)initWithBundleId:(id)a3 configurationId:(id)a4;
- (void)dealloc;
- (void)processRequest:(id)a3 completion:(id)a4;
@end

@implementation LACUserInterfaceSpringBoardAdapter

- (LACUserInterfaceSpringBoardAdapter)initWithBundleId:(id)a3 configurationId:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___LACUserInterfaceSpringBoardAdapter;
  v9 = -[LACUserInterfaceSpringBoardAdapter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleId, a3);
    objc_storeStrong((id *)&v10->_configurationId, a4);
  }

  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___LACUserInterfaceSpringBoardAdapter;
  -[LACUserInterfaceSpringBoardAdapter dealloc](&v2, sel_dealloc);
}

- (void)processRequest:(id)a3 completion:(id)a4
{
  v5 = (void *)NSString;
  v6 = (void (**)(id, void *))a4;
  [v5 stringWithFormat:@"%@ is not supported in this platform", self];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  +[LACError errorWithCode:debugDescription:](&OBJC_CLASS___LACError, "errorWithCode:debugDescription:", -1020LL, v8);
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);
}

- (void).cxx_destruct
{
}

@end
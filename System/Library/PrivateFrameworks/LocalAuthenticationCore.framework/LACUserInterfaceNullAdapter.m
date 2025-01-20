@interface LACUserInterfaceNullAdapter
- (void)processRequest:(id)a3 completion:(id)a4;
@end

@implementation LACUserInterfaceNullAdapter

- (void)processRequest:(id)a3 completion:(id)a4
{
  v5 = (void *)NSString;
  v6 = (void (**)(id, void *))a4;
  [v5 stringWithFormat:@"%@ is not supported in this platform", self];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = +[LACError errorWithCode:debugDescription:](&OBJC_CLASS___LACError, "errorWithCode:debugDescription:", -1020LL, v8);
  v6[2](v6, v7);
}

@end
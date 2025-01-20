@interface NETestAgent
- (BOOL)isLocal;
- (BOOL)isPerUser;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation NETestAgent

- (void)startWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self) {
    id Property = objc_getProperty(self, v4, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  v7 = (dispatch_queue_s *)Property;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10006402C;
  v9[3] = &unk_1000BED58;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (BOOL)isPerUser
{
  return 1;
}

- (BOOL)isLocal
{
  return 1;
}

- (void).cxx_destruct
{
}

@end
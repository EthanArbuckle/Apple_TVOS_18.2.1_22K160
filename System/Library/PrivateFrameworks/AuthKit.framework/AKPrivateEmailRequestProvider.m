@interface AKPrivateEmailRequestProvider
- (void)requestURLWithCompletion:(id)a3;
@end

@implementation AKPrivateEmailRequestProvider

- (void)requestURLWithCompletion:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1000AA080;
  v5[3] = &unk_1001C6B10;
  v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___AKPrivateEmailRequestProvider;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[AKURLRequestProviderImpl requestURLWithCompletion:](&v4, "requestURLWithCompletion:", v5);
}

@end
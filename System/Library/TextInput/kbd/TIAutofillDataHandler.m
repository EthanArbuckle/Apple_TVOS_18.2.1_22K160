@interface TIAutofillDataHandler
- (void)reportSelectedAutofillCredential:(id)a3 completionHandler:(id)a4;
@end

@implementation TIAutofillDataHandler

- (void)reportSelectedAutofillCredential:(id)a3 completionHandler:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100004A84;
  v7[3] = &unk_1000147E8;
  id v8 = a3;
  id v9 = a4;
  id v5 = v9;
  id v6 = v8;
  TIDispatchAsync(&_dispatch_main_q, v7);
}

@end
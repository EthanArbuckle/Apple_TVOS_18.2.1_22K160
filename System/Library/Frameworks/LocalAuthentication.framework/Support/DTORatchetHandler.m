@interface DTORatchetHandler
- (DTORatchetHandler)initWithContextProvider:(id)a3 kvstore:(id)a4;
- (void)_ratchetStatusWithCompletion:(id)a3;
- (void)_resetRatchetWithCompletion:(id)a3;
- (void)ratchetStateCompositeWithCompletion:(id)a3;
- (void)ratchetStateWithCompletion:(id)a3;
- (void)resetRatchetWithCompletion:(id)a3;
- (void)restartRatchetWithIdentifier:(id)a3;
@end

@implementation DTORatchetHandler

- (DTORatchetHandler)initWithContextProvider:(id)a3 kvstore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___DTORatchetHandler;
  v9 = -[DTORatchetHandler init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextProvider, a3);
    objc_storeStrong((id *)&v10->_kvstore, a4);
  }

  return v10;
}

- (void)resetRatchetWithCompletion:(id)a3
{
}

- (void)restartRatchetWithIdentifier:(id)a3
{
  id v4 = a3;
  contextProvider = self->_contextProvider;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005EFC;
  v7[3] = &unk_100030C08;
  id v8 = v4;
  id v6 = v4;
  -[LACRemoteContextProviding createContextWithCompletion:](contextProvider, "createContextWithCompletion:", v7);
}

- (void)ratchetStateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100006314;
  v6[3] = &unk_100030C30;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[DTORatchetHandler _ratchetStatusWithCompletion:](self, "_ratchetStatusWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)ratchetStateCompositeWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000064A4;
  v6[3] = &unk_100030C30;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[DTORatchetHandler _ratchetStatusWithCompletion:](self, "_ratchetStatusWithCompletion:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_resetRatchetWithCompletion:(id)a3
{
  id v8 = 0LL;
  v3 = (void (**)(id, void))a3;
  unsigned int v4 = +[LAACMHelper resetRatchet:](&OBJC_CLASS___LAACMHelper, "resetRatchet:", &v8);
  id v5 = v8;
  id v6 = v5;
  if (v4) {
    id v7 = 0LL;
  }
  else {
    id v7 = v5;
  }
  ((void (**)(id, id))v3)[2](v3, v7);
}

- (void)_ratchetStatusWithCompletion:(id)a3
{
  id v6 = 0LL;
  v3 = (void (**)(id, void *, id))a3;
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(+[LAACMHelper ratchetStatusWithConfig:](&OBJC_CLASS___LAACMHelper, "ratchetStatusWithConfig:", &v6));
  id v5 = v6;
  v3[2](v3, v4, v5);
}

- (void).cxx_destruct
{
}

@end
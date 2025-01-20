@interface TVPAOSynchronizer
+ (id)syncAccessObjectWithFactory:(id)a3;
+ (void)flushWithCompletion:(id)a3;
+ (void)initialize;
- (TVPAOSynchronizer)init;
- (TVPAOSynchronizer)initWithFactory:(id)a3;
- (id)accessObject;
- (void)queueOperation:(id)a3;
- (void)queuePostOperation:(id)a3;
- (void)setAccessObject:(id)a3;
- (void)tearDownWithHandler:(id)a3;
@end

@implementation TVPAOSynchronizer

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___TVPAOSynchronizer, a2) == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create(0LL, 0LL);
    v3 = (void *)qword_100103318;
    qword_100103318 = (uint64_t)v2;
  }

+ (void)flushWithCompletion:(id)a3
{
  id v3 = a3;
  v4 = (dispatch_queue_s *)qword_100103318;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004E208;
  block[3] = &unk_1000C95F0;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

+ (id)syncAccessObjectWithFactory:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)a1) initWithFactory:v4];

  return v5;
}

- (TVPAOSynchronizer)init
{
}

- (TVPAOSynchronizer)initWithFactory:(id)a3
{
  id v4 = (uint64_t (**)(void))a3;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVPAOSynchronizer;
  id v5 = -[TVPAOSynchronizer init](&v13, "init");
  if (v5)
  {
    uint64_t v6 = v4[2](v4);
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    id accessObject = v5->_accessObject;
    v5->_id accessObject = (id)v7;

    [v5->_accessObject setSynchronizer:v5];
    v9 = (dispatch_queue_s *)qword_100103318;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004E354;
    block[3] = &unk_1000C9528;
    v12 = v5;
    dispatch_sync(v9, block);
  }

  return v5;
}

- (void)tearDownWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVPAOSynchronizer accessObject](self, "accessObject"));
  -[TVPAOSynchronizer setAccessObject:](self, "setAccessObject:", 0LL);
  uint64_t v6 = (dispatch_queue_s *)qword_100103318;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10004E41C;
  v9[3] = &unk_1000C95C8;
  id v10 = v5;
  id v11 = v4;
  id v7 = v5;
  id v8 = v4;
  dispatch_async(v6, v9);
}

- (void)queueOperation:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)qword_100103318;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10004E4D0;
  v7[3] = &unk_1000C9EF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)queuePostOperation:(id)a3
{
}

- (id)accessObject
{
  return self->_accessObject;
}

- (void)setAccessObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
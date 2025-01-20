@interface ADLocalMeCardStore
+ (id)sharedStore;
- (id)_init;
- (void)addMeCardObserver:(id)a3;
- (void)meCard:(id)a3;
- (void)removeMeCardObserver:(id)a3;
- (void)storeMeCard:(id)a3;
@end

@implementation ADLocalMeCardStore

- (id)_init
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ADLocalMeCardStore;
  v2 = -[ADLocalMeCardStore init](&v11, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("LocalMeCardStoreQueue", v4);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (dispatch_queue_s *)v2->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10025C774;
    block[3] = &unk_1004FD940;
    v10 = v2;
    dispatch_async(v7, block);
  }

  return v2;
}

- (void)storeMeCard:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10025C570;
  v7[3] = &unk_1004FD968;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)meCard:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10025C490;
  v7[3] = &unk_1004FD990;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addMeCardObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10025C478;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)removeMeCardObserver:(id)a3
{
  id v4 = a3;
  queue = (dispatch_queue_s *)self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10025C460;
  v7[3] = &unk_1004FD968;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void).cxx_destruct
{
}

+ (id)sharedStore
{
  if (qword_1005782A8 != -1) {
    dispatch_once(&qword_1005782A8, &stru_1004F7BB8);
  }
  return (id)qword_1005782A0;
}

@end
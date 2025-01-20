@interface CSAttSiriStateMonitor
+ (id)sharedInstance;
- (BOOL)isAttending;
- (BOOL)isAttendingForDictation;
- (CSAttSiriStateMonitor)init;
- (OS_dispatch_queue)queue;
- (unint64_t)attendingState;
- (unint64_t)getAttendingState;
- (void)setAttendingState:(unint64_t)a3;
- (void)setQueue:(id)a3;
- (void)updateState:(unint64_t)a3;
@end

@implementation CSAttSiriStateMonitor

- (CSAttSiriStateMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___CSAttSiriStateMonitor;
  v2 = -[CSAttSiriStateMonitor init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("CSAttSiriStateMonitor queue", 0LL);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_attendingState = 0LL;
  }

  return v2;
}

- (unint64_t)getAttendingState
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100093E6C;
  v5[3] = &unk_10022EF80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)updateState:(unint64_t)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100093D04;
  v4[3] = &unk_10022F020;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

- (BOOL)isAttending
{
  return -[CSAttSiriStateMonitor getAttendingState](self, "getAttendingState") != 0;
}

- (BOOL)isAttendingForDictation
{
  return (id)-[CSAttSiriStateMonitor getAttendingState](self, "getAttendingState") == (id)2;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)attendingState
{
  return self->_attendingState;
}

- (void)setAttendingState:(unint64_t)a3
{
  self->_attendingState = a3;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_10027FE90 != -1) {
    dispatch_once(&qword_10027FE90, &stru_10022BD30);
  }
  return (id)qword_10027FE88;
}

@end
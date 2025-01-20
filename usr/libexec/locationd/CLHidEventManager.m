@interface CLHidEventManager
- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6;
- (CLHidEventManagerDelegate)delegate;
- (HIDEventSystemClient)manager;
- (NSMutableArray)matching;
- (OS_dispatch_queue)delegateQueue;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMatching:(id)a3;
@end

@implementation CLHidEventManager

- (CLHidEventManager)initWithDelegate:(id)a3 queue:(id)a4 matching:(id)a5 type:(int64_t)a6
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___CLHidEventManager;
  v10 = -[CLHidEventManager init](&v22, "init");
  if (v10)
  {
    v11 = -[HIDEventSystemClient initWithType:](objc_alloc(&OBJC_CLASS___HIDEventSystemClient), "initWithType:", a6);
    v10->_delegateQueue = (OS_dispatch_queue *)a4;
    v10->_manager = v11;
    v10->_delegate = (CLHidEventManagerDelegate *)a3;
    v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    v10->_matching = v12;
    -[NSMutableArray addObject:](v12, "addObject:", a5);
    -[HIDEventSystemClient setMatching:](v10->_manager, "setMatching:", v10->_matching);
    -[HIDEventSystemClient setDispatchQueue:]( v10->_manager,  "setDispatchQueue:",  -[CLHidEventManager delegateQueue](v10, "delegateQueue"));
    manager = v10->_manager;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100E617E4;
    v21[3] = &unk_101888518;
    v21[4] = v10;
    -[HIDEventSystemClient setEventHandler:](manager, "setEventHandler:", v21);
    -[HIDEventSystemClient activate](v10->_manager, "activate");
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_101888538);
    }
    v14 = (os_log_s *)qword_1019344B8;
    if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEBUG))
    {
      id v15 = -[HIDEventSystemClient services](v10->_manager, "services");
      *(_DWORD *)buf = 138412290;
      id v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "[CLHidManager] enumerated these devices: %@",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1019344B0 != -1) {
        dispatch_once(&qword_1019344B0, &stru_101888538);
      }
      uint64_t v17 = qword_1019344B8;
      id v18 = -[HIDEventSystemClient services](v10->_manager, "services");
      int v23 = 138412290;
      id v24 = v18;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v17,  2LL,  "[CLHidManager] enumerated these devices: %@",  &v23,  12);
      v20 = (uint8_t *)v19;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHidEventManager initWithDelegate:queue:matching:type:]", "%s\n", v19);
      if (v20 != buf) {
        free(v20);
      }
    }
  }

  return v10;
}

- (void)dealloc
{
  -[NSMutableArray removeAllObjects](self->_matching, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHidEventManager;
  -[CLHidEventManager dealloc](&v3, "dealloc");
}

- (CLHidEventManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLHidEventManagerDelegate *)a3;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (HIDEventSystemClient)manager
{
  return self->_manager;
}

- (NSMutableArray)matching
{
  return self->_matching;
}

- (void)setMatching:(id)a3
{
}

@end
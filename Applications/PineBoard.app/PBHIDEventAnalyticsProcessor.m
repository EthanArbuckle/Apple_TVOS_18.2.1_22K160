@interface PBHIDEventAnalyticsProcessor
- (OS_dispatch_queue)queue;
- (PBHIDEventAnalyticsProcessor)initWithSenderLibrary:(id)a3;
- (PBHIDSenderLibrary)senderLibrary;
- (void)_mainQueue_processPressType:(int64_t)a3 sender:(id)a4;
- (void)_queue_processKeyboardEvent:(__IOHIDEvent *)a3 withUsagePage:(unsigned int)a4 usage:(unsigned int)a5 sender:(id)a6;
- (void)processEvent:(__IOHIDEvent *)a3;
@end

@implementation PBHIDEventAnalyticsProcessor

- (PBHIDEventAnalyticsProcessor)initWithSenderLibrary:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    v7 = v6;
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PBHIDEventAnalyticsProcessor;
    v8 = -[PBHIDEventAnalyticsProcessor init](&v15, "init");
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BSDispatchQueueAttributes serial](&OBJC_CLASS___BSDispatchQueueAttributes, "serial"));
      v10 = (void *)objc_claimAutoreleasedReturnValue([v9 serviceClass:9]);
      uint64_t v11 = BSDispatchQueueCreate(@"com.apple.PineBoard.HID.analytics", v10);
      queue = v8->_queue;
      v8->_queue = (OS_dispatch_queue *)v11;

      objc_storeStrong((id *)&v8->_senderLibrary, a3);
    }

    return v8;
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"senderLibrary"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100276748(a2, (uint64_t)self, (uint64_t)v14);
    }
    result = (PBHIDEventAnalyticsProcessor *)_bs_set_crash_log_message([v14 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)processEvent:(__IOHIDEvent *)a3
{
  if (a3 && IOHIDEventGetType(a3) == 3)
  {
    if (IOHIDEventGetIntegerValue(a3, 196610LL))
    {
      int IntegerValue = IOHIDEventGetIntegerValue(a3, 196608LL);
      int v6 = IOHIDEventGetIntegerValue(a3, 196609LL);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBHIDSenderLibrary senderForEvent:](self->_senderLibrary, "senderForEvent:", a3));
      CFRetain(a3);
      queue = (dispatch_queue_s *)self->_queue;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472LL;
      v10[2] = sub_10006CA24;
      v10[3] = &unk_1003D0098;
      id v11 = v7;
      v12 = a3;
      int v13 = IntegerValue;
      int v14 = v6;
      v10[4] = self;
      id v9 = v7;
      dispatch_async(queue, v10);
    }
  }

- (void)_queue_processKeyboardEvent:(__IOHIDEvent *)a3 withUsagePage:(unsigned int)a4 usage:(unsigned int)a5 sender:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  uint64_t v11 = sub_100173FA0(v7, a5);
  uint64_t v12 = v11;
  if ((_DWORD)v7 == 7 && v11 == -1)
  {
    uint64_t v12 = 0LL;
    switch(a5)
    {
      case 'O':
        uint64_t v12 = 3LL;
        goto LABEL_17;
      case 'P':
        uint64_t v12 = 2LL;
        goto LABEL_17;
      case 'Q':
        uint64_t v12 = 1LL;
        goto LABEL_17;
      case 'R':
        goto LABEL_17;
      default:
        if (a5 == 40)
        {
          uint64_t v12 = 4LL;
          goto LABEL_17;
        }

        if (a5 != 41) {
          goto LABEL_18;
        }
        uint64_t v12 = 5LL;
        break;
    }

    goto LABEL_12;
  }

  if (v11 != -1)
  {
    if (v11 != 101 && v11 != 5)
    {
LABEL_17:
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10006CBEC;
      block[3] = &unk_1003D1718;
      block[4] = self;
      uint64_t v20 = v12;
      id v19 = v10;
      dispatch_async(&_dispatch_main_q, block);

      goto LABEL_18;
    }

- (void)_mainQueue_processPressType:(int64_t)a3 sender:(id)a4
{
  id v5 = a4;
  +[PBDataReportingService incrementEventCountForRemoteButtonWithType:]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForRemoteButtonWithType:",  a3);
  if ((unint64_t)(a3 - 4) < 3 || a3 == 101)
  {
    switch((unint64_t)[v5 category])
    {
      case 1uLL:
        +[PBDataReportingService incrementEventCountForAppleBluetoothRemote]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForAppleBluetoothRemote");
        break;
      case 3uLL:
        +[PBDataReportingService incrementEventCountForBluetoothKeyboard]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForBluetoothKeyboard");
        break;
      case 4uLL:
        +[PBDataReportingService incrementEventCountForCEC]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForCEC");
        break;
      case 5uLL:
        +[PBDataReportingService incrementEventCountForIRRemote]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForIRRemote");
        break;
      case 6uLL:
        +[PBDataReportingService incrementEventCountForRemoteApp]( &OBJC_CLASS___PBDataReportingService,  "incrementEventCountForRemoteApp");
        break;
      default:
        break;
    }
  }

  if ([v5 category] == (id)1)
  {
    +[PBDataReportingService incrementB239ButtonPresses]( &OBJC_CLASS___PBDataReportingService,  "incrementB239ButtonPresses");
    if (a3 == 17) {
      +[PBDataReportingService incrementB239TVButtonPresses]( &OBJC_CLASS___PBDataReportingService,  "incrementB239TVButtonPresses");
    }
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (PBHIDSenderLibrary)senderLibrary
{
  return self->_senderLibrary;
}

- (void).cxx_destruct
{
}

@end
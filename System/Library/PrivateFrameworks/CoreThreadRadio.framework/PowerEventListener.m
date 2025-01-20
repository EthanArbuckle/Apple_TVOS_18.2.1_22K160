@interface PowerEventListener
- (BOOL)registerForEvents;
- (BOOL)willSleep;
- (PowerEventListener)initWithDelegate:(id)a3 queue:(id)a4;
- (id)delegate;
- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4;
- (void)allowSleep;
- (void)dealloc;
- (void)unregisterForEvents;
@end

@implementation PowerEventListener

- (PowerEventListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  v7 = (dispatch_queue_s *)a4;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PowerEventListener;
  v8 = -[PowerEventListener init](&v25, "init");
  v9 = v8;
  if (!v8) {
    goto LABEL_24;
  }
  objc_storeWeak(&v8->_delegate, v6);
  dispatch_queue_attr_t v10 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v10);
  if (v7)
  {
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2("wpantund.PowerEventListener.Queue", v11, v7);
    workQueue = v9->_workQueue;
    v9->_workQueue = (OS_dispatch_queue *)v12;

    v14 = sub_1000160F4("com.apple.wpantund", "default");
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "PowerEventListener: Cretaed WQ with Target Q";
      goto LABEL_11;
    }

    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_15:
    sub_1001FB53C();
    goto LABEL_16;
  }

  dispatch_queue_t v17 = dispatch_queue_create("wpantund.PowerEventListener.Queue", v11);
  v18 = v9->_workQueue;
  v9->_workQueue = (OS_dispatch_queue *)v17;

  v19 = sub_1000160F4("com.apple.wpantund", "default");
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (!v15)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }

  *(_WORD *)buf = 0;
  v16 = "PowerEventListener: Cretaed new WQ";
LABEL_11:
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v16, buf, 2u);
LABEL_16:

  v20 = sub_1000160F4("com.apple.wpantund", "default");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  if (v21)
  {
    if (sub_10015A058(6))
    {
      v22 = v21;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = v9->_workQueue;
        *(_DWORD *)buf = 138412546;
        v27 = v7;
        __int16 v28 = 2112;
        v29 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_INFO,  "PowerEventListener: Init with Queue: %@: rootQueue: %@",  buf,  0x16u);
      }
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FB53C();
  }

LABEL_24:
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PowerEventListener;
  -[PowerEventListener dealloc](&v3, "dealloc");
}

- (id)delegate
{
  v2 = self;
  objc_sync_enter(v2);
  id WeakRetained = objc_loadWeakRetained(&v2->_delegate);
  objc_sync_exit(v2);

  return WeakRetained;
}

- (BOOL)registerForEvents
{
  if (!self->_powerNotificationConnection)
  {
    io_connect_t v4 = IORegisterForSystemPower( self,  &self->_powerNotificationPort,  (IOServiceInterestCallback)sub_10012AE0C,  &self->_powerNotificationNotifier);
    self->_powerNotificationConnection = v4;
    BOOL v2 = v4 != 0;
    if (v4)
    {
      IONotificationPortSetDispatchQueue(self->_powerNotificationPort, (dispatch_queue_t)self->_workQueue);
      v5 = sub_1000160F4("com.apple.wpantund", "default");
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (v6)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "PowerEventListener: Success to register for PM notifications",  v9,  2u);
        }

        goto LABEL_16;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
    }

    else
    {
      v7 = sub_1000160F4("com.apple.wpantund", "default");
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (v6)
      {
        goto LABEL_16;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_15:
      }
        sub_1001FB53C();
    }

- (void)unregisterForEvents
{
  if (self->_powerNotificationConnection)
  {
    IODeregisterForSystemPower(&self->_powerNotificationNotifier);
    IONotificationPortDestroy(self->_powerNotificationPort);
    IOServiceClose(self->_powerNotificationConnection);
    self->_powerNotificationConnection = 0;
  }

- (void)_powerNotificationMessage:(unsigned int)a3 argument:(void *)a4
{
  HIDWORD(v4) = a3;
  LODWORD(v4) = a3 + 536870288;
  switch((v4 >> 4))
  {
    case 0u:
      v7 = sub_1000160F4("com.apple.wpantund", "default");
      v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (v8)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "PowerEventListener: Can Sleep", buf, 2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1001FB53C();
      }

      uint64_t v17 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)a4);
      if ((_DWORD)v17)
      {
        uint64_t v18 = v17;
        v19 = sub_1000160F4("com.apple.wpantund", "default");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
        if (v20)
        {
          if (sub_10015A058(4))
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_100211C8C(v18, v20, v21, v22, v23, v24, v25, v26);
            }
          }
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1001FB53C();
        }

        goto LABEL_66;
      }

      return;
    case 1u:
      v9 = sub_1000160F4("com.apple.wpantund", "default");
      dispatch_queue_attr_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PowerEventListener: Will Sleep", v37, 2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1001FB53C();
      }

      if (self->_willSleep)
      {
        v27 = sub_1000160F4("com.apple.wpantund", "default");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
        if (v20)
        {
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1001FB53C();
        }
      }

      else
      {
        self->_willSleep = 1;
        self->_sleepMessageArgument = a4;
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
        -[os_log_s powerEventListenerSystemWillSleep:](v20, "powerEventListenerSystemWillSleep:", self);
      }

      goto LABEL_66;
    case 2u:
      v11 = sub_1000160F4("com.apple.wpantund", "default");
      dispatch_queue_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (v12)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "PowerEventListener: Will Not Sleep",  v36,  2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1001FB53C();
      }

      if (self->_willSleep)
      {
        self->_willSleep = 0;
        __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
        char v29 = objc_opt_respondsToSelector(v28, "powerEventListenerSystemWillPowerOn:");

        if ((v29 & 1) == 0) {
          return;
        }
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
        -[os_log_s powerEventListenerSystemWillPowerOn:](v20, "powerEventListenerSystemWillPowerOn:", self);
      }

      else
      {
        v32 = sub_1000160F4("com.apple.wpantund", "default");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
        if (v20)
        {
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1001FB53C();
        }
      }

      goto LABEL_66;
    case 9u:
      v13 = sub_1000160F4("com.apple.wpantund", "default");
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (v14)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v34 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "PowerEventListener: Has Powered On",  v34,  2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1001FB53C();
      }

      self->_willSleep = 0;
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
      -[os_log_s powerEventListenerSystemPoweredOn:](v20, "powerEventListenerSystemPoweredOn:", self);
      goto LABEL_66;
    case 0xBu:
      v15 = sub_1000160F4("com.apple.wpantund", "default");
      v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (v16)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v35 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "PowerEventListener: Will Power On", v35, 2u);
        }
      }

      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_1001FB53C();
      }

      if (self->_willSleep)
      {
        self->_willSleep = 0;
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
        char v31 = objc_opt_respondsToSelector(v30, "powerEventListenerSystemWillPowerOn:");

        if ((v31 & 1) == 0) {
          return;
        }
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PowerEventListener delegate](self, "delegate"));
        -[os_log_s powerEventListenerSystemWillPowerOn:](v20, "powerEventListenerSystemWillPowerOn:", self);
      }

      else
      {
        v33 = sub_1000160F4("com.apple.wpantund", "default");
        v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
        if (v20)
        {
        }

        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_1001FB53C();
        }
      }

- (void)allowSleep
{
  dispatch_queue_t current_queue = dispatch_get_current_queue();
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(current_queue);
  v5 = sub_1000160F4("com.apple.wpantund", "default");
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (sub_10015A058(6) && os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      v19 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_INFO,  "PowerEventListener: allowSleep Received system sleep event on Q: %@",  (uint8_t *)&v18,  0xCu);
    }
  }

  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1001FB53C();
  }

  sleepMessageArgument = self->_sleepMessageArgument;
  self->_sleepMessageArgument = 0LL;
  if (self->_willSleep)
  {
    uint64_t v8 = IOAllowPowerChange(self->_powerNotificationConnection, (intptr_t)sleepMessageArgument);
    if ((_DWORD)v8)
    {
      v9 = sub_1000160F4("com.apple.wpantund", "default");
      dispatch_queue_attr_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (v10)
      {
        goto LABEL_21;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v17 = sub_1000160F4("com.apple.wpantund", "default");
      dispatch_queue_attr_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
      if (v10)
      {
        if (sub_10015A058(6) && os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v18 = 67109120;
          LODWORD(v19) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "PowerEventListener: allowSleep Returned %x",  (uint8_t *)&v18,  8u);
        }

        goto LABEL_21;
      }

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_20:
      }
        sub_1001FB53C();
    }

- (BOOL)willSleep
{
  return self->_willSleep;
}

- (void).cxx_destruct
{
}

@end
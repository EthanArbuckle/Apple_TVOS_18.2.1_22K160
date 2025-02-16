@interface MRDSleepObserver
- (IONotificationPort)port;
- (MRDSleepObserver)init;
- (MRDSleepObserverDelegate)delegate;
- (unsigned)connection;
- (unsigned)identifier;
- (void)notifyDelegateOfSleepWithCompletion:(id)a3;
- (void)notifyDelegateOfWake;
- (void)setDelegate:(id)a3;
@end

@implementation MRDSleepObserver

- (MRDSleepObserver)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___MRDSleepObserver;
  v2 = -[MRDSleepObserver init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_connection = IORegisterForSystemPower( v2,  &v2->_port,  (IOServiceInterestCallback)sub_10011E4C4,  &v2->_identifier);
    Main = CFRunLoopGetMain();
    RunLoopSource = IONotificationPortGetRunLoopSource(v3->_port);
    CFRunLoopAddSource(Main, RunLoopSource, kCFRunLoopDefaultMode);
  }

  return v3;
}

- (void)notifyDelegateOfSleepWithCompletion:(id)a3
{
  objc_super v7 = (void (**)(void))a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "sleepObserverSystemWillSleep:completion:");

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 sleepObserverSystemWillSleep:self completion:v7];
  }

  else if (v7)
  {
    v7[2]();
  }
}

- (void)notifyDelegateOfWake
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector(WeakRetained, "sleepObserverSystemDidWake:");

  if ((v5 & 1) != 0)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 sleepObserverSystemDidWake:self];
  }

- (MRDSleepObserverDelegate)delegate
{
  return (MRDSleepObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (unsigned)connection
{
  return self->_connection;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (IONotificationPort)port
{
  return self->_port;
}

- (void).cxx_destruct
{
}

@end
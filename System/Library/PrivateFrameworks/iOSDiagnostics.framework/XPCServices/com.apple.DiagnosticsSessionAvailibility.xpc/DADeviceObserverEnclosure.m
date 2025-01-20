@interface DADeviceObserverEnclosure
- (DADeviceObserver)observer;
- (DADeviceObserverEnclosure)initWithObserver:(id)a3 delegate:(id)a4;
- (DADeviceObserverEnclosureDelegate)delegate;
- (NSCopying)identifier;
- (NSSet)devices;
- (void)begin;
- (void)end;
- (void)oneshotWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation DADeviceObserverEnclosure

- (DADeviceObserverEnclosure)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___DADeviceObserverEnclosure;
  v9 = -[DADeviceObserverEnclosure init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    devices = v10->_devices;
    v10->_devices = (NSSet *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)begin
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
    v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472LL;
    id v8 = sub_1000058A0;
    v9 = &unk_10000C638;
    objc_copyWeak(&v10, &location);
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 beginDiscoveringDevicesWithHandler:&v6]);
    -[DADeviceObserverEnclosure setIdentifier:](self, "setIdentifier:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)end
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure identifier](self, "identifier"));
    [v4 endDiscoveringDevicesWithIdentifier:v5];

    -[DADeviceObserverEnclosure setIdentifier:](self, "setIdentifier:", 0LL);
  }

- (void)oneshotWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DADeviceObserverEnclosure observer](self, "observer"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100005B00;
  v7[3] = &unk_10000C660;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 discoverAllDevicesWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (DADeviceObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (DADeviceObserverEnclosureDelegate)delegate
{
  return (DADeviceObserverEnclosureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
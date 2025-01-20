@interface NIDevicePresenceNotifier
- (NIDevicePresenceNotifier)initWithParentSession:(id)a3;
- (void)notifyBluetoothSample:(id)a3;
@end

@implementation NIDevicePresenceNotifier

- (NIDevicePresenceNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NIDevicePresenceNotifier;
  v5 = -[NIDevicePresenceNotifier init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyBluetoothSample:(id)a3
{
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100282D8C;
    block[3] = &unk_1007A2248;
    id v11 = v6;
    id v12 = v9;
    dispatch_sync(v7, block);

    objc_super v8 = v11;
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2448 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end
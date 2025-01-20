@interface NICarKeyEventNotifier
- (NICarKeyEventNotifier)initWithParentSession:(id)a3;
- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3;
- (void)notifyVehicleLockedWithReason:(int64_t)a3;
- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3;
- (void)notifyVehicleSentRangingSuspendedSubEvent;
- (void)notifyVehicleTerminatedRangingSession;
- (void)notifyVehicleUnlockedWithReason:(int64_t)a3;
@end

@implementation NICarKeyEventNotifier

- (NICarKeyEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NICarKeyEventNotifier;
  v5 = -[NICarKeyEventNotifier init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyVehicleUnlockedWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1007D25F8;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100280CD4;
    block[3] = &unk_1007A2248;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2094 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleLockedWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1007D2610;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100280F04;
    block[3] = &unk_1007A2248;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2108 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1007D2628;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100281134;
    block[3] = &unk_1007A2248;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2122 description:@"Parent session is nil"];
  }
}

- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1007D2640;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
    v16[1] = v7;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100281364;
    block[3] = &unk_1007A2248;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2136 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleTerminatedRangingSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = @"CarKeyEventType";
    id v13 = &off_1007D2658;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10028155C;
    block[3] = &unk_1007A2248;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2150 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleSentRangingSuspendedSubEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v12 = @"CarKeyEventType";
    id v13 = &off_1007D2670;
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v13,  &v12,  1LL));
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100281754;
    block[3] = &unk_1007A2248;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }

  else
  {
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2164 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end
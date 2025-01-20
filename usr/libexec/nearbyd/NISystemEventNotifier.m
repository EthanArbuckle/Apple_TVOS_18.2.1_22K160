@interface NISystemEventNotifier
- (NISystemEventNotifier)initWithParentSession:(id)a3;
- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
- (void)notifyPassiveAccessIntent:(unsigned int)a3;
@end

@implementation NISystemEventNotifier

- (NISystemEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NISystemEventNotifier;
  v5 = -[NISystemEventNotifier init](&v8, "init");
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyPassiveAccessIntent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1007D25F8;
    v15[0] = @"SystemEventDictKey_EventType";
    v15[1] = @"SystemEventDictKey_PassiveAccessIntentOptions";
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v3));
    v16[1] = v7;
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  2LL));

    v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100284594;
    block[3] = &unk_1007A2248;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2727 description:@"Parent session is nil"];
  }
}

- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v20[0] = &off_1007D2610;
    v19[0] = @"SystemEventDictKey_EventType";
    v19[1] = @"SystemEventDictKey_ResourceUsageLimitExceededValue";
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v5));
    v20[1] = v9;
    v19[2] = @"SystemEventDictKey_ConfigurationType";
    id v10 = NSStringFromClass(a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v20[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));

    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([WeakRetained getInternalConnectionQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100284804;
    block[3] = &unk_1007A2248;
    id v17 = WeakRetained;
    id v18 = v12;
    id v14 = v12;
    dispatch_sync(v13, block);
  }

  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v15 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2743 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end
@interface SiriQuickTypeGestureSource
- (SiriQuickTypeGestureSource)init;
- (id)prewarm;
- (void)activate;
- (void)configureConnection;
@end

@implementation SiriQuickTypeGestureSource

- (SiriQuickTypeGestureSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SiriQuickTypeGestureSource;
  v2 = -[SiriQuickTypeGestureSource init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SiriQuickTypeGestureSource configureConnection](v2, "configureConnection");
  }
  return v3;
}

- (void)configureConnection
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[SASBoardServicesConfiguration configuration]( &OBJC_CLASS___SASBoardServicesConfiguration,  "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 machServiceIdentifier]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[SASBoardServicesConfiguration configuration]( &OBJC_CLASS___SASBoardServicesConfiguration,  "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifierForService:1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[BSServiceConnectionEndpoint endpointForMachName:service:instance:]( &OBJC_CLASS___BSServiceConnectionEndpoint,  "endpointForMachName:service:instance:",  v4,  v6,  0LL));

  uint64_t v8 = objc_claimAutoreleasedReturnValue( +[BSServiceConnection connectionWithEndpoint:]( &OBJC_CLASS___BSServiceConnection,  "connectionWithEndpoint:",  v7));
  uint64_t v9 = OBJC_IVAR___SiriActivationSource__connection;
  v10 = *(void **)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection];
  *(void *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection] = v8;

  objc_initWeak(&location, self);
  v11 = *(void **)&self->SiriActivationSource_opaque[v9];
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_10004252C;
  v15 = &unk_1000BB1A0;
  objc_copyWeak(&v16, &location);
  [v11 configureConnection:&v12];
  objc_msgSend(*(id *)&self->SiriActivationSource_opaque[v9], "activate", v12, v13, v14, v15);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (id)prewarm
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v4 = sub_100005A54(Current);
  objc_initWeak(&location, self);
  id v5 = objc_alloc(&OBJC_CLASS___SiriActivityAssertion);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472LL;
  v14 = sub_100042A98;
  v15 = &unk_1000BB1C8;
  objc_copyWeak(&v16, &location);
  id v8 = [v5 initWithIdentifier:v7 reference:@"SiriQuickTypeGestureSource.ActivityAssertion" reason:@"SiriQuickTypeGestureSource.ActivityAssertionReason.Prepare" timestamp:&v12 invalidationBlock:v4];

  uint64_t v9 = (os_unfair_lock_s *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__lock];
  os_unfair_lock_lock(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection],  "remoteTarget",  v12,  v13,  v14,  v15));
  [v10 prewarmForFirstTapOfQuickTypeToSiriGesture];

  os_unfair_lock_unlock(v9);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  return v8;
}

- (void)activate
{
  v3 = (os_unfair_lock_s *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__lock];
  os_unfair_lock_lock(v3);
  double v4 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)&self->SiriActivationSource_opaque[OBJC_IVAR___SiriActivationSource__connection] remoteTarget]);
  [v4 activationRequestFromSimpleActivation:&off_1000BECB0];

  os_unfair_lock_unlock(v3);
}

@end
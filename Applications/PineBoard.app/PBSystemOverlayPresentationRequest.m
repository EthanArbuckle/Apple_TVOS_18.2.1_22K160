@interface PBSystemOverlayPresentationRequest
- (BOOL)_insertAtFrontOfQueue;
- (BOOL)isAnimated;
- (NSDictionary)clientOptions;
- (NSString)identifier;
- (OS_os_log)signpostLog;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBSystemOverlayPresentationRequest)initWithRequest:(id)a3;
- (PBSystemOverlayUIProvider)provider;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)sceneDeactivationReasons;
@end

@implementation PBSystemOverlayPresentationRequest

- (PBSystemOverlayPresentationRequest)initWithRequest:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBSystemOverlayPresentationRequest;
  v5 = -[PBSystemOverlayPresentationRequest init](&v19, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 identifier]);
    v7 = (NSString *)[v6 copy];
    identifier = v5->_identifier;
    v5->_identifier = v7;

    v5->_animated = [v4 isAnimated];
    v5->_insertAtFrontOfQueue = [v4 _insertAtFrontOfQueue];
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 provider]);
    provider = v5->_provider;
    v5->_provider = (PBSystemOverlayUIProvider *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 clientOptions]);
    v12 = (NSDictionary *)[v11 copy];
    clientOptions = v5->_clientOptions;
    v5->_clientOptions = v12;

    v5->_sceneDeactivationReasons = (unint64_t)[v4 sceneDeactivationReasons];
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v4 coordinatedTransitionToken]);
    coordinatedTransitionToken = v5->_coordinatedTransitionToken;
    v5->_coordinatedTransitionToken = (PBCoordinatedTransitionToken *)v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue([v4 signpostLog]);
    signpostLog = v5->_signpostLog;
    v5->_signpostLog = (OS_os_log *)v16;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayPresentationRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest),  "initWithRequest:",  self);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (PBSystemOverlayUIProvider)provider
{
  return self->_provider;
}

- (NSDictionary)clientOptions
{
  return self->_clientOptions;
}

- (unint64_t)sceneDeactivationReasons
{
  return self->_sceneDeactivationReasons;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (BOOL)_insertAtFrontOfQueue
{
  return self->_insertAtFrontOfQueue;
}

- (OS_os_log)signpostLog
{
  return self->_signpostLog;
}

- (void).cxx_destruct
{
}

@end
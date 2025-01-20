@interface PBMutableSystemOverlayPresentationRequest
- (PBMutableSystemOverlayPresentationRequest)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)_setInsertAtFrontOfQueue:(BOOL)a3;
- (void)setAnimated:(BOOL)a3;
- (void)setClientOptions:(id)a3;
- (void)setCoordinatedTransitionToken:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setProvider:(id)a3;
- (void)setSceneDeactivationReasons:(unint64_t)a3;
- (void)setSignpostLog:(id)a3;
@end

@implementation PBMutableSystemOverlayPresentationRequest

- (PBMutableSystemOverlayPresentationRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest;
  return -[PBSystemOverlayPresentationRequest initWithRequest:](&v3, "initWithRequest:", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayPresentationRequest initWithRequest:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayPresentationRequest),  "initWithRequest:",  self);
}

- (void)setIdentifier:(id)a3
{
  v4 = (NSString *)[a3 copy];
  identifier = self->super._identifier;
  self->super._identifier = v4;
}

- (void)setAnimated:(BOOL)a3
{
  self->super._animated = a3;
}

- (void)setProvider:(id)a3
{
}

- (void)setClientOptions:(id)a3
{
  v4 = (NSDictionary *)[a3 copy];
  clientOptions = self->super._clientOptions;
  self->super._clientOptions = v4;
}

- (void)setSceneDeactivationReasons:(unint64_t)a3
{
  self->super._sceneDeactivationReasons = a3;
}

- (void)setCoordinatedTransitionToken:(id)a3
{
}

- (void)setSignpostLog:(id)a3
{
}

- (void)_setInsertAtFrontOfQueue:(BOOL)a3
{
  self->super._insertAtFrontOfQueue = a3;
}

@end
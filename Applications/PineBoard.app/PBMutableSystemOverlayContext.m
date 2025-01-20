@interface PBMutableSystemOverlayContext
- (PBMutableSystemOverlayContext)init;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLayoutLevel:(int64_t)a3;
- (void)setSceneDeactivationReasons:(unint64_t)a3;
@end

@implementation PBMutableSystemOverlayContext

- (PBMutableSystemOverlayContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBMutableSystemOverlayContext;
  return -[PBSystemOverlayContext initWithContext:](&v3, "initWithContext:", 0LL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayContext initWithContext:]( objc_alloc(&OBJC_CLASS___PBSystemOverlayContext),  "initWithContext:",  self);
}

- (void)setLayoutLevel:(int64_t)a3
{
  self->super._layoutLevel = a3;
}

- (void)setSceneDeactivationReasons:(unint64_t)a3
{
  self->super._sceneDeactivationReasons = a3;
}

@end
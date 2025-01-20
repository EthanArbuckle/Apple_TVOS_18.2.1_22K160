@interface PBSystemOverlayContext
- (PBSystemOverlayContext)initWithContext:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)layoutLevel;
- (unint64_t)sceneDeactivationReasons;
@end

@implementation PBSystemOverlayContext

- (PBSystemOverlayContext)initWithContext:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBSystemOverlayContext;
  v5 = -[PBSystemOverlayContext init](&v7, "init");
  if (v5)
  {
    v5->_layoutLevel = (int64_t)[v4 layoutLevel];
    v5->_sceneDeactivationReasons = (unint64_t)[v4 sceneDeactivationReasons];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PBSystemOverlayContext initWithContext:]( objc_alloc(&OBJC_CLASS___PBMutableSystemOverlayContext),  "initWithContext:",  self);
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (unint64_t)sceneDeactivationReasons
{
  return self->_sceneDeactivationReasons;
}

@end
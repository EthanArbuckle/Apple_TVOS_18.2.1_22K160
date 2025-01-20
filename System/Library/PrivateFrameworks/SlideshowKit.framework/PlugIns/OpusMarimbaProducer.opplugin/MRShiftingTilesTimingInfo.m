@interface MRShiftingTilesTimingInfo
- (NSArray)additionalTimingInfo;
- (NSArray)layouts;
- (NSIndexSet)remove;
- (id)description;
- (void)dealloc;
- (void)setAdditionalTimingInfo:(id)a3;
- (void)setLayouts:(id)a3;
- (void)setRemove:(id)a3;
@end

@implementation MRShiftingTilesTimingInfo

- (void)dealloc
{
  self->layouts = 0LL;
  self->remove = 0LL;

  self->additionalTimingInfo = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MRShiftingTilesTimingInfo;
  -[MRShiftingTilesTimingInfo dealloc](&v3, "dealloc");
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"fallLeft: %d, fallDirection: %d, isTop: %d, layouts: %@, add: %d, remove: %@, slideIndex: %d",  self->fallLeft,  self->fallDirection,  self->isTop,  self->layouts,  self->add,  self->remove,  self->slideIndex);
}

- (NSArray)layouts
{
  return self->layouts;
}

- (void)setLayouts:(id)a3
{
}

- (NSIndexSet)remove
{
  return self->remove;
}

- (void)setRemove:(id)a3
{
}

- (NSArray)additionalTimingInfo
{
  return &self->additionalTimingInfo->super;
}

- (void)setAdditionalTimingInfo:(id)a3
{
}

@end
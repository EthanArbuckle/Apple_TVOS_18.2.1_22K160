@interface MRShiftingTilesIteration
- (id)description;
@end

@implementation MRShiftingTilesIteration

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"layout: %d, age: %d, slideIndex: %d",  self->layout,  self->age,  self->slideIndex);
}

@end
@interface PBButtonDownPressGestureRecognizerDescriptor
- (PBButtonDownPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4;
@end

@implementation PBButtonDownPressGestureRecognizerDescriptor

- (PBButtonDownPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBButtonDownPressGestureRecognizerDescriptor;
  return -[PBLongPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:]( &v5,  "initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:",  a3,  a4,  &off_1003FEB00);
}

@end
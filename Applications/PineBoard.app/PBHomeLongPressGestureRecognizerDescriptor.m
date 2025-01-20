@interface PBHomeLongPressGestureRecognizerDescriptor
- (PBHomeLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4 minimumPressDuration:(id)a5;
- (PBHomeLongPressGestureRecognizerDescriptor)initWithNumberOfTapsRequired:(id)a3 minimumPressDuration:(id)a4;
@end

@implementation PBHomeLongPressGestureRecognizerDescriptor

- (PBHomeLongPressGestureRecognizerDescriptor)initWithNumberOfTapsRequired:(id)a3 minimumPressDuration:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBHomeLongPressGestureRecognizerDescriptor;
  return -[PBLongPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:]( &v5,  "initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:",  &off_1003FE788,  a3,  a4);
}

- (PBHomeLongPressGestureRecognizerDescriptor)initWithAllowedPressTypes:(id)a3 numberOfTapsRequired:(id)a4 minimumPressDuration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"allowedPressTypes == ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284A04(a2, (uint64_t)self, (uint64_t)v15);
    }
    result = (PBHomeLongPressGestureRecognizerDescriptor *)_bs_set_crash_log_message([v15 UTF8String]);
    __break(0);
  }

  else
  {
    v12 = v11;
    v13 = -[PBHomeLongPressGestureRecognizerDescriptor initWithNumberOfTapsRequired:minimumPressDuration:]( self,  "initWithNumberOfTapsRequired:minimumPressDuration:",  v10,  v11);

    return v13;
  }

  return result;
}

@end
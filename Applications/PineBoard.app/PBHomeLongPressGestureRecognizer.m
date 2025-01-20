@interface PBHomeLongPressGestureRecognizer
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowedPressTypes:(id)a3;
@end

@implementation PBHomeLongPressGestureRecognizer

- (void)setAllowedPressTypes:(id)a3
{
  id v5 = a3;
  if ([v5 count] && (objc_msgSend(v5, "isEqualToArray:", &off_1003FE908) & 1) == 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[allowedPressTypes count] == 0 || [allowedPressTypes isEqualToArray:@[ @(UIPressTypeHome) ]]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028BA9C(a2, (uint64_t)self, (uint64_t)v6);
    }
    _bs_set_crash_log_message([v6 UTF8String]);
    __break(0);
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___PBHomeLongPressGestureRecognizer;
    -[PBHomeLongPressGestureRecognizer setAllowedPressTypes:](&v7, "setAllowedPressTypes:", v5);
  }

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 _hidEvent];
  if (v8
    && ((uint64_t BaseAttributes = BKSHIDEventGetBaseAttributes(v8),
         v10 = (void *)objc_claimAutoreleasedReturnValue(BaseAttributes),
         unsigned int v11 = [v10 source],
         v10,
         v11 == 4)
     || v11 == 9))
  {
    -[PBHomeLongPressGestureRecognizer setState:](self, "setState:", 5LL);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBHomeLongPressGestureRecognizer;
    -[PBHomeLongPressGestureRecognizer pressesBegan:withEvent:](&v12, "pressesBegan:withEvent:", v6, v7);
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 _hidEvent];
  if (v8
    && ((uint64_t BaseAttributes = BKSHIDEventGetBaseAttributes(v8),
         v10 = (void *)objc_claimAutoreleasedReturnValue(BaseAttributes),
         unsigned int v11 = [v10 source],
         v10,
         v11 == 4)
     || v11 == 9))
  {
    -[PBHomeLongPressGestureRecognizer setState:](self, "setState:", 5LL);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBHomeLongPressGestureRecognizer;
    -[PBHomeLongPressGestureRecognizer pressesChanged:withEvent:](&v12, "pressesChanged:withEvent:", v6, v7);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 _hidEvent];
  if (v8
    && ((uint64_t BaseAttributes = BKSHIDEventGetBaseAttributes(v8),
         v10 = (void *)objc_claimAutoreleasedReturnValue(BaseAttributes),
         unsigned int v11 = [v10 source],
         v10,
         v11 == 4)
     || v11 == 9))
  {
    -[PBHomeLongPressGestureRecognizer setState:](self, "setState:", 5LL);
  }

  else
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PBHomeLongPressGestureRecognizer;
    -[PBHomeLongPressGestureRecognizer pressesEnded:withEvent:](&v12, "pressesEnded:withEvent:", v6, v7);
  }
}

@end
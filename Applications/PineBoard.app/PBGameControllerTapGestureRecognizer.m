@interface PBGameControllerTapGestureRecognizer
- (BOOL)isHomePressType;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setAllowedPressTypes:(id)a3;
@end

@implementation PBGameControllerTapGestureRecognizer

- (void)setAllowedPressTypes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBGameControllerTapGestureRecognizer;
  id v4 = a3;
  -[PBGameControllerTapGestureRecognizer setAllowedPressTypes:](&v6, "setAllowedPressTypes:", v4);
  unsigned __int8 v5 = objc_msgSend(v4, "isEqualToArray:", &off_1003FE920, v6.receiver, v6.super_class);

  self->_isHomePressType = v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1001C220C(v7, self->_isHomePressType))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBGameControllerTapGestureRecognizer;
    -[PBGameControllerTapGestureRecognizer pressesBegan:withEvent:](&v8, "pressesBegan:withEvent:", v6, v7);
  }

  else
  {
    -[PBGameControllerTapGestureRecognizer setState:](self, "setState:", 5LL);
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1001C220C(v7, self->_isHomePressType))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBGameControllerTapGestureRecognizer;
    -[PBGameControllerTapGestureRecognizer pressesChanged:withEvent:](&v8, "pressesChanged:withEvent:", v6, v7);
  }

  else
  {
    -[PBGameControllerTapGestureRecognizer setState:](self, "setState:", 5LL);
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (sub_1001C220C(v7, self->_isHomePressType))
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBGameControllerTapGestureRecognizer;
    -[PBGameControllerTapGestureRecognizer pressesEnded:withEvent:](&v8, "pressesEnded:withEvent:", v6, v7);
  }

  else
  {
    -[PBGameControllerTapGestureRecognizer setState:](self, "setState:", 5LL);
  }
}

- (BOOL)isHomePressType
{
  return self->_isHomePressType;
}

@end
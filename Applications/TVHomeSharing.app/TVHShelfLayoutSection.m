@interface TVHShelfLayoutSection
- (CGRect)firstItemFrame;
- (CGRect)itemFrameAtIndex:(unint64_t)a3;
- (CGRect)itemFrames;
- (CGRect)itemsBoundingFrame;
- (CGRect)lastItemFrame;
- (unint64_t)numberOfItems;
- (void)dealloc;
- (void)setItemFrame:(CGRect)a3 atIndex:(unint64_t)a4;
- (void)setItemFrames:(CGRect *)a3;
- (void)setItemsBoundingFrame:(CGRect)a3;
- (void)setNumberOfItems:(unint64_t)numberOfItems;
@end

@implementation TVHShelfLayoutSection

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVHShelfLayoutSection;
  -[TVHShelfLayoutSection dealloc](&v3, "dealloc");
}

- (void)setNumberOfItems:(unint64_t)numberOfItems
{
  if (self->_numberOfItems != numberOfItems)
  {
    self->_numberOfItems = numberOfItems;
    itemFrames = self->_itemFrames;
    if (itemFrames)
    {
      free(itemFrames);
      self->_itemFrames = 0LL;
      numberOfItems = self->_numberOfItems;
    }

    if (numberOfItems) {
      self->_itemFrames = (CGRect *)calloc(numberOfItems, 0x20uLL);
    }
  }

- (CGRect)firstItemFrame
{
  if (self->_numberOfItems) {
    itemFrames = self->_itemFrames;
  }
  else {
    itemFrames = (CGRect *)&CGRectZero;
  }
  double width = itemFrames->size.width;
  double height = itemFrames->size.height;
  double x = itemFrames->origin.x;
  double y = itemFrames->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)lastItemFrame
{
  unint64_t numberOfItems = self->_numberOfItems;
  if (numberOfItems) {
    objc_super v3 = &self->_itemFrames[numberOfItems - 1];
  }
  else {
    objc_super v3 = &CGRectZero;
  }
  double width = v3->size.width;
  double height = v3->size.height;
  double x = v3->origin.x;
  double y = v3->origin.y;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)itemFrameAtIndex:(unint64_t)a3
{
  objc_super v3 = &self->_itemFrames[a3];
  double x = v3->origin.x;
  double y = v3->origin.y;
  double width = v3->size.width;
  double height = v3->size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setItemFrame:(CGRect)a3 atIndex:(unint64_t)a4
{
  self->_itemFrames[a4] = a3;
}

- (unint64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (CGRect)itemsBoundingFrame
{
  double x = self->_itemsBoundingFrame.origin.x;
  double y = self->_itemsBoundingFrame.origin.y;
  double width = self->_itemsBoundingFrame.size.width;
  double height = self->_itemsBoundingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setItemsBoundingFrame:(CGRect)a3
{
  self->_itemsBoundingFrame = a3;
}

- (CGRect)itemFrames
{
  return self->_itemFrames;
}

- (void)setItemFrames:(CGRect *)a3
{
  self->_itemFrames = a3;
}

@end
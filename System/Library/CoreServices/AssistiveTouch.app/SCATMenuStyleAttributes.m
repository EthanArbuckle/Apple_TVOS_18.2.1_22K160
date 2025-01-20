@interface SCATMenuStyleAttributes
+ (CGSize)itemSize;
+ (id)dockStyleAttributes;
+ (id)popoverStyleAttributes;
- (CGSize)itemSpacingLandscape;
- (CGSize)itemSpacingPortrait;
- (unint64_t)maxItemsPerRow;
- (unint64_t)maxRows;
- (void)setItemSpacingLandscape:(CGSize)a3;
- (void)setItemSpacingPortrait:(CGSize)a3;
- (void)setMaxItemsPerRow:(unint64_t)a3;
- (void)setMaxRows:(unint64_t)a3;
@end

@implementation SCATMenuStyleAttributes

+ (CGSize)itemSize
{
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)popoverStyleAttributes
{
  double v2 = objc_alloc_init(&OBJC_CLASS___SCATMenuStyleAttributes);
  -[SCATMenuStyleAttributes setItemSpacingLandscape:](v2, "setItemSpacingLandscape:", 15.0, 30.0);
  -[SCATMenuStyleAttributes setItemSpacingPortrait:](v2, "setItemSpacingPortrait:", 15.0, 30.0);
  -[SCATMenuStyleAttributes setMaxItemsPerRow:](v2, "setMaxItemsPerRow:", 8LL);
  -[SCATMenuStyleAttributes setMaxRows:](v2, "setMaxRows:", 3LL);
  return v2;
}

+ (id)dockStyleAttributes
{
  double v3 = objc_alloc_init(&OBJC_CLASS___SCATMenuStyleAttributes);
  uint64_t IsPad = AXDeviceIsPad(v3, v4);
  if ((_DWORD)IsPad) {
    double v7 = 40.0;
  }
  else {
    double v7 = 5.0;
  }
  else {
    double v8 = 5.0;
  }
  -[SCATMenuStyleAttributes setMaxItemsPerRow:](v3, "setMaxItemsPerRow:", 100LL);
  -[SCATMenuStyleAttributes setMaxRows:](v3, "setMaxRows:", 1LL);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v9 scale];
  if (v10 == 1.0) {
    double v11 = 15.0;
  }
  else {
    double v11 = 16.0;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen"));
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  double v17 = fmax(v14, v16) + -30.0;
  double v18 = fmin(v14, v16) + v11 * -2.0;
  [a1 itemSize];
  double v20 = ceil((v17 - v7) / (v7 + v19));
  double v21 = ceil((v18 - v8) / (v8 + v19));
  double v22 = (v17 - v19 * v20) / (v20 + 1.0);
  double v23 = (v18 - v19 * v21) / (v21 + 1.0);
  if (v22 >= v7) {
    double v24 = v7;
  }
  else {
    double v24 = v22;
  }
  if (v24 < 5.0) {
    double v24 = 5.0;
  }
  if (v23 >= v8) {
    double v25 = v8;
  }
  else {
    double v25 = v23;
  }
  if (v25 >= 5.0) {
    double v26 = v25;
  }
  else {
    double v26 = 5.0;
  }
  -[SCATMenuStyleAttributes setItemSpacingLandscape:](v3, "setItemSpacingLandscape:", v24, 0.0);
  -[SCATMenuStyleAttributes setItemSpacingPortrait:](v3, "setItemSpacingPortrait:", v26, 0.0);
  return v3;
}

- (CGSize)itemSpacingLandscape
{
  double width = self->_itemSpacingLandscape.width;
  double height = self->_itemSpacingLandscape.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSpacingLandscape:(CGSize)a3
{
  self->_itemSpacingLandscape = a3;
}

- (CGSize)itemSpacingPortrait
{
  double width = self->_itemSpacingPortrait.width;
  double height = self->_itemSpacingPortrait.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSpacingPortrait:(CGSize)a3
{
  self->_itemSpacingPortrait = a3;
}

- (unint64_t)maxItemsPerRow
{
  return self->_maxItemsPerRow;
}

- (void)setMaxItemsPerRow:(unint64_t)a3
{
  self->_maxItemsPerRow = a3;
}

- (unint64_t)maxRows
{
  return self->_maxRows;
}

- (void)setMaxRows:(unint64_t)a3
{
  self->_maxRows = a3;
}

@end
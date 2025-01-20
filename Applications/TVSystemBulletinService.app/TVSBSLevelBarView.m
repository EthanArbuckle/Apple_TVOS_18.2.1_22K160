@interface TVSBSLevelBarView
+ (CGRect)_boundsForNumLevels:(unint64_t)a3;
- (TVSBSLevelBarView)initWithCoder:(id)a3;
- (TVSBSLevelBarView)initWithFrame:(CGRect)a3;
- (TVSBSLevelBarView)initWithNumLevels:(unint64_t)a3;
- (unint64_t)level;
- (unint64_t)numLevels;
- (void)_updateLevels;
- (void)layoutSubviews;
- (void)setLevel:(unint64_t)a3;
@end

@implementation TVSBSLevelBarView

- (TVSBSLevelBarView)initWithFrame:(CGRect)a3
{
  return -[TVSBSLevelBarView initWithCoder:](v3, v4, v5);
}

- (TVSBSLevelBarView)initWithCoder:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0LL;
  v9 = -[TVSBSLevelBarView initWithFrame:]( v3,  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
  objc_storeStrong((id *)&v9, v9);
  objc_exception_throw(   +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  NSGenericException,  @"[_TVBulletinLevelView -initWithCoder:] should not be used.",  0LL));
  return -[TVSBSLevelBarView initWithNumLevels:](v4, v5, v6);
}

- (TVSBSLevelBarView)initWithNumLevels:(unint64_t)a3
{
  v25 = self;
  SEL v24 = a2;
  unint64_t v23 = a3;
  [(id)objc_opt_class(self) _boundsForNumLevels:a3];
  double v19 = v3;
  double v20 = v4;
  double v21 = v5;
  double v22 = v6;
  v25 = 0LL;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TVSBSLevelBarView;
  v14 = -[TVSBSLevelBarView initWithFrame:](&v18, "initWithFrame:", v3, v4, v5, v6);
  v25 = v14;
  objc_storeStrong((id *)&v25, v14);
  if (v14)
  {
    v25->_numLevels = v23;
    v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    for (unint64_t i = 0LL; i < v25->_numLevels; ++i)
    {
      v15 = -[UIView initWithFrame:]( objc_alloc(&OBJC_CLASS___UIView),  "initWithFrame:",  CGRectZero.origin.x,  CGRectZero.origin.y,  CGRectZero.size.width,  CGRectZero.size.height);
      -[TVSBSLevelBarView addSubview:](v25, "addSubview:", v15);
      -[NSMutableArray addObject:](v17, "addObject:", v15);
      objc_storeStrong((id *)&v15, 0LL);
    }

    v7 = (NSArray *)-[NSMutableArray copy](v17, "copy");
    boxes = v25->_boxes;
    v25->_boxes = v7;

    v11 = v25;
    v12 = +[UIColor colorWithWhite:alpha:](&OBJC_CLASS___UIColor, "colorWithWhite:alpha:", 0.0, 0.3);
    -[TVSBSLevelBarView setBackgroundColor:](v11, "setBackgroundColor:");

    objc_storeStrong((id *)&v17, 0LL);
  }

  v10 = v25;
  objc_storeStrong((id *)&v25, 0LL);
  return v10;
}

- (void)layoutSubviews
{
  v15 = self;
  SEL v14 = a2;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___TVSBSLevelBarView;
  -[TVSBSLevelBarView layoutSubviews](&v13, "layoutSubviews");
  v9[0] = 0LL;
  v9[1] = v9;
  int v10 = 0x20000000;
  int v11 = 32;
  double v12 = 2.0;
  boxes = v15->_boxes;
  double v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  double v6 = sub_100008730;
  v7 = &unk_10002C8D0;
  v8 = v9;
  -[NSArray enumerateObjectsUsingBlock:](boxes, "enumerateObjectsUsingBlock:", &v3);
  _Block_object_dispose(v9, 8);
}

- (void)setLevel:(unint64_t)a3
{
  if (self->_level != a3)
  {
    self->_level = a3;
    -[TVSBSLevelBarView _updateLevels](self, "_updateLevels");
  }

+ (CGRect)_boundsForNumLevels:(unint64_t)a3
{
  double y = CGRectZero.origin.y;
  double x = CGRectZero.origin.x;
  double v5 = (double)a3 * 11.0 + (double)(a3 + 1) * 2.0;
  double v6 = 11.0;
  result.size.height = v6;
  result.size.width = v5;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_updateLevels
{
  double v12 = self;
  SEL v11 = a2;
  BOOL v10 = -[TVSBSLevelBarView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection") == (id)1;
  boxes = v12->_boxes;
  double v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  double v6 = sub_1000089F0;
  v7 = &unk_10002C8F8;
  BOOL v9 = v10;
  v8 = v12;
  -[NSArray enumerateObjectsUsingBlock:](boxes, "enumerateObjectsUsingBlock:");
  objc_storeStrong((id *)&v8, 0LL);
}

- (unint64_t)numLevels
{
  return self->_numLevels;
}

- (unint64_t)level
{
  return self->_level;
}

- (void).cxx_destruct
{
}

@end
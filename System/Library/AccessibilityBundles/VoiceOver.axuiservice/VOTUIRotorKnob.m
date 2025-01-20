@interface VOTUIRotorKnob
- (CGPoint)_trackPointForPlacement:(double)a3;
- (VOTUIRotorKnob)initWithFrame:(CGRect)a3;
- (int64_t)count;
- (void)_layoutKnob;
- (void)_layoutMarkerAtPosition:(CGPoint)a3 withCircleLocation:(double)a4 withImageView:(id)a5;
- (void)_layoutTrackMarks;
- (void)_layoutTrackMarks:(int64_t)a3 placements:(double)a4;
- (void)_updateSelectedMarker;
- (void)layoutSubviews;
- (void)reset;
- (void)setCount:(int64_t)a3;
- (void)updatePosition:(BOOL)a3;
@end

@implementation VOTUIRotorKnob

- (VOTUIRotorKnob)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___VOTUIRotorKnob;
  v3 = -[VOTUIRotorKnob initWithFrame:](&v19, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = +[NSBundle bundleForClass:](&OBJC_CLASS___NSBundle, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", @"empty", v5));
  emptyMarkImage = v3->_emptyMarkImage;
  v3->_emptyMarkImage = (UIImage *)v6;

  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", @"filled", v5));
  selectedMarkImage = v3->_selectedMarkImage;
  v3->_selectedMarkImage = (UIImage *)v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](&OBJC_CLASS___UIImage, "imageNamed:inBundle:", @"rotor", v5));
  v11 = (MarkerImageView *)[objc_allocWithZone((Class)MarkerImageView) initWithImage:v10];
  knobImageView = v3->_knobImageView;
  v3->_knobImageView = v11;

  v13 = (NSMutableArray *)[objc_allocWithZone(NSMutableArray) init];
  markerImageViews = v3->_markerImageViews;
  v3->_markerImageViews = v13;

  uint64_t v15 = 8LL;
  do
  {
    id v16 = [objc_allocWithZone((Class)MarkerImageView) initWithImage:v3->_emptyMarkImage];
    -[NSMutableArray addObject:](v3->_markerImageViews, "addObject:", v16);

    --v15;
  }

  while (v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](&OBJC_CLASS___UIColor, "clearColor"));
  -[VOTUIRotorKnob setBackgroundColor:](v3, "setBackgroundColor:", v17);

  -[VOTUIRotorKnob addSubview:](v3, "addSubview:", v3->_knobImageView);
  return v3;
}

- (void)updatePosition:(BOOL)a3
{
  int64_t position = self->_position;
  if (a3) {
    int64_t v4 = position + 1;
  }
  else {
    int64_t v4 = position - 1;
  }
  self->_int64_t position = v4;
  int64_t count = self->_count;
  if (v4 < 0)
  {
    int64_t v4 = count - 1;
  }

  else
  {
    if (v4 < count) {
      goto LABEL_9;
    }
    int64_t v4 = 0LL;
  }

  self->_int64_t position = v4;
LABEL_9:
  self->_lastMovementSkippedEmptySpace = 0;
  int64_t v6 = self->_count;
  int v7 = a3;
  if (v6 == 3)
  {
LABEL_12:
    self->_lastMovementSkippedEmptySpace = v4 == v7;
    goto LABEL_13;
  }

  if (v6 == 2)
  {
    int v7 = !a3;
    goto LABEL_12;
  }

- (void)setCount:(int64_t)a3
{
  if (self->_count != a3)
  {
    uint64_t v3 = 8LL;
    if (a3 < 8) {
      uint64_t v3 = a3;
    }
    self->_int64_t count = v3;
    int64_t position = self->_position;
    if (position >= v3) {
      self->_int64_t position = position % v3;
    }
    self->_needsLayout = 1;
    -[VOTUIRotorKnob setNeedsLayout](self, "setNeedsLayout");
  }

- (void)_updateSelectedMarker
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_markerImageViews, "objectAtIndex:", self->_position));
  [v3 setImage:self->_selectedMarkImage];
}

- (void)_layoutKnob
{
  if (self->_needsLayout)
  {
    unint64_t position = self->_position;
    if ((position & 0x8000000000000000LL) == 0
      && position < (unint64_t)-[NSMutableArray count](self->_markerImageViews, "count"))
    {
      int64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_markerImageViews, "objectAtIndex:", self->_position));
      [v4 rotationRadian];
      CGFloat v6 = v5;
      -[MarkerImageView rotationRadian](self->_knobImageView, "rotationRadian");
      double v8 = v7;
      __int128 v9 = *(_OWORD *)&CGAffineTransformIdentity.c;
      *(_OWORD *)&v21.a = *(_OWORD *)&CGAffineTransformIdentity.a;
      *(_OWORD *)&v21.c = v9;
      *(_OWORD *)&v21.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
      CGAffineTransformMakeRotation(&v20, v6);
      BOOL lastMovementSkippedEmptySpace = self->_lastMovementSkippedEmptySpace;
      if (lastMovementSkippedEmptySpace)
      {
        CGAffineTransform v21 = v20;
        int64_t count = self->_count;
        double v12 = 0.100000001;
        if (count == 3)
        {
          double v13 = (v6 + v8) * 0.5;
          goto LABEL_10;
        }

        if (count == 2)
        {
          double v13 = 1.57079633;
LABEL_10:
          CGAffineTransformMakeRotation(&v19, v13);
          CGAffineTransform v20 = v19;
        }
      }

      else
      {
        double v12 = 0.150000006;
      }

      -[MarkerImageView setRotationRadian:](self->_knobImageView, "setRotationRadian:", v6);
      v17[0] = _NSConcreteStackBlock;
      CGAffineTransform v18 = v20;
      v17[1] = 3221225472LL;
      v17[2] = sub_5BC8;
      v17[3] = &unk_246B8;
      v17[4] = self;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_5C10;
      v14[3] = &unk_24708;
      v14[4] = self;
      BOOL v16 = lastMovementSkippedEmptySpace;
      *(double *)&v14[5] = v12;
      CGAffineTransform v15 = v21;
      +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v17,  v14,  v12);
    }
  }

- (void)_layoutMarkerAtPosition:(CGPoint)a3 withCircleLocation:(double)a4 withImageView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a5;
  objc_msgSend(v9, "setCenter:", x, y);
  CGFloat v10 = a4 * 6.28318531;
  [v9 setRotationRadian:v10];
  CGAffineTransformMakeRotation(&v12, v10);
  CGAffineTransform v11 = v12;
  [v9 setTransform:&v11];
  -[VOTUIRotorKnob addSubview:](self, "addSubview:", v9);
}

- (void)reset
{
  markerImageViews = self->_markerImageViews;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_5E24;
  v3[3] = &unk_24730;
  v3[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](markerImageViews, "enumerateObjectsUsingBlock:", v3);
}

- (CGPoint)_trackPointForPlacement:(double)a3
{
  double v5 = v4;
  double v7 = v6;
  __double2 v8 = __sincos_stret(a3 * 6.28318531);
  float v9 = v5 + v8.__cosval * 38.0;
  double v10 = ceilf(v9);
  float v11 = v7 + v8.__sinval * 38.0;
  double v12 = ceilf(v11);
  double v13 = v10;
  result.double y = v12;
  result.double x = v13;
  return result;
}

- (void)_layoutTrackMarks:(int64_t)a3 placements:(double)a4
{
  v14 = (double *)&v15;
  if (a3 >= 1)
  {
    for (uint64_t i = 0LL; i != a3; ++i)
    {
      -[VOTUIRotorKnob _trackPointForPlacement:](self, "_trackPointForPlacement:", a4);
      double v9 = v8;
      double v11 = v10;
      double v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](self->_markerImageViews, "objectAtIndex:", i));
      -[VOTUIRotorKnob _layoutMarkerAtPosition:withCircleLocation:withImageView:]( self,  "_layoutMarkerAtPosition:withCircleLocation:withImageView:",  v12,  v9,  v11,  a4);

      double v13 = v14++;
      a4 = *v13;
    }
  }

- (void)_layoutTrackMarks
{
  int64_t count = self->_count;
  BOOL v3 = count < 2;
  int64_t v4 = count - 2;
  if (!v3)
  {
    switch(v4)
    {
      case 0LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  2LL,  0.625,  0x3FEC000000000000LL,  v5,  v6,  v7,  v8,  v9,  v10);
        break;
      case 1LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  3LL,  0.0,  0x3FE0000000000000LL,  0x3FE8000000000000LL,  v6,  v7,  v8,  v9,  v10);
        break;
      case 2LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  4LL,  0.0,  0x3FD0000000000000LL,  0x3FE0000000000000LL,  0x3FE8000000000000LL,  v7,  v8,  v9,  v10);
        break;
      case 3LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  5LL,  0.150000006,  0x3FD6666660000000LL,  0x3FE19999A0000000LL,  0x3FE8000000000000LL,  0x3FEE666660000000LL,  v8,  v9,  v10);
        break;
      case 4LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  6LL,  0.075000003,  0x3FD0000000000000LL,  0x3FDB333340000000LL,  0x3FE2666660000000LL,  0x3FE8000000000000LL,  0x3FED9999A0000000LL,  v9,  v10);
        break;
      case 5LL:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  7LL,  0.0500000007,  0x3FC6666660000000LL,  0x3FD4CCCCC0000000LL,  0x3FDCCCCCC0000000LL,  0x3FE3333340000000LL,  0x3FE8000000000000LL,  0x3FECCCCCC0000000LL,  v10);
        break;
      default:
        -[VOTUIRotorKnob _layoutTrackMarks:placements:]( self,  "_layoutTrackMarks:placements:",  8LL,  0.0,  0x3FC0000000000000LL,  0x3FD0000000000000LL,  0x3FD8000000000000LL,  0x3FE0000000000000LL,  0x3FE4000000000000LL,  0x3FE8000000000000LL,  0x3FEC000000000000LL);
        break;
    }
  }

- (void)layoutSubviews
{
  CGFloat x = v8.origin.x;
  CGFloat y = v8.origin.y;
  CGFloat width = v8.size.width;
  CGFloat height = v8.size.height;
  double MidX = CGRectGetMidX(v8);
  v9.origin.CGFloat x = x;
  v9.origin.CGFloat y = y;
  v9.size.CGFloat width = width;
  v9.size.CGFloat height = height;
  -[MarkerImageView setCenter:](self->_knobImageView, "setCenter:", MidX, CGRectGetMaxY(v9) + -67.0);
  -[VOTUIRotorKnob _layoutTrackMarks](self, "_layoutTrackMarks");
  -[VOTUIRotorKnob _layoutKnob](self, "_layoutKnob");
}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
}

@end
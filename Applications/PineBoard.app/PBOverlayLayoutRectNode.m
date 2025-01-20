@interface PBOverlayLayoutRectNode
- (BOOL)intersectsRect:(CGRect)a3;
- (BOOL)isEqual:(id)a3;
- (CGRect)subtractionRect;
- (NSObject)key;
- (PBOverlayLayoutRectNode)initWithKey:(id)a3 bounds:(CGRect)a4 subtracting:(CGRect)a5;
- (PBOverlayLayoutRectNode)initWithNode:(id)a3 key:(id)a4;
- (unint64_t)hash;
- (void)addPossibleOffsetsForContainingRect:(CGRect)a3 along:(unint64_t)a4 toSet:(id)a5;
@end

@implementation PBOverlayLayoutRectNode

- (PBOverlayLayoutRectNode)initWithKey:(id)a3 bounds:(CGRect)a4 subtracting:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  id v14 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutRectNode;
  v15 = -[PBOverlayLayoutRectNode init](&v29, "init");
  if (v15)
  {
    v16 = [v14 copyWithZone:0];
    keCGFloat y = v15->_key;
    v15->_keCGFloat y = v16;

    v30.origin.CGFloat x = v12;
    v30.origin.CGFloat y = v11;
    v30.size.CGFloat width = v10;
    v30.size.CGFloat height = v9;
    v15->_x[0] = CGRectGetMinX(v30);
    v31.origin.CGFloat x = v12;
    v31.origin.CGFloat y = v11;
    v31.size.CGFloat width = v10;
    v31.size.CGFloat height = v9;
    v15->_x[3] = CGRectGetMaxX(v31);
    CGFloat v28 = v9;
    CGFloat v18 = height;
    double v19 = v15->_x[0];
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = v18;
    double MinX = CGRectGetMinX(v32);
    if (v19 >= MinX) {
      double MinX = v19;
    }
    v15->_x[1] = MinX;
    double v21 = v15->_x[3];
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = v18;
    double MaxX = CGRectGetMaxX(v33);
    if (v21 < MaxX) {
      double MaxX = v21;
    }
    v15->_x[2] = MaxX;
    v34.origin.CGFloat x = v12;
    v34.origin.CGFloat y = v11;
    v34.size.CGFloat width = v10;
    v34.size.CGFloat height = v28;
    v15->_y[0] = CGRectGetMinY(v34);
    v35.origin.CGFloat x = v12;
    v35.origin.CGFloat y = v11;
    v35.size.CGFloat width = v10;
    v35.size.CGFloat height = v28;
    v15->_y[3] = CGRectGetMaxY(v35);
    double v23 = v15->_y[0];
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.CGFloat width = width;
    v36.size.CGFloat height = v18;
    double MinY = CGRectGetMinY(v36);
    if (v23 >= MinY) {
      double MinY = v23;
    }
    v15->_y[1] = MinY;
    double v25 = v15->_y[3];
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = v18;
    double MaxY = CGRectGetMaxY(v37);
    if (v25 < MaxY) {
      double MaxY = v25;
    }
    v15->_y[2] = MaxY;
    sub_1001C9E00();
  }

  return v15;
}

- (PBOverlayLayoutRectNode)initWithNode:(id)a3 key:(id)a4
{
  v6 = (char *)a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___PBOverlayLayoutRectNode;
  v8 = -[PBOverlayLayoutRectNode init](&v15, "init");
  CGFloat v9 = (PBOverlayLayoutRectNode *)v8;
  if (v6 && v8)
  {
    __int128 v10 = *(_OWORD *)(v6 + 8);
    *(_OWORD *)(v8 + 24) = *(_OWORD *)(v6 + 24);
    *(_OWORD *)(v8 + 8) = v10;
    __int128 v11 = *(_OWORD *)(v6 + 40);
    *(_OWORD *)(v8 + 56) = *(_OWORD *)(v6 + 56);
    *(_OWORD *)(v8 + 40) = v11;
    CGFloat v12 = [v7 copyWithZone:0];
    keCGFloat y = v9->_key;
    v9->_keCGFloat y = v12;
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  for (uint64_t i = 0LL; i != 4; ++i)
  {
    id v5 = [v3 appendCGFloat:self->_x[i]];
    id v6 = [v3 appendCGFloat:self->_y[i]];
  }

  id v7 = [v3 hash];

  return (unint64_t)v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBOverlayLayoutRectNode));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  keCGFloat y = self->_key;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100108984;
  v21[3] = &unk_1003D2130;
  id v8 = v4;
  id v22 = v8;
  id v9 = [v6 appendObject:key counterpart:v21];
  if ([v6 isEqual])
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1001089A4;
    v19[3] = &unk_1003D7930;
    v19[4] = self;
    id v10 = v8;
    id v20 = v10;
    __int128 v11 = objc_retainBlock(v19);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_1001089D0;
    v17[3] = &unk_1003D7930;
    v17[4] = self;
    id v18 = v10;
    CGFloat v12 = objc_retainBlock(v17);
    v13 = objc_retainBlock(v12);
    id v14 = objc_msgSend(v6, "appendEqualsBlocks:", v11, v13, 0);
  }

  unsigned __int8 v15 = [v6 isEqual];

  return v15;
}

- (CGRect)subtractionRect
{
  double v2 = self->_x[1];
  double v3 = self->_x[2] - v2;
  double v4 = self->_y[1];
  double v5 = self->_y[2] - v4;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v4;
  result.origin.CGFloat x = v2;
  return result;
}

- (BOOL)intersectsRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double MinX = CGRectGetMinX(a3);
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v15);
  BOOL v10 = self->_x[0] > MinX || self->_x[1] < MaxX;
  if (!v10 || self->_x[2] <= MinX && self->_x[3] >= MaxX) {
    return 0;
  }
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v16);
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v17);
  if (self->_y[0] <= MinY && self->_y[1] >= MaxY) {
    return 0;
  }
  if (self->_y[2] <= MinY) {
    return self->_y[3] < MaxY;
  }
  return 1;
}

- (void)addPossibleOffsetsForContainingRect:(CGRect)a3 along:(unint64_t)a4 toSet:(id)a5
{
  char v5 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  if ((v5 & 1) != 0)
  {
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGFloat MinX = CGRectGetMinX(v20);
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGFloat MaxX = CGRectGetMaxX(v21);
    double v16 = 0.0;
    double v17 = 0.0;
    int v12 = sub_100169BB8(&MinX, self->_x, &v16);
    if (v12)
    {
      if (v12 == 2)
      {
        [v11 addOffset:1 forAxis:v16];
        double v13 = v17;
      }

      else
      {
        if (v12 != 1) {
          goto LABEL_9;
        }
        double v13 = v16;
      }
    }

    else
    {
      double v13 = 0.0;
    }

    [v11 addOffset:1 forAxis:v13];
  }

- (NSObject)key
{
  return self->_key;
}

- (void).cxx_destruct
{
}

@end
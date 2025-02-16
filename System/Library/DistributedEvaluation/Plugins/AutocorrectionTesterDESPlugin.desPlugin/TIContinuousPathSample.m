@interface TIContinuousPathSample
+ (BOOL)supportsSecureCoding;
- (CGPoint)point;
- (TIContinuousPathSample)initWithCoder:(id)a3;
- (TIContinuousPathSample)initWithJsonDictionary:(id)a3;
- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6;
- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6 stage:(int)a7 pathIndex:(int64_t)a8;
- (double)force;
- (double)radius;
- (double)timeStamp;
- (id)description;
- (id)toJsonDictionary;
- (int)stage;
- (int64_t)pathIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TIContinuousPathSample

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_point = &self->_point;
  id v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSValue value:withObjCType:](&OBJC_CLASS___NSValue, "value:withObjCType:", p_point, "{CGPoint=dd}"));
  [v5 encodeObject:v6 forKey:@"point"];
  [v5 encodeDouble:@"timeStamp" forKey:self->_timeStamp];
  [v5 encodeDouble:@"force" forKey:self->_force];
  [v5 encodeDouble:@"radius" forKey:self->_radius];
  [v5 encodeInteger:self->_stage forKey:@"stage"];
  [v5 encodeInteger:self->_pathIndex forKey:@"path_index"];
}

- (TIContinuousPathSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TIContinuousPathSample;
  id v5 = -[TIContinuousPathSample init](&v12, "init");
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(NSValue) forKey:@"point"];
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v7 getValue:&v5->_point size:16];
    [v4 decodeDoubleForKey:@"timeStamp"];
    v5->_timeStamp = v8;
    [v4 decodeDoubleForKey:@"force"];
    v5->_force = v9;
    [v4 decodeDoubleForKey:@"radius"];
    v5->_radius = v10;
    v5->_stage = [v4 decodeIntegerForKey:@"stage"];
    v5->_pathIndex = (int64_t)[v4 decodeIntegerForKey:@"path_index"];
  }

  return v5;
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6
{
  return -[TIContinuousPathSample initWithPoint:timeStamp:force:radius:stage:pathIndex:]( self,  "initWithPoint:timeStamp:force:radius:stage:pathIndex:",  7LL,  -1LL,  a3.x,  a3.y,  a4,  a5,  a6);
}

- (TIContinuousPathSample)initWithPoint:(CGPoint)a3 timeStamp:(double)a4 force:(double)a5 radius:(double)a6 stage:(int)a7 pathIndex:(int64_t)a8
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___TIContinuousPathSample;
  result = -[TIContinuousPathSample init](&v16, "init");
  if (result)
  {
    result->_point.CGFloat x = x;
    result->_point.CGFloat y = y;
    result->_timeStamp = a4;
    result->_force = a5;
    result->_radius = a6;
    result->_stage = a7;
    result->_pathIndeCGFloat x = a8;
  }

  return result;
}

- (TIContinuousPathSample)initWithJsonDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___TIContinuousPathSample;
  id v5 = -[TIContinuousPathSample init](&v26, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"x"]);
    [v6 floatValue];
    float v8 = v7;

    double v9 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"y"]);
    [v9 floatValue];
    float v11 = v10;

    v5->_point.CGFloat x = v8;
    v5->_point.CGFloat y = v11;
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"t"]);
    [v12 floatValue];
    v5->_timeStamp = v13;

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"force"]);
    [v14 floatValue];
    v5->_force = v15;

    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"stage"]);
    v17 = v16;
    if (v16) {
      unsigned int v18 = [v16 intValue];
    }
    else {
      unsigned int v18 = 7;
    }
    v5->_stage = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"path_index"]);
    v20 = v19;
    if (v19) {
      uint64_t v21 = (int)[v19 intValue];
    }
    else {
      uint64_t v21 = -1LL;
    }
    v5->_pathIndeCGFloat x = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"radius"]);
    v23 = v22;
    if (v22)
    {
      [v22 floatValue];
      v5->_radius = v24;
    }
  }

  return v5;
}

- (id)toJsonDictionary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  CGFloat x = self->_point.x;
  *(float *)&CGFloat x = x;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", x));
  [v3 setObject:v5 forKeyedSubscript:@"x"];

  CGFloat y = self->_point.y;
  *(float *)&CGFloat y = y;
  float v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", y));
  [v3 setObject:v7 forKeyedSubscript:@"y"];

  double timeStamp = self->_timeStamp;
  *(float *)&double timeStamp = timeStamp;
  double v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", timeStamp));
  [v3 setObject:v9 forKeyedSubscript:@"t"];

  double force = self->_force;
  *(float *)&double force = force;
  float v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", force));
  [v3 setObject:v11 forKeyedSubscript:@"force"];

  double radius = self->_radius;
  *(float *)&double radius = radius;
  float v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](&OBJC_CLASS___NSNumber, "numberWithFloat:", radius));
  [v3 setObject:v13 forKeyedSubscript:@"radius"];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInt:",  self->_stage));
  [v3 setObject:v14 forKeyedSubscript:@"stage"];

  float v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", LODWORD(self->_pathIndex)));
  [v3 setObject:v15 forKeyedSubscript:@"path_index"];

  return v3;
}

- (id)description
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"<%@: %p",  objc_opt_class(self),  self);
  -[TIContinuousPathSample point](self, "point");
  uint64_t v5 = v4;
  -[TIContinuousPathSample point](self, "point");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"; point = (%.1f,%.1f)", v5, v6);
  -[TIContinuousPathSample timeStamp](self, "timeStamp");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"; double timeStamp = %f", v7);
  -[TIContinuousPathSample radius](self, "radius");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"; double radius = %f", v8);
  -[TIContinuousPathSample force](self, "force");
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"; double force = %f", v9);
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"; stage = %u",
    -[TIContinuousPathSample stage](self, "stage"));
  -[NSMutableString appendFormat:]( v3,  "appendFormat:",  @"; pathIndeCGFloat x = %ld",
    -[TIContinuousPathSample pathIndex](self, "pathIndex"));
  -[NSMutableString appendString:](v3, "appendString:", @">");
  return v3;
}

- (CGPoint)point
{
  double x = self->_point.x;
  double y = self->_point.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)timeStamp
{
  return self->_timeStamp;
}

- (double)force
{
  return self->_force;
}

- (double)radius
{
  return self->_radius;
}

- (int)stage
{
  return self->_stage;
}

- (int64_t)pathIndex
{
  return self->_pathIndex;
}

@end
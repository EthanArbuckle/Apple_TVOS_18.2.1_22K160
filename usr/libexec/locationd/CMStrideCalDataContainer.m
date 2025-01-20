@interface CMStrideCalDataContainer
+ (BOOL)supportsSecureCoding;
- (CMStrideCalDataContainer)initWithCoder:(id)a3;
- (CMStrideCalDataContainer)initWithTrack:(id)a3 session:(int64_t)a4;
- (CalibrationTrack)track;
- (double)gradient;
- (id)description;
- (int64_t)gradientValidity;
- (int64_t)session;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setGradient:(double)a3;
@end

@implementation CMStrideCalDataContainer

- (CMStrideCalDataContainer)initWithTrack:(id)a3 session:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CMStrideCalDataContainer;
  v6 = -[CMStrideCalDataContainer init](&v8, "init");
  if (v6)
  {
    v6->_track = (CalibrationTrack *)a3;
    v6->_session = a4;
    v6->_gradient = 0.0;
    v6->_gradientValidity = -1LL;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMStrideCalDataContainer)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CMStrideCalDataContainer;
  v4 = -[CMStrideCalDataContainer init](&v7, "init");
  if (v4)
  {
    v4->_track = (CalibrationTrack *) [a3 decodeObjectOfClass:objc_opt_class(CalibrationTrack) forKey:@"kCMStrideCalDataContainerKeyTrack"];
    v4->_session = (int64_t)[a3 decodeIntegerForKey:@"kCMStrideCalDataContainerKeySession"];
    [a3 decodeDoubleForKey:@"kCMStrideCalDataContainerKeyGradient"];
    v4->_gradient = v5;
    v4->_gradientValidity = (int64_t)[a3 decodeIntegerForKey:@"kCMStrideCalDataContainerKeyGradientValidity"];
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CMStrideCalDataContainer;
  -[CMStrideCalDataContainer dealloc](&v3, "dealloc");
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  double v5 = -[CMStrideCalDataContainer track](self, "track");
  id v6 = +[CMWorkout workoutName:]( &OBJC_CLASS___CMWorkout,  "workoutName:",  -[CMStrideCalDataContainer session](self, "session"));
  -[CMStrideCalDataContainer gradient](self, "gradient");
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@,Track,%@,Session,%@,Gradient,%0.6f,GradientValid,%ld",  v4,  v5,  v6,  v7,  -[CMStrideCalDataContainer gradientValidity](self, "gradientValidity"));
}

- (void)setGradient:(double)a3
{
  self->_gradient = a3;
  self->_gradientValidity = fabs(a3) <= 2.0;
}

- (CalibrationTrack)track
{
  return self->_track;
}

- (int64_t)session
{
  return self->_session;
}

- (double)gradient
{
  return self->_gradient;
}

- (int64_t)gradientValidity
{
  return self->_gradientValidity;
}

@end
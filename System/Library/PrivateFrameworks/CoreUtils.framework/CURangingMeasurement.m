@interface CURangingMeasurement
+ (BOOL)supportsSecureCoding;
- (CURangingMeasurement)initWithCoder:(id)a3;
- (NSError)error;
- (NSString)identifier;
- (double)distanceError;
- (double)distanceMeters;
- (double)horizontalAngle;
- (double)horizontalError;
- (double)ptsScore;
- (double)verticalAngle;
- (double)verticalError;
- (id)description;
- (unint64_t)timestampTicks;
- (unsigned)flags;
- (void)encodeWithCoder:(id)a3;
- (void)setDistanceError:(double)a3;
- (void)setDistanceMeters:(double)a3;
- (void)setError:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHorizontalAngle:(double)a3;
- (void)setHorizontalError:(double)a3;
- (void)setIdentifier:(id)a3;
- (void)setPtsScore:(double)a3;
- (void)setTimestampTicks:(unint64_t)a3;
- (void)setVerticalAngle:(double)a3;
- (void)setVerticalError:(double)a3;
@end

@implementation CURangingMeasurement

- (CURangingMeasurement)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CURangingMeasurement;
  v5 = -[CURangingMeasurement init](&v27, sel_init);
  if (v5)
  {
    id v6 = v4;
    if ([v6 containsValueForKey:@"dM"])
    {
      [v6 decodeDoubleForKey:@"dM"];
      v5->_distanceMeters = v7;
    }

    id v8 = v6;
    if ([v8 containsValueForKey:@"dE"])
    {
      [v8 decodeDoubleForKey:@"dE"];
      v5->_distanceError = v9;
    }

    id v10 = v8;
    uint64_t v11 = objc_opt_class();
    NSDecodeObjectIfPresent(v10, @"e", v11, (void **)&v5->_error);

    id v12 = v10;
    if ([v12 containsValueForKey:@"hA"])
    {
      [v12 decodeDoubleForKey:@"hA"];
      v5->_horizontalAngle = v13;
    }

    id v14 = v12;
    if ([v14 containsValueForKey:@"hE"])
    {
      [v14 decodeDoubleForKey:@"hE"];
      v5->_horizontalError = v15;
    }

    id v16 = v14;
    uint64_t v17 = objc_opt_class();
    NSDecodeObjectIfPresent(v16, @"id", v17, (void **)&v5->_identifier);

    id v18 = v16;
    if ([v18 containsValueForKey:@"vA"])
    {
      [v18 decodeDoubleForKey:@"vA"];
      v5->_verticalAngle = v19;
    }

    id v20 = v18;
    if ([v20 containsValueForKey:@"vE"])
    {
      [v20 decodeDoubleForKey:@"vE"];
      v5->_verticalError = v21;
    }

    id v22 = v20;
    if ([v22 containsValueForKey:@"pS"])
    {
      [v22 decodeDoubleForKey:@"pS"];
      v5->_ptsScore = v23;
    }

    id v24 = v22;
    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (self->_distanceMeters != 0.0)
  {
    objc_msgSend(v4, "encodeDouble:forKey:", @"dM");
    id v4 = v9;
  }

  if (self->_distanceError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"dE");
    id v4 = v9;
  }

  error = self->_error;
  if (error)
  {
    [v9 encodeObject:error forKey:@"e"];
    id v4 = v9;
  }

  uint64_t flags = self->_flags;
  if ((_DWORD)flags)
  {
    [v9 encodeInt64:flags forKey:@"fl"];
    id v4 = v9;
  }

  if (self->_horizontalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"hA");
    id v4 = v9;
  }

  if (self->_horizontalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"hE");
    id v4 = v9;
  }

  identifier = self->_identifier;
  if (identifier)
  {
    [v9 encodeObject:identifier forKey:@"id"];
    id v4 = v9;
  }

  if (self->_verticalAngle != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"vA");
    id v4 = v9;
  }

  if (self->_verticalError != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"vE");
    id v4 = v9;
  }

  if (self->_ptsScore != 0.0)
  {
    objc_msgSend(v9, "encodeDouble:forKey:", @"pS");
    id v4 = v9;
  }

  unint64_t timestampTicks = self->_timestampTicks;
  if (timestampTicks)
  {
    [v9 encodeInt64:timestampTicks forKey:@"ts"];
    id v4 = v9;
  }
}

- (id)description
{
  CFMutableStringRef v14 = 0LL;
  NSAppendPrintF(&v14);
  v3 = v14;
  id v4 = v3;
  if (self->_ptsScore != 0.0)
  {
    CFMutableStringRef v13 = v3;
    NSAppendPrintF(&v13);
    v5 = v13;

    id v4 = v5;
  }

  if (self->_flags)
  {
    CFMutableStringRef v12 = v4;
    NSAppendPrintF(&v12);
    id v6 = v12;

    id v4 = v6;
  }

  error = self->_error;
  if (error)
  {
    CFMutableStringRef v11 = v4;
    id v10 = error;
    NSAppendPrintF(&v11);
    id v8 = v11;

    id v4 = v8;
  }

  return v4;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(double)a3
{
  self->_distanceMeters = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceError:(double)a3
{
  self->_distanceError = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_uint64_t flags = a3;
}

- (double)horizontalAngle
{
  return self->_horizontalAngle;
}

- (void)setHorizontalAngle:(double)a3
{
  self->_horizontalAngle = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalError:(double)a3
{
  self->_horizontalError = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (double)verticalAngle
{
  return self->_verticalAngle;
}

- (void)setVerticalAngle:(double)a3
{
  self->_verticalAngle = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalError:(double)a3
{
  self->_verticalError = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_unint64_t timestampTicks = a3;
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
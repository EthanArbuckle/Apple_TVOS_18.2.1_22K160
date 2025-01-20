@interface CBSpatialMeasurement
- (CBSpatialMeasurement)initWithXPCObject:(id)a3 error:(id *)a4;
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
- (void)encodeWithXPCObject:(id)a3;
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

@implementation CBSpatialMeasurement

- (CBSpatialMeasurement)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v13 = -[CBSpatialMeasurement init](self, "init");
  if (!v13)
  {
    if (a4)
    {
      v20 = "init failed";
LABEL_25:
      CBErrorF(-6756, (uint64_t)v20, v7, v8, v9, v10, v11, v12, v21);
      v18 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }

- (void)encodeWithXPCObject:(id)a3
{
  id v4 = a3;
  v5 = v4;
  double distanceMeters = self->_distanceMeters;
  if (distanceMeters != 0.0) {
    xpc_dictionary_set_double(v4, "dM", distanceMeters);
  }
  double distanceError = self->_distanceError;
  if (distanceError != 0.0) {
    xpc_dictionary_set_double(v5, "dE", distanceError);
  }
  if (self->_error) {
    CUXPCEncodeNSError();
  }
  uint64_t flags = self->_flags;
  if ((_DWORD)flags) {
    xpc_dictionary_set_uint64(v5, "flgs", flags);
  }
  double horizontalAngle = self->_horizontalAngle;
  if (horizontalAngle != 0.0) {
    xpc_dictionary_set_double(v5, "hA", horizontalAngle);
  }
  double horizontalError = self->_horizontalError;
  if (horizontalError != 0.0) {
    xpc_dictionary_set_double(v5, "hE", horizontalError);
  }
  identifier = self->_identifier;
  xpc_object_t xdict = v5;
  uint64_t v12 = -[NSString UTF8String](identifier, "UTF8String");
  if (v12) {
    xpc_dictionary_set_string(xdict, "id", v12);
  }

  double verticalAngle = self->_verticalAngle;
  if (verticalAngle != 0.0) {
    xpc_dictionary_set_double(xdict, "vA", verticalAngle);
  }
  double verticalError = self->_verticalError;
  if (verticalError != 0.0) {
    xpc_dictionary_set_double(xdict, "vE", verticalError);
  }
  uint64_t timestampTicks = self->_timestampTicks;
  int v16 = xdict;
  if (timestampTicks)
  {
    xpc_dictionary_set_uint64(xdict, "ts", timestampTicks);
    int v16 = xdict;
  }
}

- (id)description
{
  id v3 = 0LL;
  if (self->_flags)
  {
    CUPrintFlags32();
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v4 = v3;

    id v3 = v4;
  }

  error = self->_error;
  if (error)
  {
    id v6 = error;
    CUPrintNSError();
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF_safe();
    id v7 = v3;

    id v3 = v7;
  }

  return v3;
}

- (double)distanceMeters
{
  return self->_distanceMeters;
}

- (void)setDistanceMeters:(double)a3
{
  self->_double distanceMeters = a3;
}

- (double)distanceError
{
  return self->_distanceError;
}

- (void)setDistanceError:(double)a3
{
  self->_double distanceError = a3;
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
  self->_double horizontalAngle = a3;
}

- (double)horizontalError
{
  return self->_horizontalError;
}

- (void)setHorizontalError:(double)a3
{
  self->_double horizontalError = a3;
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
  self->_double verticalAngle = a3;
}

- (double)verticalError
{
  return self->_verticalError;
}

- (void)setVerticalError:(double)a3
{
  self->_double verticalError = a3;
}

- (unint64_t)timestampTicks
{
  return self->_timestampTicks;
}

- (void)setTimestampTicks:(unint64_t)a3
{
  self->_uint64_t timestampTicks = a3;
}

- (double)ptsScore
{
  return self->_ptsScore;
}

- (void)setPtsScore:(double)a3
{
  self->_ptsScore = a3;
}

- (void).cxx_destruct
{
}

@end
@interface CSAttendingHintInfo
- (CSAttendingHintInfo)initWithOrigin:(unint64_t)a3;
- (NSString)originString;
- (id)_originString;
- (id)description;
- (unint64_t)origin;
@end

@implementation CSAttendingHintInfo

- (CSAttendingHintInfo)initWithOrigin:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CSAttendingHintInfo;
  result = -[CSAttendingHintInfo init](&v5, "init");
  if (result) {
    result->_origin = a3;
  }
  return result;
}

- (id)_originString
{
  unint64_t origin = self->_origin;
  v3 = @"Unknown";
  if (origin == 2) {
    v3 = @"StatesProvidingProxy";
  }
  if (origin == 1) {
    return @"IntuitiveConvRequestHandler";
  }
  else {
    return (id)v3;
  }
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](&OBJC_CLASS___NSMutableString, "string"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSAttendingHintInfo _originString](self, "_originString"));
  [v3 appendFormat:@"[origin: %@]", v4];

  return v3;
}

- (unint64_t)origin
{
  return self->_origin;
}

- (NSString)originString
{
  return self->_originString;
}

- (void).cxx_destruct
{
}

@end
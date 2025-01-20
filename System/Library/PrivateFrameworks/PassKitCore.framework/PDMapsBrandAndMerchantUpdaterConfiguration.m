@interface PDMapsBrandAndMerchantUpdaterConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfiguration:(id)a3;
- (CLLocationCoordinate2D)coordinate;
- (PDMapsBrandAndMerchantUpdaterConfiguration)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5;
- (id)description;
- (int)resultProviderID;
- (unint64_t)hash;
- (unint64_t)muid;
- (void)setCoordinate:(CLLocationCoordinate2D)a3;
- (void)setMuid:(unint64_t)a3;
- (void)setResultProviderID:(int)a3;
@end

@implementation PDMapsBrandAndMerchantUpdaterConfiguration

- (PDMapsBrandAndMerchantUpdaterConfiguration)initWithMUID:(unint64_t)a3 resultProviderID:(int)a4 coordinate:(CLLocationCoordinate2D)a5
{
  CLLocationDegrees longitude = a5.longitude;
  CLLocationDegrees latitude = a5.latitude;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PDMapsBrandAndMerchantUpdaterConfiguration;
  result = -[PDMapsBrandAndMerchantUpdaterConfiguration init](&v10, "init");
  if (result)
  {
    result->_muid = a3;
    result->_resultProviderID = a4;
    result->_coordinate.CLLocationDegrees latitude = latitude;
    result->_coordinate.CLLocationDegrees longitude = longitude;
  }

  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PDMapsBrandAndMerchantUpdaterConfiguration *)a3;
  v6 = v4;
  if (self == v4)
  {
    BOOL v8 = 1;
  }

  else if (v4 && (uint64_t v7 = objc_opt_class(self, v5), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    BOOL v8 = -[PDMapsBrandAndMerchantUpdaterConfiguration isEqualToConfiguration:](self, "isEqualToConfiguration:", v6);
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isEqualToConfiguration:(id)a3
{
  return a3 && self->_muid == *((void *)a3 + 2);
}

- (unint64_t)hash
{
  return PKIntegerHash(PKHashStartingValue, self->_muid);
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableString);
  uint64_t v5 = -[NSMutableString initWithFormat:](v3, "initWithFormat:", @"<%@: %p; ", objc_opt_class(self, v4), self);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"muid: %ld; ", self->_muid);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"resultProviderID: '%ld'; ", self->_resultProviderID);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @"latitude: '%ld'; ", (uint64_t)self->_coordinate.latitude);
  -[NSMutableString appendFormat:]( v5,  "appendFormat:",  @"longitude: '%ld'; ",
    (uint64_t)self->_coordinate.longitude);
  -[NSMutableString appendFormat:](v5, "appendFormat:", @">");
  return v5;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setMuid:(unint64_t)a3
{
  self->_muid = a3;
}

- (int)resultProviderID
{
  return self->_resultProviderID;
}

- (void)setResultProviderID:(int)a3
{
  self->_resultProviderID = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  double latitude = self->_coordinate.latitude;
  double longitude = self->_coordinate.longitude;
  result.double longitude = longitude;
  result.double latitude = latitude;
  return result;
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_coordinate = a3;
}

@end
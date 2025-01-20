@interface NRDeviceEndpoint
- (id)description;
@end

@implementation NRDeviceEndpoint

- (id)description
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"NRDeviceEndpoint[");
  v4 = v3;
  if (self->_name) {
    -[NSMutableString appendFormat:](v3, "appendFormat:", @"name:%@ ", self->_name);
  }
  if (self->_model) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"model:%@ ", self->_model);
  }
  if (self->_serviceName) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @"svc:%@", self->_serviceName);
  }
  -[NSMutableString appendString:](v4, "appendString:", @"]");
  return v4;
}

- (void).cxx_destruct
{
}

@end
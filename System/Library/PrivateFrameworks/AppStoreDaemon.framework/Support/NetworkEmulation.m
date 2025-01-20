@interface NetworkEmulation
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
@end

@implementation NetworkEmulation

- (id)copyWithZone:(_NSZone *)a3
{
  id result = -[NetworkEmulation init]( +[NetworkEmulation allocWithZone:](&OBJC_CLASS___NetworkEmulation, "allocWithZone:", a3),  "init");
  *((void *)result + 2) = self->_interfaceType;
  *((_BYTE *)result + 8) = self->_isConstrained;
  *((_BYTE *)result + 9) = self->_isExpensive;
  *((_BYTE *)result + 10) = self->_isRoaming;
  return result;
}

- (id)description
{
  BOOL isConstrained = self->_isConstrained;
  BOOL isExpensive = self->_isExpensive;
  BOOL isRoaming = self->_isRoaming;
  unint64_t interfaceType = self->_interfaceType;
  if (interfaceType >= 5) {
    v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown (%ld)",  interfaceType);
  }
  else {
    v6 = off_1003ED498[interfaceType];
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"{constrained = %d, expensive = %d, roaming = %d, interface = %@}",  isConstrained,  isExpensive,  isRoaming,  v6));

  return v7;
}

@end
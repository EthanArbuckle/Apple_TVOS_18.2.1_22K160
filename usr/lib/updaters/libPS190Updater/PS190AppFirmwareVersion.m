@interface PS190AppFirmwareVersion
- (PS190AppFirmwareVersion)initWithRawAppFirmwareVersion:(const PS190RawAppFirmwareVersion *)a3;
- (PS190RawAppFirmwareVersion)version;
- (id)description;
@end

@implementation PS190AppFirmwareVersion

- (PS190AppFirmwareVersion)initWithRawAppFirmwareVersion:(const PS190RawAppFirmwareVersion *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PS190AppFirmwareVersion;
  result = -[PS190AppFirmwareVersion init](&v6, sel_init);
  if (result)
  {
    __int16 v5 = *(_WORD *)&a3->majorField;
    result->_version.sub = a3->sub;
    *(_WORD *)&result->_version.majorField = v5;
  }

  return result;
}

- (id)description
{
  return (id)PS190StringForRawAppFirmwareVersion((char *)&self->_version);
}

- (PS190RawAppFirmwareVersion)version
{
  return (PS190RawAppFirmwareVersion)(dest | (v4 << 16));
}

@end
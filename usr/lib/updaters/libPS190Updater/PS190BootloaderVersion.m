@interface PS190BootloaderVersion
- (PS190BootloaderVersion)initWithRawBootloaderVersion:(const PS190RawBootloaderVersion *)a3;
- (PS190RawBootloaderVersion)version;
- (id)description;
@end

@implementation PS190BootloaderVersion

- (PS190BootloaderVersion)initWithRawBootloaderVersion:(const PS190RawBootloaderVersion *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PS190BootloaderVersion;
  result = -[PS190BootloaderVersion init](&v5, sel_init);
  if (result) {
    result->_version = *a3;
  }
  return result;
}

- (id)description
{
  return (id)PS190StringForRawBootloaderVersion(&self->_version.major);
}

- (PS190RawBootloaderVersion)version
{
  return dest;
}

@end
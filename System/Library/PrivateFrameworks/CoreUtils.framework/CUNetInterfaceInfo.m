@interface CUNetInterfaceInfo
- (NSString)interfaceName;
- (NSString)ipv4String;
- (void)setInterfaceName:(id)a3;
- (void)setIpv4String:(id)a3;
@end

@implementation CUNetInterfaceInfo

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (void)setInterfaceName:(id)a3
{
}

- (NSString)ipv4String
{
  return self->_ipv4String;
}

- (void)setIpv4String:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface NENexusFlowAssignedProperties
- (NWEndpoint)localEndpoint;
- (void)setLocalEndpoint:(id)a3;
@end

@implementation NENexusFlowAssignedProperties

- (NWEndpoint)localEndpoint
{
  return (NWEndpoint *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setLocalEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
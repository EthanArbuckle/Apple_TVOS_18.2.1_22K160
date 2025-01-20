@interface HomeHubManagementClient
- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4;
@end

@implementation HomeHubManagementClient

- (void)synchronizedEndpointList:(id)a3 didDeleteEndpoint:(id)a4
{
  uint64_t v6 = qword_1000356E0;
  id v7 = a3;
  id v8 = a4;
  swift_retain(self);
  if (v6 != -1) {
    swift_once(&qword_1000356E0, sub_10000B5A0);
  }
  sub_10000E28C();

  swift_release(self);
}

@end
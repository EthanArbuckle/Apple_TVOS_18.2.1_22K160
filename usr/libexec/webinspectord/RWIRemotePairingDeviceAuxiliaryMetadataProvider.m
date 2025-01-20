@interface RWIRemotePairingDeviceAuxiliaryMetadataProvider
+ (void)registerBoolMetadataWithDomain:(id)a3 key:(id)a4 value:(BOOL)a5;
- (RWIRemotePairingDeviceAuxiliaryMetadataProvider)init;
@end

@implementation RWIRemotePairingDeviceAuxiliaryMetadataProvider

+ (void)registerBoolMetadataWithDomain:(id)a3 key:(id)a4 value:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  _s13webinspectord47RWIRemotePairingDeviceAuxiliaryMetadataProviderC012registerBoolF06domain3key5valueySo8NSStringC_AISbtFZ_0( (uint64_t)v7,  (uint64_t)v8,  a5);
}

- (RWIRemotePairingDeviceAuxiliaryMetadataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RWIRemotePairingDeviceAuxiliaryMetadataProvider();
  return -[RWIRemotePairingDeviceAuxiliaryMetadataProvider init](&v3, "init");
}

@end
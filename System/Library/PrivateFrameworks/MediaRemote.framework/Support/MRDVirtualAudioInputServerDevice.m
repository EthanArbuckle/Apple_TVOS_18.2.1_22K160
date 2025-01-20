@interface MRDVirtualAudioInputServerDevice
- (MRDMediaRemoteClient)owningClient;
- (MRDVirtualAudioInputServerDevice)initWithOwningClient:(id)a3;
@end

@implementation MRDVirtualAudioInputServerDevice

- (MRDVirtualAudioInputServerDevice)initWithOwningClient:(id)a3
{
  id v5 = a3;
  do
    unsigned int v6 = __ldxr((unsigned int *)&unk_1003FDCF8);
  while (__stxr(v6 + 1, (unsigned int *)&unk_1003FDCF8));
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MRDVirtualAudioInputServerDevice;
  v7 = -[MRDVirtualAudioInputServerDevice initWithDeviceID:](&v10, "initWithDeviceID:");
  v8 = v7;
  if (v7) {
    objc_storeStrong((id *)&v7->_owningClient, a3);
  }

  return v8;
}

- (MRDMediaRemoteClient)owningClient
{
  return self->_owningClient;
}

- (void).cxx_destruct
{
}

@end
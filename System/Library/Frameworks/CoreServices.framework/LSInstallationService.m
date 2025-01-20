@interface LSInstallationService
@end

@implementation LSInstallationService

uint64_t __40___LSInstallationService_beginListening__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS____LSInstallationService);
  v1 = (void *)beginListening_installationServiceDelegate;
  beginListening_installationServiceDelegate = (uint64_t)v0;

  id v2 = objc_alloc(MEMORY[0x189607B50]);
  [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:6];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v2 initWithMachServiceName:v3];
  v5 = (void *)beginListening_listener;
  beginListening_listener = v4;

  [(id)beginListening_listener setDelegate:beginListening_installationServiceDelegate];
  return [(id)beginListening_listener resume];
}

@end
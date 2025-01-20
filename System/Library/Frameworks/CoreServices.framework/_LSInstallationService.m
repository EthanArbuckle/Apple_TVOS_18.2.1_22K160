@interface _LSInstallationService
+ (void)beginListening;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (OS_dispatch_queue)serialQueue;
- (_LSInstallationService)init;
@end

@implementation _LSInstallationService

+ (void)beginListening
{
  if (beginListening_once[0] != -1) {
    dispatch_once(beginListening_once, &__block_literal_global_64);
  }
}

- (_LSInstallationService)init
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____LSInstallationService;
  v2 = -[_LSInstallationService init](&v4, sel_init);
  if (v2)
  {
    if (serviceQueue_onceToken != -1) {
      dispatch_once(&serviceQueue_onceToken, &__block_literal_global_57_0);
    }
    objc_storeStrong((id *)&v2->_serialQueue, (id)serviceQueue_queue);
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  installationInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setExportedInterface:v6];

  v7 = objc_alloc_init(&OBJC_CLASS____LSInstaller);
  [v5 setExportedObject:v7];
  -[_LSInstaller setXpcConnection:](v7, "setXpcConnection:", v5);
  [v5 _setQueue:self->_serialQueue];
  [v5 resume];

  return 1;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
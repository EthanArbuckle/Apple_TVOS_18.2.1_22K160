@interface AUServiceAdapter
+ (id)sharedInstance;
- (BOOL)hasActiveConnection;
- (FudPlugin)updater;
- (NSXPCConnection)activeConnection;
- (id)_init;
- (void)accessoryDisconnected:(id)a3;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)deviceClassAttached:(id)a3 options:(id)a4 withReply:(id)a5;
- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7;
- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)issueNotification:(id)a3;
- (void)log:(int)a3 format:(id)a4;
- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5;
- (void)personalizationRequest:(id)a3;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)progress:(double)a3;
- (void)queryDeviceList:(id)a3;
- (void)reportAnalytics:(id)a3 info:(id)a4;
- (void)setActiveConnection:(id)a3;
@end

@implementation AUServiceAdapter

- (id)_init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___AUServiceAdapter;
  v2 = -[AUServiceAdapter init](&v5, sel_init);
  v3 = v2;
  if (v2) {
    v2->_activeConnection = 0LL;
  }
  else {
    NSLog(@"%s: Error could not instantiate the ServiceAdapter", "-[AUServiceAdapter _init]");
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__AUServiceAdapter_sharedInstance__block_invoke;
  block[3] = &unk_18A200B30;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_sharedInstance;
}

uint64_t __34__AUServiceAdapter_sharedInstance__block_invoke(uint64_t a1)
{
  uint64_t result = [objc_alloc(*(Class *)(a1 + 32)) _init];
  sharedInstance_sharedInstance = result;
  return result;
}

- (BOOL)hasActiveConnection
{
  return self->_activeConnection != 0LL;
}

- (void)deviceClassAttached:(id)a3 options:(id)a4 withReply:(id)a5
{
  uint64_t v12 = 0LL;
  v9 = (objc_class *)objc_msgSend((id)objc_msgSend(MEMORY[0x1896077F8], "mainBundle"), "principalClass");
  if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_18C705378) & 1) != 0)
  {
    updater = (FudPlugin *)[[v9 alloc] initWithDeviceClass:a3 delegate:self info:&v12 options:a4];
    self->_updater = updater;
    uint64_t v11 = v12;
  }

  else
  {
    NSLog( @"%s: Error 'Principal class' does not conform to plugin protocol",  "-[AUServiceAdapter deviceClassAttached:options:withReply:]");
    uint64_t v11 = 0LL;
    updater = self->_updater;
  }

  (*((void (**)(id, BOOL, uint64_t))a5 + 2))(a5, updater != 0LL, v11);
}

- (void)bootstrapWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin bootstrapWithOptions:](updater, "bootstrapWithOptions:", a3);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, "-[AUServiceAdapter bootstrapWithOptions:]");
  }
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin findFirmwareWithOptions:remote:](updater, "findFirmwareWithOptions:remote:", a3, a4);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, a4, "-[AUServiceAdapter findFirmwareWithOptions:remote:]");
  }
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin downloadFirmwareWithOptions:](updater, "downloadFirmwareWithOptions:", a3);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, "-[AUServiceAdapter downloadFirmwareWithOptions:]");
  }
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin prepareFirmwareWithOptions:](updater, "prepareFirmwareWithOptions:", a3);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, "-[AUServiceAdapter prepareFirmwareWithOptions:]");
  }
}

- (void)applyFirmwareWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin applyFirmwareWithOptions:](updater, "applyFirmwareWithOptions:", a3);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, "-[AUServiceAdapter applyFirmwareWithOptions:]");
  }
}

- (void)finishWithOptions:(id)a3
{
  updater = self->_updater;
  if (updater) {
    -[FudPlugin finishWithOptions:](updater, "finishWithOptions:", a3);
  }
  else {
    NSLog(@"%s: Plugin not loaded", a2, a3, "-[AUServiceAdapter finishWithOptions:]");
  }
}

- (void)queryDeviceList:(id)a3
{
  uint64_t v8 = 0LL;
  updater = self->_updater;
  if (!updater)
  {
    NSLog(@"%s: Plugin not loaded", a2, "-[AUServiceAdapter queryDeviceList:]");
LABEL_7:
    uint64_t v7 = 0LL;
    goto LABEL_4;
  }

  if ((-[FudPlugin conformsToProtocol:](updater, "conformsToProtocol:", &unk_18C7053D8) & 1) == 0)
  {
    NSLog(@"%s: Plugin does support queryDeviceList", v6, "-[AUServiceAdapter queryDeviceList:]");
    goto LABEL_7;
  }

  -[FudPlugin queryDeviceList:](self->_updater, "queryDeviceList:", &v8);
  uint64_t v7 = v8;
LABEL_4:
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v7);
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  updater = self->_updater;
  if (updater)
  {
    if ((-[FudPlugin conformsToProtocol:](updater, "conformsToProtocol:", &unk_18C705438) & 1) != 0) {
      -[FudPlugin personalizationResponse:response:status:]( self->_updater,  "personalizationResponse:response:status:",  a3,  a4,  a5);
    }
    else {
      NSLog( @"%s: Plugin does support personalization",  v10,  v11,  v12,  v13,  "-[AUServiceAdapter personalizationResponse:response:status:]");
    }
  }

  else
  {
    NSLog( @"%s: Plugin not loaded",  a2,  a3,  a4,  a5,  "-[AUServiceAdapter personalizationResponse:response:status:]");
  }

- (void)accessoryDisconnected:(id)a3
{
}

void __42__AUServiceAdapter_accessoryDisconnected___block_invoke()
{
}

- (void)didBootstrap:(BOOL)a3 info:(id)a4 error:(id)a5
{
}

void __44__AUServiceAdapter_didBootstrap_info_error___block_invoke()
{
}

- (void)didFind:(BOOL)a3 info:(id)a4 updateAvailable:(BOOL)a5 needsDownload:(BOOL)a6 error:(id)a7
{
}

void __69__AUServiceAdapter_didFind_info_updateAvailable_needsDownload_error___block_invoke()
{
}

- (void)didDownload:(BOOL)a3 info:(id)a4 error:(id)a5
{
}

void __43__AUServiceAdapter_didDownload_info_error___block_invoke()
{
}

- (void)didPrepare:(BOOL)a3 info:(id)a4 error:(id)a5
{
}

void __42__AUServiceAdapter_didPrepare_info_error___block_invoke()
{
}

- (void)didApply:(BOOL)a3 info:(id)a4 error:(id)a5
{
}

void __40__AUServiceAdapter_didApply_info_error___block_invoke()
{
}

- (void)didFinish:(BOOL)a3 info:(id)a4 error:(id)a5
{
}

void __41__AUServiceAdapter_didFinish_info_error___block_invoke()
{
}

- (void)personalizationRequest:(id)a3
{
}

void __43__AUServiceAdapter_personalizationRequest___block_invoke()
{
}

- (void)progress:(double)a3
{
}

void __29__AUServiceAdapter_progress___block_invoke()
{
}

- (void)reportAnalytics:(id)a3 info:(id)a4
{
}

void __41__AUServiceAdapter_reportAnalytics_info___block_invoke()
{
}

- (void)issueNotification:(id)a3
{
}

void __38__AUServiceAdapter_issueNotification___block_invoke()
{
}

- (void)log:(int)a3 format:(id)a4
{
}

- (void)logv:(int)a3 format:(id)a4 arguments:(char *)a5
{
}

- (FudPlugin)updater
{
  return self->_updater;
}

- (NSXPCConnection)activeConnection
{
  return self->_activeConnection;
}

- (void)setActiveConnection:(id)a3
{
  self->_activeConnection = (NSXPCConnection *)a3;
}

@end
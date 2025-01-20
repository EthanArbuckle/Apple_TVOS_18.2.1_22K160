@interface FGKUPlugin
- (AppleFirmwareUpdateController)controller;
- (FGKUPlugin)initWithCoder:(id)a3;
- (FGKUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (FudPluginDelegate)delegate;
- (NSMutableDictionary)pluginInfo;
- (NSString)deviceClass;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)dealloc;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation FGKUPlugin

- (FGKUPlugin)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v14 = (objc_class *)objc_opt_class(self);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  [v12 log:7, @"Initializing %@ version %s for DeviceClass %@ with options %@", v16, &unk_100003591, v11, v13 format];

  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___FGKUPlugin;
  v17 = -[FGKUPlugin init](&v27, "init");
  v18 = v17;
  if (!v12) {
    goto LABEL_6;
  }
  if (!v11) {
    goto LABEL_6;
  }
  if (!v17) {
    goto LABEL_6;
  }
  objc_storeStrong((id *)&v17->_deviceClass, a3);
  v19 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  pluginInfo = v18->_pluginInfo;
  v18->_pluginInfo = v19;

  objc_storeWeak((id *)&v18->_delegate, v12);
  v21 = objc_alloc(&OBJC_CLASS___AppleFirmwareUpdateController);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"IOMatchLaunchServiceID"]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:@"FWDirectory"]);
  v24 = -[AppleFirmwareUpdateController initWithRegistryEntryID:fwAssetDirectory:]( v21,  "initWithRegistryEntryID:fwAssetDirectory:",  v22,  v23);
  controller = v18->_controller;
  v18->_controller = v24;

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_100004580,  @"PrepareWeight");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_100004590,  @"ApplyWeight");
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v18->_pluginInfo,  "setObject:forKeyedSubscript:",  &off_1000045A0,  @"FinishWeight");
  *a5 = v18->_pluginInfo;
  if ((-[AppleFirmwareUpdateController createFWAssetInfo](v18->_controller, "createFWAssetInfo") & 1) == 0)
  {
LABEL_6:
    [v12 log:7 format:@"Init Failure"];

    v18 = 0LL;
  }

  return v18;
}

- (void)setDelegate:(id)a3
{
}

- (void)bootstrapWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v5 log:7, @"%s options %@", "-[FGKUPlugin bootstrapWithOptions:]", v4 format];

  id v7 = (id)objc_claimAutoreleasedReturnValue( -[AppleFirmwareUpdateController updateFirmwareWithOptions:]( self->_controller,  "updateFirmwareWithOptions:",  v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  objc_msgSend(v6, "didBootstrap:info:error:", v7 == 0, 0);
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v7 log:7, @"%s options %@ remote %d", "-[FGKUPlugin findFirmwareWithOptions:remote:]", v6, v4 format];

  id v8 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v8 didFind:1 info:0 updateAvailable:0 needsDownload:0 error:0];
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v5 log:7, @"%s options %@", "-[FGKUPlugin downloadFirmwareWithOptions:]", v4 format];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v6 didDownload:1 info:0 error:0];
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v5 log:7, @"%s options %@", "-[FGKUPlugin prepareFirmwareWithOptions:]", v4 format];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v6 didPrepare:1 info:0 error:0];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v5 log:7, @"%s options %@", "-[FGKUPlugin applyFirmwareWithOptions:]", v4 format];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v6 didApply:1 info:0 error:0];
}

- (void)finishWithOptions:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v5 log:7, @"%s options %@", "-[FGKUPlugin finishWithOptions:]", v4 format];

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  [v6 didFinish:1 info:0 error:0];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin deviceClass](self, "deviceClass"));
  [v3 log:7, @"%s() deviceClass=%@", "-[FGKUPlugin dealloc]", v4 format];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___FGKUPlugin;
  -[FGKUPlugin dealloc](&v5, "dealloc");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin delegate](self, "delegate"));
  objc_msgSend(v5, "log:format:", 7, @"%s", "-[FGKUPlugin encodeWithCoder:]");

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[FGKUPlugin deviceClass](self, "deviceClass"));
  [v4 encodeObject:v6 forKey:@"DeviceClass"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[FGKUPlugin pluginInfo](self, "pluginInfo"));
  [v4 encodeObject:v7 forKey:@"PluginInfo"];
}

- (FGKUPlugin)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FGKUPlugin;
  objc_super v5 = -[FGKUPlugin init](&v12, "init");
  id v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, 0LL);
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"DeviceClass"]);
    deviceClass = v6->_deviceClass;
    v6->_deviceClass = (NSString *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"PluginInfo"]);
    pluginInfo = v6->_pluginInfo;
    v6->_pluginInfo = (NSMutableDictionary *)v9;
  }

  return v6;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (NSMutableDictionary)pluginInfo
{
  return self->_pluginInfo;
}

- (FudPluginDelegate)delegate
{
  return (FudPluginDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (AppleFirmwareUpdateController)controller
{
  return (AppleFirmwareUpdateController *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface TVSMGameControllersModule
+ (id)availableStyles;
- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager;
- (TVSMButtonViewController)buttonViewController;
- (TVSMCAPackageView)packageView;
- (TVSMGameControllersModule)init;
- (id)contentViewController;
- (id)overlayContentViewController;
- (void)_updateGameControllerDependentUI;
- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4;
@end

@implementation TVSMGameControllersModule

- (TVSMGameControllersModule)init
{
  SEL v8 = a2;
  v9 = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSMGameControllersModule;
  v9 = -[TVSMGameControllersModule init](&v7, "init");
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    id v6 =  +[TVPSBluetoothDeviceManagerConfiguration gameControllersConfiguration]( &OBJC_CLASS___TVPSBluetoothDeviceManagerConfiguration,  "gameControllersConfiguration");
    v2 = (TVPSBluetoothDeviceManaging *)(id)TVPSBluetoothDeviceManagerWithConfiguration(v6);
    bluetoothDeviceManager = v9->_bluetoothDeviceManager;
    v9->_bluetoothDeviceManager = v2;

    -[TVPSBluetoothDeviceManaging addPairedDevicesObserver:]( v9->_bluetoothDeviceManager,  "addPairedDevicesObserver:",  v9);
    -[TVSMGameControllersModule _updateGameControllerDependentUI](v9, "_updateGameControllerDependentUI");
    objc_storeStrong(&v6, 0LL);
  }

  v5 = v9;
  objc_storeStrong((id *)&v9, 0LL);
  return v5;
}

+ (id)availableStyles
{
  return &off_149C8;
}

- (id)contentViewController
{
  if (!self->_buttonViewController)
  {
    v2 = objc_alloc_init(&OBJC_CLASS___TVSMButtonViewController);
    buttonViewController = self->_buttonViewController;
    self->_buttonViewController = v2;

    -[TVSMButtonViewController setStyle:]( self->_buttonViewController,  "setStyle:",  -[TVSMGameControllersModule style](self, "style"));
    v5 = self->_buttonViewController;
    id v6 = -[TVSMGameControllersModule iconSymbolName](self, "iconSymbolName");
    -[TVSMButtonViewController setImageSymbolName:](v5, "setImageSymbolName:");

    -[TVSMButtonViewController setDelegate:](self->_buttonViewController, "setDelegate:", self);
    -[TVSMGameControllersModule _updateGameControllerDependentUI](self, "_updateGameControllerDependentUI");
  }

  return self->_buttonViewController;
}

- (id)overlayContentViewController
{
  v5 = self;
  v4[1] = (id)a2;
  v4[0] = -[TVSMGameControllersModuleOverlayViewController initWithBluetoothDeviceManager:]( objc_alloc(&OBJC_CLASS___TVSMGameControllersModuleOverlayViewController),  "initWithBluetoothDeviceManager:",  self->_bluetoothDeviceManager);
  [v4[0] setDelegate:v5];
  id v3 = v4[0];
  objc_storeStrong(v4, 0LL);
  return v3;
}

- (void)bluetoothDeviceManager:(id)a3 didUpdatePairedDevices:(id)a4
{
  objc_super v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  -[TVSMGameControllersModule _updateGameControllerDependentUI](v7, "_updateGameControllerDependentUI");
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateGameControllerDependentUI
{
  v9 = self;
  SEL v8 = a2;
  *(void *)&v7[1] = 0LL;
  id v5 = -[TVPSBluetoothDeviceManaging connectedPairedDevices](self->_bluetoothDeviceManager, "connectedPairedDevices");
  BOOL v6 = [v5 count] != 0;

  *(void *)objc_super v7 = v6;
  if (v6)
  {
    id v2 = (id)TVSMDynamicVibrantBlueColor();
    id v3 = *(void **)&v7[1];
    *(void *)&v7[1] = v2;
  }

  -[TVSMButtonViewController setSymbolTintColorVibrancyEnabled:]( v9->_buttonViewController,  "setSymbolTintColorVibrancyEnabled:",  v7[0] & 1,  &OBJC_IVAR___TVSMPairableGameControllersSectionHeaderView__titleLabel);
  [*(id *)&v9->TVSMOverlayModule_opaque[*(int *)(v4 + 16)] setSymbolTintColor:*(void *)&v7[1]];
  objc_storeStrong((id *)&v7[1], 0LL);
}

- (TVSMCAPackageView)packageView
{
  return self->_packageView;
}

- (TVSMButtonViewController)buttonViewController
{
  return self->_buttonViewController;
}

- (TVPSBluetoothDeviceManaging)bluetoothDeviceManager
{
  return self->_bluetoothDeviceManager;
}

- (void).cxx_destruct
{
}

@end
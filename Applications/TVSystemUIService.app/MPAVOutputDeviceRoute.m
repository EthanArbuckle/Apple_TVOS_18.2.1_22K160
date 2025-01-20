@interface MPAVOutputDeviceRoute
- (BOOL)tvss_shouldShowInMenuBar;
- (BSDescriptionBuilder)tvss_succinctDescriptionBuilder;
- (NSString)tvss_succinctDescription;
- (TVSSOutputDeviceAsset)tvss_asset;
@end

@implementation MPAVOutputDeviceRoute

- (BOOL)tvss_shouldShowInMenuBar
{
  char v4 = 0;
  unsigned __int8 v3 = 1;
  if ((MRAVOutputDeviceSupportsHeadTrackedSpatialAudio(-[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice")) & 1) == 0)
  {
    id v5 = (id)MRAVOutputDeviceCopyAvailableBluetoothListeningMode(-[MPAVOutputDeviceRoute logicalLeaderOutputDevice](self, "logicalLeaderOutputDevice"));
    char v4 = 1;
    unsigned __int8 v3 = 1;
  }

  if ((v4 & 1) != 0) {

  }
  return v3 & 1;
}

- (TVSSOutputDeviceAsset)tvss_asset
{
  return  -[TVSSOutputDeviceAsset initWithOutputDeviceRoute:]( objc_alloc(&OBJC_CLASS___TVSSOutputDeviceAsset),  "initWithOutputDeviceRoute:",  self);
}

- (BSDescriptionBuilder)tvss_succinctDescriptionBuilder
{
  v13 = self;
  v12[1] = (id)a2;
  v12[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v12[0];
  id v4 = -[MPAVOutputDeviceRoute routeName](v13, "routeName");
  objc_msgSend(v3, "appendString:withName:");

  id v5 = v12[0];
  id v6 = -[MPAVOutputDeviceRoute routeUID](v13, "routeUID");
  objc_msgSend(v5, "appendString:withName:");

  id v7 = v12[0];
  id v8 = (id)MPAVRouteTypeDescription(-[MPAVOutputDeviceRoute routeType](v13, "routeType"));
  objc_msgSend(v7, "appendString:withName:");

  id v9 = v12[0];
  id v10 = (id)MPAVRouteSubtypeDescription(-[MPAVOutputDeviceRoute routeSubtype](v13, "routeSubtype"));
  objc_msgSend(v9, "appendString:withName:");

  id v11 = v12[0];
  objc_storeStrong(v12, 0LL);
  return (BSDescriptionBuilder *)v11;
}

- (NSString)tvss_succinctDescription
{
  id v3 = -[MPAVOutputDeviceRoute tvss_succinctDescriptionBuilder](self, "tvss_succinctDescriptionBuilder");
  id v4 = -[BSDescriptionBuilder build](v3, "build");

  return (NSString *)v4;
}

@end
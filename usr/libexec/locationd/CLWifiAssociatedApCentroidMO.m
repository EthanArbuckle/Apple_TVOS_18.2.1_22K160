@interface CLWifiAssociatedApCentroidMO
+ (id)fetchRequest;
- (id)convert;
@end

@implementation CLWifiAssociatedApCentroidMO

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"CLWifiAssociatedApCentroidMO");
}

- (id)convert
{
  v3 = objc_alloc(&OBJC_CLASS___CLWifiAssociatedApCentroidDO);
  id v4 = -[CLWifiAssociatedApCentroidMO mac](self, "mac");
  -[CLWifiAssociatedApCentroidMO latitude](self, "latitude");
  double v6 = v5;
  -[CLWifiAssociatedApCentroidMO longitude](self, "longitude");
  double v8 = v7;
  -[CLWifiAssociatedApCentroidMO altitude](self, "altitude");
  double v10 = v9;
  -[CLWifiAssociatedApCentroidMO horizontalAccuracy](self, "horizontalAccuracy");
  double v12 = v11;
  -[CLWifiAssociatedApCentroidMO verticalAccuracy](self, "verticalAccuracy");
  double v14 = v13;
  id v15 = -[CLWifiAssociatedApCentroidMO reach](self, "reach");
  -[CLWifiAssociatedApCentroidMO stationaryTimeInSeconds](self, "stationaryTimeInSeconds");
  double v17 = v16;
  id v18 = -[CLWifiAssociatedApCentroidMO loiType](self, "loiType");
  -[CLWifiAssociatedApCentroidMO lastUpdated](self, "lastUpdated");
  return -[CLWifiAssociatedApCentroidDO initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loiType:lastUpdated:]( v3,  "initWithMac:latitude:longitude:altitude:horizontalAccuracy:verticalAccuracy:reach:stationaryTimeInSeconds:loi Type:lastUpdated:",  v4,  v15,  v18,  v6,  v8,  v10,  v12,  v14,  v17,  v19);
}

@end
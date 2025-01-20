@interface MRAVOutputContext
- (NSArray)mr_allAirPlayDevices;
@end

@implementation MRAVOutputContext

- (NSArray)mr_allAirPlayDevices
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MRAVOutputContext outputDevices](self, "outputDevices"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "msv_flatMap:", &stru_1003A3208));

  return (NSArray *)v3;
}

@end
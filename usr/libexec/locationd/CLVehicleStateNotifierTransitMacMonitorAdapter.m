@interface CLVehicleStateNotifierTransitMacMonitorAdapter
- (BOOL)valid;
- (CLVehicleStateNotifierTransitMacMonitorAdapter)initWithVehicleStateNotifier:(void *)a3;
- (void)onTransitStateUpdate:(unint64_t)a3;
- (void)setValid:(BOOL)a3;
@end

@implementation CLVehicleStateNotifierTransitMacMonitorAdapter

- (CLVehicleStateNotifierTransitMacMonitorAdapter)initWithVehicleStateNotifier:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLVehicleStateNotifierTransitMacMonitorAdapter;
  result = -[CLVehicleStateNotifierTransitMacMonitorAdapter init](&v5, "init");
  if (result)
  {
    result->_vehicleStateNotifier = a3;
    result->_valid = a3 != 0LL;
  }

  return result;
}

- (void)onTransitStateUpdate:(unint64_t)a3
{
  vehicleStateNotifier = (id *)self->_vehicleStateNotifier;
  sub_100FFDE20(vehicleStateNotifier, 2 * (a3 != 0));
  vehicleStateNotifier[160] = (id)a3;
  sub_100FFD058((uint64_t)vehicleStateNotifier);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end
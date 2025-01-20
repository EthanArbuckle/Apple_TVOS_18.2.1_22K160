@interface CLDigitalElevationModelAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5;
- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5 feedToAltFilter:(BOOL)a6;
- (CLDigitalElevationModelAdapter)init;
- (void)beginService;
- (void)cldem;
- (void)clear;
- (void)downloadAvailabilityFile:(double)a3;
- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5;
- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5 ringsToDownloadOverCellular:(int)a6;
- (void)endService;
- (void)setCldem:(void *)a3;
- (void)updateAirborneActivity:(BOOL)a3;
- (void)updateComputeDemFlatnessMetric:(BOOL)a3;
- (void)updateMotion:(int)a3 conf:(int)a4;
- (void)updateTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3;
@end

@implementation CLDigitalElevationModelAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DD40 != -1) {
    dispatch_once(&qword_10199DD40, &stru_10187F940);
  }
  return (id)qword_10199DD38;
}

- (CLDigitalElevationModelAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDigitalElevationModelAdapter;
  return -[CLDigitalElevationModelAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDigitalElevationModelPublicProtocol,  &OBJC_PROTOCOL___CLDigitalElevationModelClientProtocol);
}

- (void)beginService
{
  self->_cldem = (void *)sub_100D0F464((uint64_t)-[CLDigitalElevationModelAdapter universe](self, "universe"));
}

- (void)endService
{
  cldem = self->_cldem;
  if (cldem) {
    (*(void (**)(void *))(*(void *)cldem + 8LL))(cldem);
  }
  self->_cldem = 0LL;
}

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5
{
  return -[CLDigitalElevationModelAdapter syncgetAltitude:rel:undulation:feedToAltFilter:]( self,  "syncgetAltitude:rel:undulation:feedToAltFilter:",  a3,  a4,  a5,  0LL);
}

- (BOOL)syncgetAltitude:(void *)a3 rel:(int *)a4 undulation:(double *)a5 feedToAltFilter:(BOOL)a6
{
  return sub_100D0F638((uint64_t)self->_cldem, (uint64_t)a3, a4, a5, a6);
}

- (void)clear
{
}

- (void)updateMotion:(int)a3 conf:(int)a4
{
}

- (void)updateAirborneActivity:(BOOL)a3
{
}

- (void)updateTunnelBridgeAssistance:(TunnelBridgeAssistance *)a3
{
  cldem = self->_cldem;
  __int128 v5 = *(_OWORD *)&a3->var2;
  __int128 v4 = *(_OWORD *)&a3->var4;
  cldem[31] = *(_OWORD *)&a3->var0;
  cldem[32] = v5;
  cldem[33] = v4;
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5
{
  BOOL v5 = a5;
  cldem = self->_cldem;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  sub_100D11180((uint64_t)cldem, (uint64_t)v8, a4, v5, 0);
}

- (void)downloadIfNeeded:(id)a3 signalQuality:(BOOL)a4 allowCenterOverCellular:(BOOL)a5 ringsToDownloadOverCellular:(int)a6
{
  BOOL v7 = a5;
  cldem = self->_cldem;
  (*((void (**)(void *__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  sub_100D11180((uint64_t)cldem, (uint64_t)v10, a4, v7, a6);
}

- (void)downloadAvailabilityFile:(double)a3
{
  double v3 = a3;
  sub_100D119C4((uint64_t)self->_cldem, &v3);
}

- (void)updateComputeDemFlatnessMetric:(BOOL)a3
{
}

- (void)cldem
{
  return self->_cldem;
}

- (void)setCldem:(void *)a3
{
  self->_cldem = a3;
}

@end
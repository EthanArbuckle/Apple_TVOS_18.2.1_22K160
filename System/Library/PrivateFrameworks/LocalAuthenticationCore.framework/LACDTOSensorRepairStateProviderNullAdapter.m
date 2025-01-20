@interface LACDTOSensorRepairStateProviderNullAdapter
- (void)fetchRepairStateWithCompletion:(id)a3;
@end

@implementation LACDTOSensorRepairStateProviderNullAdapter

- (void)fetchRepairStateWithCompletion:(id)a3
{
  v3 = (void (**)(id, LACDTOMutableSensorRepairState *, void))a3;
  v4 = objc_alloc_init(&OBJC_CLASS___LACDTOMutableSensorRepairState);
  -[LACDTOMutableSensorRepairState setRepairFlag:](v4, "setRepairFlag:", 0LL);
  v3[2](v3, v4, 0LL);
}

@end
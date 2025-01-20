@interface LACDTOSensorTrustStoreKVSAdapter
- (LACDTOSensorTrustStoreKVSAdapter)initWithKVStore:(id)a3;
- (void)storeSensorTrustState:(id)a3 completion:(id)a4;
@end

@implementation LACDTOSensorTrustStoreKVSAdapter

- (LACDTOSensorTrustStoreKVSAdapter)initWithKVStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___LACDTOSensorTrustStoreKVSAdapter;
  v6 = -[LACDTOSensorTrustStoreKVSAdapter init](&v9, sel_init);
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_kvStore, a3);
  }

  return v7;
}

- (void)storeSensorTrustState:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if ([a3 isDisapproved])
  {
    v8 = -[LACDTOKVStoreValue initWithBoolValue:]( objc_alloc(&OBJC_CLASS___LACDTOKVStoreValue),  "initWithBoolValue:",  0LL);
    -[LACDTOKVStoreWriter setValue:forKey:completion:](self->_kvStore, "setValue:forKey:completion:", v8, 6LL, v6);
  }

  else
  {
    LACLogDTOSensor();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[LACDTOSensorTrustStoreKVSAdapter storeSensorTrustState:completion:].cold.1(v7);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }

- (void).cxx_destruct
{
}

- (void)storeSensorTrustState:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl( &dword_189219000,  log,  OS_LOG_TYPE_DEBUG,  "Skipping trust state update because trust can only be regained in SEP",  v1,  2u);
}

@end
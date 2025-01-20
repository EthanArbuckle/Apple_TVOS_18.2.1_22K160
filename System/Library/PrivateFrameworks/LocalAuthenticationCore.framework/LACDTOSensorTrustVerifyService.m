@interface LACDTOSensorTrustVerifyService
- (BOOL)shouldVerifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4;
- (id)verifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4 repairState:(id)a5;
@end

@implementation LACDTOSensorTrustVerifyService

- (BOOL)shouldVerifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEnabled])
  {
    if ([v6 isDisapproved])
    {
      LACLogDTOSensor();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = &unk_18A39F360;
LABEL_7:
        _os_log_impl( &dword_189219000,  v7,  OS_LOG_TYPE_DEFAULT,  "Sensor trust verification finished with code: %{public}@",  (uint8_t *)&v17,  0xCu);
      }
    }

    else
    {
      [v6 installedSensorID];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 length];

      if (!v11)
      {
        LACLogDTOSensor();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        int v17 = 138543362;
        v18 = &unk_18A39F378;
        goto LABEL_7;
      }

      [v6 installedSensorID];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 trustedSensorID];
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      int v14 = [v12 isEqual:v13];

      if (v14)
      {
        LACLogDTOSensor();
        v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_8;
        }
        int v17 = 138543362;
        v18 = &unk_18A39F390;
        goto LABEL_7;
      }

      [v5 requirements];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      int v16 = [v15 hasBiometricEnrollments];

      if (!v16)
      {
        BOOL v8 = 1;
        goto LABEL_9;
      }

      LACLogDTOSensor();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138543362;
        v18 = &unk_18A39F3A8;
        goto LABEL_7;
      }
    }
  }

  else
  {
    LACLogDTOSensor();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138543362;
      v18 = &unk_18A39F348;
      goto LABEL_7;
    }
  }

- (id)verifySensorTrustWithFeatureState:(id)a3 trustState:(id)a4 repairState:(id)a5
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  BOOL v8 = (LACDTOMutableSensorTrustState *)a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = -[LACDTOMutableSensorTrustState initWithTrustState:]( objc_alloc(&OBJC_CLASS___LACDTOMutableSensorTrustState),  "initWithTrustState:",  v8);
  LODWORD(self) = -[LACDTOSensorTrustVerifyService shouldVerifySensorTrustWithFeatureState:trustState:]( self,  "shouldVerifySensorTrustWithFeatureState:trustState:",  v10,  v8);

  v12 = v8;
  if ((_DWORD)self)
  {
    uint64_t v13 = [v9 repairFlag];
    LACLogDTOSensor();
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13 == 3)
    {
      if (v15)
      {
        int v18 = 138543362;
        uint64_t v19 = &unk_18A39F3C0;
        _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "Sensor trust verification finished with code: %{public}@",  (uint8_t *)&v18,  0xCu);
      }

      -[LACDTOMutableSensorTrustState disapprove](v11, "disapprove");
    }

    else
    {
      if (v15)
      {
        int v18 = 138543362;
        uint64_t v19 = &unk_18A39F3D8;
        _os_log_impl( &dword_189219000,  v14,  OS_LOG_TYPE_DEFAULT,  "Sensor trust verification finished with code: %{public}@",  (uint8_t *)&v18,  0xCu);
      }
    }

    v12 = v11;
  }

  int v16 = v12;

  return v16;
}

@end
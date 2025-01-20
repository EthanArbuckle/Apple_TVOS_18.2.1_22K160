@interface PMSmartPowerNap
@end

@implementation PMSmartPowerNap

void __24___PMSmartPowerNap_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = smartpowernap_log;
    if (smartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = 0;
        v3 = (uint8_t *)&v6;
        v4 = (os_log_s *)v2;
LABEL_7:
        _os_log_impl(&dword_187DA9000, v4, OS_LOG_TYPE_DEFAULT, "Connection to powerd interrupted", v3, 2u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v5) = 0;
      v4 = (os_log_s *)MEMORY[0x1895F8DA0];
      v3 = (uint8_t *)&v5;
      goto LABEL_7;
    }

    objc_msgSend(WeakRetained, "setConnection_interrupted:", 1, v5);
  }
}

void __24___PMSmartPowerNap_init__block_invoke_21(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = smartpowernap_log;
    if (smartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v6 = 0;
        v3 = (uint8_t *)&v6;
        v4 = (os_log_s *)v2;
LABEL_7:
        _os_log_impl(&dword_187DA9000, v4, OS_LOG_TYPE_DEFAULT, "Connection to powerd invalidated", v3, 2u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v5 = 0;
      v4 = (os_log_s *)MEMORY[0x1895F8DA0];
      v3 = (uint8_t *)&v5;
      goto LABEL_7;
    }
  }
}

void __24___PMSmartPowerNap_init__block_invoke_23(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "connection_interrupted"))
  {
    uint64_t v3 = smartpowernap_log;
    if (smartpowernap_log)
    {
      if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v7 = 0;
        v4 = (uint8_t *)&v7;
        __int16 v5 = (os_log_s *)v3;
LABEL_8:
        _os_log_impl(&dword_187DA9000, v5, OS_LOG_TYPE_DEFAULT, "Powerd has restarted", v4, 2u);
      }
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      __int16 v5 = (os_log_s *)MEMORY[0x1895F8DA0];
      v4 = (uint8_t *)&v6;
      goto LABEL_8;
    }

    objc_msgSend(v2, "reRegister", v6);
    objc_msgSend(v2, "setConnection_interrupted:", 0);
  }
}

void __43___PMSmartPowerNap_registerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __43___PMSmartPowerNap_registerWithIdentifier___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __43___PMSmartPowerNap_registerWithIdentifier___block_invoke_cold_1();
  }
}

void __45___PMSmartPowerNap_unregisterWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __45___PMSmartPowerNap_unregisterWithIdentifier___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __45___PMSmartPowerNap_unregisterWithIdentifier___block_invoke_cold_1();
  }
}

uint64_t __32___PMSmartPowerNap_updateState___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(*(void *)(a1 + 40) + 32LL) + 16LL))( *(void *)(*(void *)(a1 + 40) + 32LL),  *(unsigned __int8 *)(a1 + 48));
}

void __29___PMSmartPowerNap_setState___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __29___PMSmartPowerNap_setState___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __29___PMSmartPowerNap_setState___block_invoke_cold_1();
  }
}

void __47___PMSmartPowerNap_setSPNReentryCoolOffPeriod___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __47___PMSmartPowerNap_setSPNReentryCoolOffPeriod___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __47___PMSmartPowerNap_setSPNReentryCoolOffPeriod___block_invoke_cold_1();
  }
}

void __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_1();
  }
}

void __39___PMSmartPowerNap_setSPNRequeryDelta___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __39___PMSmartPowerNap_setSPNRequeryDelta___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __39___PMSmartPowerNap_setSPNRequeryDelta___block_invoke_cold_1();
  }
}

void __47___PMSmartPowerNap_setSPNMotionAlarmThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_1();
  }
}

void __52___PMSmartPowerNap_setSPNMotionAlarmStartThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_1();
  }
}

void __41___PMSmartPowerNap_syncStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __41___PMSmartPowerNap_syncStateWithHandler___block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __41___PMSmartPowerNap_syncStateWithHandler___block_invoke_cold_1();
  }
}

void __29___PMSmartPowerNap_syncState__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (smartpowernap_log)
  {
    if (os_log_type_enabled((os_log_t)smartpowernap_log, OS_LOG_TYPE_ERROR)) {
      __29___PMSmartPowerNap_syncState__block_invoke_cold_2();
    }
  }

  else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
  {
    __29___PMSmartPowerNap_syncState__block_invoke_cold_1();
  }
}

uint64_t __29___PMSmartPowerNap_syncState__block_invoke_42(uint64_t a1, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  return objc_msgSend( *(id *)(a1 + 32),  "setCurrent_state:",  *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

void __43___PMSmartPowerNap_registerWithIdentifier___block_invoke_cold_1()
{
}

void __43___PMSmartPowerNap_registerWithIdentifier___block_invoke_cold_2()
{
}

void __45___PMSmartPowerNap_unregisterWithIdentifier___block_invoke_cold_1()
{
}

void __45___PMSmartPowerNap_unregisterWithIdentifier___block_invoke_cold_2()
{
}

void __29___PMSmartPowerNap_setState___block_invoke_cold_1()
{
}

void __29___PMSmartPowerNap_setState___block_invoke_cold_2()
{
}

void __47___PMSmartPowerNap_setSPNReentryCoolOffPeriod___block_invoke_cold_1()
{
}

void __47___PMSmartPowerNap_setSPNReentryCoolOffPeriod___block_invoke_cold_2()
{
}

void __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_1()
{
}

void __46___PMSmartPowerNap_setSPNReentryDelaySeconds___block_invoke_cold_2()
{
}

void __39___PMSmartPowerNap_setSPNRequeryDelta___block_invoke_cold_1()
{
}

void __39___PMSmartPowerNap_setSPNRequeryDelta___block_invoke_cold_2()
{
}

void __41___PMSmartPowerNap_syncStateWithHandler___block_invoke_cold_1()
{
}

void __41___PMSmartPowerNap_syncStateWithHandler___block_invoke_cold_2()
{
}

void __29___PMSmartPowerNap_syncState__block_invoke_cold_1()
{
}

void __29___PMSmartPowerNap_syncState__block_invoke_cold_2()
{
}

@end
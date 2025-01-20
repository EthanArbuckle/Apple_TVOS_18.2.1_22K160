@interface NWAdvertiser
@end

@implementation NWAdvertiser

void __22___NWAdvertiser_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained[1] + 2);
    if (v6 && !nw_path_parameters_get_logging_disabled(*(void *)(v6 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
      }
      v7 = (os_log_s *)(id)glistenerLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id_string = nw_listener_get_id_string(v5[1]);
        int v11 = 136446466;
        v12 = "-[_NWAdvertiser start]_block_invoke";
        __int16 v13 = 2082;
        v14 = id_string;
        _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_INFO,  "%{public}s [%{public}s] Advertiser path update",  (uint8_t *)&v11,  0x16u);
      }
    }

    id v9 = v3;
    nw_context_assert_queue(*((void **)v5[1] + 3));
    v10 = v5[1];
    if ((v10[32] - 1) <= 1 && (*((_BYTE *)v10 + 302) & 1) == 0)
    {
      -[_NWAdvertiser updateFlows:]((uint64_t)v5, v9);
      -[_NWAdvertiser reconcileChildren:]((uint64_t)v5, v9);
    }
  }
}

void __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 120LL));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(id *)(*(void *)(a1 + 32) + 40LL);
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]( (id *)objc_alloc(&OBJC_CLASS___NWConcrete_nw_parameters),  v5,  0,  0);

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8LL);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v5[0] = MEMORY[0x1895F87A8];
  v4 = *(void **)(v3 + 40);
  v5[2] = __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_3;
  v5[3] = &unk_189BC77A8;
  uint64_t v7 = *(void *)(a1 + 48);
  v5[1] = 3221225472LL;
  id v6 = v2;
  char v8 = *(_BYTE *)(a1 + 56);
  nw_utilities_execute_block_as_persona_from_parameters(v4, v5);
}

uint64_t __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL)
                                                           + 16LL))( *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL),  *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48));
}

void __21___NWAdvertiser_stop__block_invoke(uint64_t a1)
{
}

void __21___NWAdvertiser_stop__block_invoke_2(void *a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1[4] + 8LL) + 120LL));
  uint64_t v3 = *(void *)(a1[6] + 8LL);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(void *)(a1[7] + 8LL) + 40LL), *(id *)(*(void *)(a1[4] + 8LL) + 280LL));
}

uint64_t __21___NWAdvertiser_stop__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL) + 16LL))();
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  id v6 = nw_path_copy_flow_for_registration(*(NWConcrete_nw_path **)(a1 + 32), v5);
  if (v6)
  {
    char v7 = v6[186];

    if ((v7 & 4) != 0) {
      nw_dictionary_set_value(*(void *)(a1 + 40), a2, v5);
    }
  }

  return 1LL;
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 16LL);
  if (v6 && !nw_path_parameters_get_logging_disabled(*(void *)(v6 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_33_44340);
    }
    char v7 = (os_log_s *)(id)glistenerLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id_string = nw_listener_get_id_string(*(void **)(*(void *)(a1 + 32) + 8LL));
      int v10 = 136446722;
      int v11 = "-[_NWAdvertiser updateFlows:]_block_invoke_2";
      __int16 v12 = 2082;
      __int16 v13 = id_string;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl( &dword_181A5C000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}s [%{public}s] Removing defunct flow registration %{public}@",  (uint8_t *)&v10,  0x20u);
    }
  }

  nw_path_flow_registration_close(v5);
  nw_dictionary_set_value(*(void *)(*(void *)(a1 + 32) + 56LL), a2, 0LL);

  return 1LL;
}

void __29___NWAdvertiser_updateFlows___block_invoke_6(uint64_t a1, unsigned __int8 *uu)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uuid_unparse(uu, out);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 56);
  if (!v5) {
    goto LABEL_4;
  }
  flow_inner = nw_dictionary_copy_value(v5, (uint64_t)out);
  if (!flow_inner)
  {
    uint64_t v4 = *(void *)(a1 + 32);
LABEL_4:
    flow_inner = nw_path_evaluator_create_flow_inner(*(void **)(v4 + 32), 0, 0, 1, 0, uu, 0LL, 0, 0LL);
  }

  nw_dictionary_set_value(*(void *)(a1 + 40), out, flow_inner);
}

@end
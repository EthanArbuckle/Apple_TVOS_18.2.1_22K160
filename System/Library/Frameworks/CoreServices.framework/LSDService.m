@interface LSDService
@end

@implementation LSDService

void __50___LSDService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (!v3)
    {
      _LSDefaultLog();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
        __50___LSDService_listener_shouldAcceptNewConnection___block_invoke_cold_1((uint64_t)WeakRetained, v4);
      }
    }

    [v3 setExportedObject:0];
    [WeakRetained connectionWasInvalidated:v3];
  }
}

void __50___LSDService_listener_shouldAcceptNewConnection___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl( &dword_183E58000,  a2,  OS_LOG_TYPE_FAULT,  "connection service %@ was unexpectedly nil in invalidation handler",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_1();
}

@end
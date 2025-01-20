@interface LSInProcessSettingsStore
@end

@implementation LSInProcessSettingsStore

void __33___LSInProcessSettingsStore_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_internalQueue_purgeDatabase");
}

uint64_t __57___LSInProcessSettingsStore_userElectionForExtensionKey___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_internalQueue_selectUserElectionForIdentifier:", *(void *)(a1 + 40));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = result;
  return result;
}

@end
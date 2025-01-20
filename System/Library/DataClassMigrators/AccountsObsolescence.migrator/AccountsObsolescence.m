uint64_t sub_3D78(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id objc_msgSend_removeObsoleteAccountsFromStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObsoleteAccountsFromStore:");
}
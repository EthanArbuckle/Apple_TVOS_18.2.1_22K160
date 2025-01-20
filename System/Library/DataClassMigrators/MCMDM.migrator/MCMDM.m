void sub_3C9C(id a1, NSError *a2)
{
  uint64_t v2;
  _DMLogFunc(v2, 3LL, @"MDM migration: error: %@");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}
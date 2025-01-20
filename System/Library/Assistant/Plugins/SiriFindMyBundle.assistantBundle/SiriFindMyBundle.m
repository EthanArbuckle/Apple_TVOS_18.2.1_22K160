uint64_t shouldUseLegacyPlugin()
{
  return 1LL;
}

id sub_3674(uint64_t a1, Class a2)
{
  return [[a2 alloc] initWithDictionary:*(void *)(a1 + 32)];
}

id sub_36E0(id a1, Class a2)
{
  return objc_alloc_init(a2);
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}
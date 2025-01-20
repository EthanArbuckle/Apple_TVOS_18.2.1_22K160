void sub_1B60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B90(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 migrateImagesDatabase:v6 index:a3];
  LOBYTE(a3) = [*(id *)(a1 + 32) migrateMainDatabase:v6 index:a3];

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) |= a3;
}

void sub_2114( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_22A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}
}

uint64_t sub_2858()
{
  v0 = (const char *)_CPCreateUTF8StringFromCFString();
  if (!v0) {
    return 0LL;
  }
  v1 = (char *)v0;
  if (stat(v0, &v4)) {
    uint64_t st_size_low = 0LL;
  }
  else {
    uint64_t st_size_low = LODWORD(v4.st_size);
  }
  free(v1);
  return st_size_low;
}

Class sub_290C(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_8290)
  {
    __int128 v4 = off_4288;
    uint64_t v5 = 0LL;
    qword_8290 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_8290) {
    sub_2BD0(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("NSPersonNameComponentsFormatterPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_2C4C();
  }
  qword_8288 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

Class sub_29E8(uint64_t a1)
{
  v3 = 0LL;
  if (!qword_82A0)
  {
    __int128 v4 = off_42A0;
    uint64_t v5 = 0LL;
    qword_82A0 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_82A0) {
    sub_2CC4(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("CNContactMetadataPersistentStoreManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_2D40();
  }
  qword_8298 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_2AC4(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

void sub_2AD0(void *a1, os_log_s *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue([a1 description]);
  int v5 = 138412290;
  id v6 = v3;
  sub_2AC4(&dword_0, a2, v4, "AB Migration - Contact metadata db was not migrated, %@", (uint8_t *)&v5);
}

void sub_2B60(uint64_t *a1, os_log_s *a2, uint64_t a3)
{
  uint64_t v3 = *a1;
  int v4 = 138412290;
  uint64_t v5 = v3;
  sub_2AC4(&dword_0, a2, a3, "AB Migration - Failed to save Contact Provider content deletion, %@", (uint8_t *)&v4);
}

void sub_2BD0(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *IntlPreferencesLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"AddressBookDataMigrator.m",  31,  @"%s",  *a1);

  __break(1u);
}

void sub_2C4C()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getNSPersonNameComponentsFormatterPreferencesClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"AddressBookDataMigrator.m",  32,  @"Unable to find class %s",  "NSPersonNameComponentsFormatterPreferences");

  __break(1u);
}

void sub_2CC4(void *a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *ContactsLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"AddressBookDataMigrator.m",  34,  @"%s",  *a1);

  __break(1u);
}

void sub_2D40()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCNContactMetadataPersistentStoreManagerClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"AddressBookDataMigrator.m",  35,  @"Unable to find class %s",  "CNContactMetadataPersistentStoreManager");

  __break(1u);
  ABAddressBookCopyArrayOfAllSources(v2);
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
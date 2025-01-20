os_log_t sub_2AD0()
{
  return os_log_create("com.apple.amp.medialibrary.migrator", "Migration");
}

void sub_3218( _Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(a1);
    os_log_t v12 = sub_2AD0();
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)(v10 - 128) = 138543362;
      *(void *)(v10 - 124) = v11;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_FAULT,  "[Migrator] !!! Exception while trying to migrate library. %{public}@",  (uint8_t *)(v10 - 128),  0xCu);
    }

    *(_BYTE *)(a10 + 24) = 0;
    objc_end_catch();
    JUMPOUT(0x31DCLL);
  }

  _Unwind_Resume(a1);
}

id objc_msgSend_valueForDatabaseProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForDatabaseProperty:");
}
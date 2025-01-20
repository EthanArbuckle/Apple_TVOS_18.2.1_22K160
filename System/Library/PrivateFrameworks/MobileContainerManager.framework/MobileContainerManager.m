void __MCMGetMCMContainerClassForContainerClass_block_invoke()
{
  uint64_t i;
  for (i = 0LL; i != 15; ++i)
    MCMGetMCMContainerClassForContainerClass_containerClassReverseMap[gMCMContainerClassToContainerClass[i]] = i;
}

id _containerClassForContentClass(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  switch(a1)
  {
    case 1LL:
    case 2LL:
    case 3LL:
    case 4LL:
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
    case 9LL:
    case 10LL:
    case 11LL:
    case 12LL:
    case 13LL:
    case 14LL:
      objc_opt_class();
      id result = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      container_log_handle_for_category();
      v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      {
        int v4 = 134217984;
        uint64_t v5 = a1;
        _os_log_fault_impl( &dword_1883D9000,  v2,  OS_LOG_TYPE_FAULT,  "Invalid container content class %ld",  (uint8_t *)&v4,  0xCu);
      }

      id result = 0LL;
      break;
  }

  return result;
}

LABEL_17:
  return v23;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x189604828]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x189604838]();
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

uint64_t container_class_normalized()
{
  return MEMORY[0x1895FA640]();
}

uint64_t container_copy_info()
{
  return MEMORY[0x1895FA6F0]();
}

uint64_t container_copy_info_value_for_key()
{
  return MEMORY[0x1895FA6F8]();
}

uint64_t container_copy_path()
{
  return MEMORY[0x1895FA708]();
}

uint64_t container_create_or_lookup_for_current_user()
{
  return MEMORY[0x1895FA730]();
}

uint64_t container_delete_all_container_content()
{
  return MEMORY[0x1895FA760]();
}

uint64_t container_delete_array_of_containers()
{
  return MEMORY[0x1895FA768]();
}

uint64_t container_disk_usage()
{
  return MEMORY[0x1895FA778]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1895FA7C0]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1895FA7D0]();
}

uint64_t container_get_all_with_class_for_current_user()
{
  return MEMORY[0x1895FA7E8]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1895FA7F0]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1895FA800]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1895FA818]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x1895FA820]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x1895FA828]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1895FA858]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x1895FA860]();
}

uint64_t container_object_create()
{
  return MEMORY[0x1895FA880]();
}

uint64_t container_object_get_class()
{
  return MEMORY[0x1895FA888]();
}

uint64_t container_object_get_identifier()
{
  return MEMORY[0x1895FA890]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x1895FA8A8]();
}

uint64_t container_object_set_class()
{
  return MEMORY[0x1895FA8B0]();
}

uint64_t container_recreate_structure()
{
  return MEMORY[0x1895FA980]();
}

uint64_t container_regenerate_uuid()
{
  return MEMORY[0x1895FA988]();
}

uint64_t container_replace()
{
  return MEMORY[0x1895FA990]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1895FA9C8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1895FBE68](__s, __smax, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x189616740]();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void uuid_clear(uuid_t uu)
{
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1895FD4E0](uu);
}

uint64_t objc_msgSend_initWithIdentifier_path_uniquePathComponent_uuid_personaUniqueString_uid_error_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_initWithIdentifier_path_uniquePathComponent_uuid_personaUniqueString_uid_error_);
}
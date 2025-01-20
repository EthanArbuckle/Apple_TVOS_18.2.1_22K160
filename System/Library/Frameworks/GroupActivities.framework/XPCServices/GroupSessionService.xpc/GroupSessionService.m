id GSSDefaultLog()
{
  if (GSSDefaultLog_onceToken != -1) {
    dispatch_once(&GSSDefaultLog_onceToken, &__block_literal_global);
  }
  return (id)GSSDefaultLog_sLog;
}

id _setUpTemporaryDirectory()
{
  if (!_set_user_dir_suffix([@"com.apple.SharePlay.GroupSessionService" UTF8String])
    || !confstr(65537, v5, 0x400uLL)
    || mkdir(v5, 0x1C0u) && *__error() != 17)
  {
    id v1 = GSSDefaultLog();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _setUpTemporaryDirectory_cold_1();
    }
LABEL_11:

    exit(1);
  }

  bzero(v4, 0x400uLL);
  if (!realpath_DARWIN_EXTSN(v5, v4))
  {
    id v3 = GSSDefaultLog();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      _setUpTemporaryDirectory_cold_2();
    }
    goto LABEL_11;
  }

  return (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v4));
}

void OUTLINED_FUNCTION_0( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

int main(int argc, const char **argv, const char **envp)
{
  flags = (uint64_t)[objc_allocWithZone(CPFeatureFlags) init];
  id v3 = (objc_class *)[(id)objc_opt_self(NSXPCListener) serviceListener];
  listener.super.isa = v3;
  type metadata accessor for BackgroundSessionManagerHost(0LL);
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  uint64_t v5 = swift_allocObject(v4, 40LL, 7LL);
  *(_OWORD *)(v5 + 16) = xmmword_100003E70;
  *(void *)(v5 + 32) = v3;
  uint64_t v8 = v5;
  specialized Array._endMutation()();
  v6 = (void *)flags;
  v7 = v3;
  host = BackgroundSessionManagerHost.__allocating_init(listeners:featureFlags:)(v8, v6);
  BackgroundSessionManagerHost.resume()();
  exit(1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0LL, 0LL);
    *a1 = result;
  }

  return result;
}

void _setUpTemporaryDirectory_cold_1()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  v1,  v2,  "failed to initialize temporary directory (%d): %s",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_2();
}

void _setUpTemporaryDirectory_cold_2()
{
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0( (void *)&_mh_execute_header,  v1,  v2,  "failed to resolve temporary directory (%d): %s",  v3,  v4,  v5,  v6,  v7);
  OUTLINED_FUNCTION_2();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}
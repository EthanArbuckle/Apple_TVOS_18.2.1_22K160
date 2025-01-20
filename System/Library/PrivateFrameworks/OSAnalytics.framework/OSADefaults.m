@interface OSADefaults
+ (BOOL)BOOLForKey:(id)a3;
+ (id)dictionaryRepresentation;
+ (id)objectForKey:(id)a3;
+ (void)removeObjectForKey:(id)a3;
+ (void)sendOperation:(unint64_t)a3 forKey:(id)a4 withBlock:(id)a5;
+ (void)setBool:(BOOL)a3 forKey:(id)a4;
+ (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation OSADefaults

+ (BOOL)BOOLForKey:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __26__OSADefaults_BOOLForKey___block_invoke;
  v6[3] = &unk_189E20580;
  v6[4] = &v7;
  +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  0LL,  v3,  v6);
  char v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

BOOL __26__OSADefaults_BOOLForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  BOOL result = xpc_dictionary_get_BOOL(xdict, "defaults_value");
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __30__OSADefaults_setBool_forKey___block_invoke;
  v4[3] = &__block_descriptor_33_e33_v16__0__NSObject_OS_xpc_object__8l;
  BOOL v5 = a3;
  +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  1LL,  a4,  v4);
}

void __30__OSADefaults_setBool_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

+ (id)objectForKey:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0LL;
  v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  id v12 = 0LL;
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __28__OSADefaults_objectForKey___block_invoke;
  v6[3] = &unk_189E20580;
  v6[4] = &v7;
  +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  2LL,  v3,  v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __28__OSADefaults_objectForKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = xpc2ns(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v7;
  }
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    ns2xpc(v5);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __32__OSADefaults_setObject_forKey___block_invoke;
      v16[3] = &unk_189E205C8;
      id v17 = v7;
      +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  3LL,  v6,  v16);
    }

    else if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR))
    {
      +[OSADefaults setObject:forKey:].cold.1((uint64_t)v5, v9, v10, v11, v12, v13, v14, v15);
    }
  }

  else
  {
    +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  3LL,  v6,  &__block_literal_global_0);
  }
}

void __32__OSADefaults_setObject_forKey___block_invoke(uint64_t a1, xpc_object_t xdict)
{
}

+ (void)removeObjectForKey:(id)a3
{
}

+ (id)dictionaryRepresentation
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000LL;
  v8 = __Block_byref_object_copy__0;
  uint64_t v9 = __Block_byref_object_dispose__0;
  id v10 = 0LL;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __39__OSADefaults_dictionaryRepresentation__block_invoke;
  v4[3] = &unk_189E20580;
  void v4[4] = &v5;
  +[OSADefaults sendOperation:forKey:withBlock:]( &OBJC_CLASS___OSADefaults,  "sendOperation:forKey:withBlock:",  4LL,  0LL,  v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __39__OSADefaults_dictionaryRepresentation__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    id v7 = v3;
    uint64_t v4 = xpc2ns(v3);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v7;
  }
}

+ (void)sendOperation:(unint64_t)a3 forKey:(id)a4 withBlock:(id)a5
{
  id v7 = a4;
  v8 = (void (**)(id, xpc_object_t))a5;
  OSAnalyticsHelperServiceConnection();
  uint64_t v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "operation", 7uLL);
    xpc_dictionary_set_uint64(empty, "defaults_operation", a3);
    if (v7) {
      xpc_dictionary_set_string( empty, "defaults_key", (const char *)[v7 UTF8String]);
    }
    if ((a3 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v8[2](v8, empty);
    }

    else
    {
      xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v9, empty);
      uint64_t v12 = v11;
      if (v11)
      {
        uint64_t v13 = MEMORY[0x186E34734](v11);
        if (v13 == MEMORY[0x1895F9268])
        {
          if (os_log_type_enabled(MEMORY[0x1895F8DA0], OS_LOG_TYPE_ERROR)) {
            +[OSADefaults sendOperation:forKey:withBlock:].cold.1(v12);
          }
        }

        else if (v13 == MEMORY[0x1895F9250])
        {
          v8[2](v8, v12);
        }
      }
    }
  }
}

+ (void)setObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.1( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

+ (void)sendOperation:(void *)a1 forKey:withBlock:.cold.1(void *a1)
{
}

@end
@interface CryptexRemoteObject
- (CryptexRemoteObject)initWithDesc:(id)a3;
- (char)identifier;
- (char)version;
- (void)dealloc;
@end

@implementation CryptexRemoteObject

- (CryptexRemoteObject)initWithDesc:(id)a3
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___CryptexRemoteObject;
  v5 = -[CryptexRemoteObject init](&v11, sel_init);
  string = xpc_dictionary_get_string(v4, "remote-cryptex-identifier");
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v7 = strdup(string);
      if (v7) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    v7 = strdup(string);
    if (!v7) {
      -[CryptexRemoteObject initWithDesc:].cold.1(string);
    }
  }

  v5->_identifier = v7;
  v8 = xpc_dictionary_get_string(v4, "remote-cryptex-version");
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v9 = strdup(v8);
      if (v9) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }

  else
  {
    v9 = strdup(v8);
    if (!v9) {
      -[CryptexRemoteObject initWithDesc:].cold.1(v8);
    }
  }

  v5->_version = v9;

  return v5;
}

- (void)dealloc
{
  self->_identifier = 0LL;
  free(self->_version);
  self->_version = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CryptexRemoteObject;
  -[CryptexRemoteObject dealloc](&v3, sel_dealloc);
}

- (char)identifier
{
  return self->_identifier;
}

- (char)version
{
  return self->_version;
}

- (void)initWithDesc:(const char *)a1 .cold.1(const char *a1)
{
  void *v1 = 0LL;
  _OWORD *v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  OUTLINED_FUNCTION_2_0();
  objc_super v3 = __error();
  OUTLINED_FUNCTION_4(v3);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2();
  __break(1u);
}

@end
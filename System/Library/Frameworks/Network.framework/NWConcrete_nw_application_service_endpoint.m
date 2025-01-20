@interface NWConcrete_nw_application_service_endpoint
- (BOOL)initWithApplicationService:(const char *)a3 alias:(const unsigned __int8 *)a4 serviceUUID:(const char *)a5 deviceName:(const char *)a6 deviceModel:(const char *)a7 contactID:;
- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4;
- (char)createDescription:(BOOL)a3;
- (id)copyDictionary;
- (id)copyEndpoint;
- (unint64_t)getHash;
- (unsigned)type;
- (void)dealloc;
@end

@implementation NWConcrete_nw_application_service_endpoint

- (void)dealloc
{
  alias = self->alias;
  if (alias)
  {
    free(alias);
    self->alias = 0LL;
  }

  application_service = self->application_service;
  if (application_service)
  {
    free(application_service);
    self->application_service = 0LL;
  }

  device_name = self->device_name;
  if (device_name)
  {
    free(device_name);
    self->device_name = 0LL;
  }

  device_model = self->device_model;
  if (device_model)
  {
    free(device_model);
    self->device_model = 0LL;
  }

  contact_id = self->contact_id;
  if (contact_id)
  {
    free(contact_id);
    self->contact_id = 0LL;
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_service_endpoint;
  -[NWConcrete_nw_endpoint dealloc](&v8, sel_dealloc);
}

- (unsigned)type
{
  return 6;
}

- (id)copyDictionary
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_service_endpoint;
  id v3 = -[NWConcrete_nw_endpoint copyDictionary](&v12, sel_copyDictionary);
  v4 = v3;
  if (v3)
  {
    alias = self->alias;
    if (alias) {
      xpc_dictionary_set_string(v3, "application_service_alias", alias);
    }
    application_service = self->application_service;
    if (application_service) {
      xpc_dictionary_set_string(v4, "application_service_name", application_service);
    }
    if (!uuid_is_null(self->service_identifier)) {
      xpc_dictionary_set_uuid(v4, "service_identifier", self->service_identifier);
    }
    device_name = self->device_name;
    if (device_name) {
      xpc_dictionary_set_string(v4, "device_name", device_name);
    }
    device_model = self->device_model;
    if (device_model) {
      xpc_dictionary_set_string(v4, "device_model", device_model);
    }
    xpc_dictionary_set_int64(v4, "device_color", self->device_color);
    xpc_dictionary_set_int64(v4, "route", self->route);
    contact_id = self->contact_id;
    if (contact_id) {
      xpc_dictionary_set_string(v4, "contact_id", contact_id);
    }
    id v10 = v4;
  }

  return v4;
}

- (char)createDescription:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  v5 = (char *)nw_endpoint_copy_interface(self);
  v19 = 0LL;
  memset(out, 0, 37);
  service_identifier = self->service_identifier;
  uuid_unparse(self->service_identifier, out);
  device_id = (const char *)nw_endpoint_get_device_id(self);
  objc_super v8 = (char *)device_id;
  if (device_id && v3)
  {
    size_t v9 = strlen(device_id);
    __nwlog_salted_hash(v8, v9, v26);
    objc_super v8 = v26;
LABEL_5:
    snprintf(__str, 0x27uLL, " id:%s", v8);
    goto LABEL_6;
  }

  if (device_id) {
    goto LABEL_5;
  }
  __str[0] = 0;
LABEL_6:
  if (self->device_name) {
    snprintf(v24, 0x29uLL, " name:%s", self->device_name);
  }
  else {
    v24[0] = 0;
  }
  if (self->device_model) {
    snprintf(v23, 0x2AuLL, " model:%s", self->device_model);
  }
  else {
    v23[0] = 0;
  }
  if (self->device_color) {
    snprintf(v22, 0x2AuLL, " color:%x", self->device_color);
  }
  else {
    v22[0] = 0;
  }
  if (self->route) {
    snprintf(v21, 0x2AuLL, " route:%d", self->route);
  }
  else {
    v21[0] = 0;
  }
  if (self->contact_id) {
    snprintf(v20, 0x2CuLL, " contact:%s", self->contact_id);
  }
  else {
    v20[0] = 0;
  }
  application_service = self->application_service;
  int is_null = uuid_is_null(self->service_identifier);
  int v12 = uuid_is_null(service_identifier);
  v13 = v5 + 104;
  v14 = ",";
  if (is_null) {
    v14 = "";
  }
  v15 = out;
  if (v12) {
    v15 = "";
  }
  v16 = "@";
  if (!v5)
  {
    v16 = "";
    v13 = "";
  }

  asprintf(&v19, "%s%s%s%s%s%s%s%s%s%s%s", application_service, v14, v15, v16, v13, __str, v24, v23, v22, v21, v20);
  v17 = v19;

  return v17;
}

- (BOOL)isEqualToEndpoint:(id)a3 matchFlags:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_service_endpoint;
  if (!-[NWConcrete_nw_endpoint isEqualToEndpoint:matchFlags:](&v23, sel_isEqualToEndpoint_matchFlags_, v6, v4))
  {
    BOOL v8 = 0;
    goto LABEL_6;
  }

  id v7 = v6;
  alias = self->alias;
  v11 = (const char *)*((void *)v7 + 29);
  if (alias != v11)
  {
    BOOL v12 = !alias || v11 == 0LL;
    if (v12 || strcmp(alias, v11)) {
      goto LABEL_3;
    }
  }

  application_service = self->application_service;
  v14 = (const char *)*((void *)v7 + 30);
  if (application_service != v14)
  {
    BOOL v15 = !application_service || v14 == 0LL;
    if (v15 || strcmp(application_service, v14)) {
      goto LABEL_3;
    }
  }

  device_name = self->device_name;
  v17 = (const char *)*((void *)v7 + 33);
  if (device_name != v17)
  {
    BOOL v18 = !device_name || v17 == 0LL;
    if (v18 || strcmp(device_name, v17)) {
      goto LABEL_3;
    }
  }

  device_model = self->device_model;
  v20 = (const char *)*((void *)v7 + 34);
  if (device_model != v20)
  {
    BOOL v8 = 0;
    if (!device_model || !v20) {
      goto LABEL_4;
    }
    if (strcmp(device_model, v20)) {
      goto LABEL_3;
    }
  }

  contact_id = self->contact_id;
  v22 = (const char *)*((void *)v7 + 36);
  if (contact_id != v22)
  {
    BOOL v8 = 0;
    if (!contact_id || !v22) {
      goto LABEL_4;
    }
    if (strcmp(contact_id, v22)) {
      goto LABEL_3;
    }
  }

  if (self->device_color == *((_DWORD *)v7 + 70)) {
    BOOL v8 = self->route == *((_DWORD *)v7 + 71);
  }
  else {
LABEL_3:
  }
    BOOL v8 = 0;
LABEL_4:

LABEL_6:
  return v8;
}

- (id)copyEndpoint
{
  BOOL v3 = -[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:deviceModel:contactID:]( objc_alloc(&OBJC_CLASS___NWConcrete_nw_application_service_endpoint),  self->application_service,  self->alias,  self->service_identifier,  self->device_name,  self->device_model,  self->contact_id);
  int device_color = nw_endpoint_get_device_color(self);
  nw_endpoint_set_device_color((void *)v3, device_color);
  int advertised_route = nw_endpoint_get_advertised_route(self);
  nw_endpoint_set_advertised_route((void *)v3, advertised_route);
  return (id)v3;
}

- (unint64_t)getHash
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  uuid_clear(uu);
  nw_endpoint_get_agent_identifier(self, uu);
  CC_SHA256_Update(&c, uu, 0x10u);
  device_id = (const void *)nw_endpoint_get_device_id(self);
  CC_SHA256_Update(&c, device_id, 8u);
  CC_SHA256_Update(&c, self->service_identifier, 0x10u);
  alias = self->alias;
  if (alias)
  {
    CC_LONG v5 = strlen(self->alias);
    CC_SHA256_Update(&c, alias, v5);
  }

  application_service = self->application_service;
  if (application_service)
  {
    CC_LONG v7 = strlen(self->application_service);
    CC_SHA256_Update(&c, application_service, v7);
  }

  device_name = self->device_name;
  if (device_name)
  {
    CC_LONG v9 = strlen(self->device_name);
    CC_SHA256_Update(&c, device_name, v9);
  }

  device_model = self->device_model;
  if (device_model)
  {
    CC_LONG v11 = strlen(self->device_model);
    CC_SHA256_Update(&c, device_model, v11);
  }

  contact_id = self->contact_id;
  if (contact_id)
  {
    CC_LONG v13 = strlen(self->contact_id);
    CC_SHA256_Update(&c, contact_id, v13);
  }

  v14 = self;
  BOOL v15 = v14->super.txt_record;

  if (v15)
  {
    v16 = (const void *)*((void *)v15 + 1);
    CC_LONG v17 = v15[4];
  }

  else
  {
    v16 = 0LL;
    CC_LONG v17 = 0;
  }

  CC_SHA256_Update(&c, v16, v17);
  int data = nw_endpoint_get_device_color(v14);
  CC_SHA256_Update(&c, &data, 4u);
  int advertised_route = nw_endpoint_get_advertised_route(v14);
  CC_SHA256_Update(&c, &advertised_route, 4u);
  CC_SHA256_Final(md, &c);
  int8x16_t v20 = *(int8x16_t *)md;
  int8x16_t v21 = v26;

  int8x16_t v18 = veorq_s8(v20, v21);
  return (unint64_t)veor_s8(*(int8x8_t *)v18.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v18, v18, 8uLL));
}

- (BOOL)initWithApplicationService:(const char *)a3 alias:(const unsigned __int8 *)a4 serviceUUID:(const char *)a5 deviceName:(const char *)a6 deviceModel:(const char *)a7 contactID:
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return 0LL;
  }
  v41.receiver = a1;
  v41.super_class = (Class)&OBJC_CLASS___NWConcrete_nw_application_service_endpoint;
  CC_LONG v13 = (char *)objc_msgSendSuper2(&v41, sel_init);
  if (!v13)
  {
    __nwlog_obj();
    int8x16_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446210;
    v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:deviceModel:contactID:]";
    v22 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t type = OS_LOG_TYPE_ERROR;
    char v39 = 0;
    if (__nwlog_fault(v22, &type, &v39))
    {
      if (type == OS_LOG_TYPE_FAULT)
      {
        __nwlog_obj();
        objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v24 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl(&dword_181A5C000, v23, v24, "%{public}s [super init] failed", buf, 0xCu);
        }
      }

      else if (v39)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        __nwlog_obj();
        objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v30 = type;
        BOOL v31 = os_log_type_enabled(v23, type);
        if (backtrace_string)
        {
          if (v31)
          {
            *(_DWORD *)buf = 136446466;
            v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:d"
                  "eviceModel:contactID:]";
            __int16 v44 = 2082;
            v45 = backtrace_string;
            _os_log_impl( &dword_181A5C000,  v23,  v30,  "%{public}s [super init] failed, dumping backtrace:%{public}s",  buf,  0x16u);
          }

          free(backtrace_string);
          goto LABEL_51;
        }

        if (v31)
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl(&dword_181A5C000, v23, v30, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
        }
      }

      else
      {
        __nwlog_obj();
        objc_super v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        os_log_type_t v38 = type;
        if (os_log_type_enabled(v23, type))
        {
          *(_DWORD *)buf = 136446210;
          v43 = "-[NWConcrete_nw_application_service_endpoint initWithApplicationService:alias:serviceUUID:deviceName:dev"
                "iceModel:contactID:]";
          _os_log_impl( &dword_181A5C000,  v23,  v38,  "%{public}s [super init] failed, backtrace limit exceeded",  buf,  0xCu);
        }
      }
    }

@end
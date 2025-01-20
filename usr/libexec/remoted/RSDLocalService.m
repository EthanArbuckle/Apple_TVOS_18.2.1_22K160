@interface RSDLocalService
- ($C55F4281ED4D80276654548F1B6959F4)getTcpOptions;
- (BOOL)is_exposed_to_untrusted_devices;
- (BOOL)is_exposed_to_untrusted_devices_internal;
- (BOOL)is_exposed_to_untrusted_devices_presetup;
- (BOOL)setExposePolicy:(id)a3;
- (BOOL)shouldBeExposedToDevice:(id)a3;
- (NSArray)limit_load_from_device_types;
- (NSArray)limit_load_to_device_types;
- (OS_xpc_object)properties;
- (RSDLocalService)initWithServiceEntryNamed:(const char *)a3;
- (RSDLocalService)initWithToken:(unint64_t)a3 name:(char *)a4 event:(id)a5;
- (char)entitlement;
- (char)name;
- (id)copyServiceDescription;
- (int)legacy_port;
- (unint64_t)token;
- (void)dealloc;
- (void)fireDevice:(id)a3 fd:(int)a4;
- (void)setEntitlement:(char *)a3;
- (void)setIs_exposed_to_untrusted_devices:(BOOL)a3;
- (void)setIs_exposed_to_untrusted_devices_internal:(BOOL)a3;
- (void)setIs_exposed_to_untrusted_devices_presetup:(BOOL)a3;
- (void)setLegacy_port:(int)a3;
- (void)setLimit_load_from_device_types:(id)a3;
- (void)setLimit_load_to_device_types:(id)a3;
- (void)setName:(char *)a3;
- (void)setProperties:(id)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation RSDLocalService

- (RSDLocalService)initWithToken:(unint64_t)a3 name:(char *)a4 event:(id)a5
{
  id v8 = a5;
  v9 = -[RSDLocalService init](self, "init");
  v10 = v9;
  if (!v9)
  {
LABEL_12:
    v15 = 0LL;
    goto LABEL_13;
  }

  -[RSDLocalService setToken:](v9, "setToken:", a3);
  -[RSDLocalService setName:](v10, "setName:", strdup(a4));
  string = xpc_dictionary_get_string(v8, "RequireEntitlement");
  if (!string)
  {
    v16 = (os_log_s *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100024670((uint64_t)a4, v16, v17);
    }
    goto LABEL_12;
  }

  -[RSDLocalService setEntitlement:](v10, "setEntitlement:", strdup(string));
  if (!-[RSDLocalService setExposePolicy:](v10, "setExposePolicy:", v8))
  {
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_1000246EC();
    }
    goto LABEL_12;
  }

  xpc_object_t value = xpc_dictionary_get_value(v8, "ServiceProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue(value);
  v14 = v13;
  if (v13 && xpc_get_type(v13) == (xpc_type_t)&_xpc_type_dictionary) {
    -[RSDLocalService setProperties:](v10, "setProperties:", v14);
  }
  v15 = v10;

LABEL_13:
  return v15;
}

- ($C55F4281ED4D80276654548F1B6959F4)getTcpOptions
{
  retstr->var4 = 8;
  *(_OWORD *)&retstr->var0 = xmmword_100030490;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService properties](self, "properties"));

  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService properties](self, "properties"));
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v7, "TcpOptions");
    xpc_object_t xdict = (xpc_object_t)objc_claimAutoreleasedReturnValue(dictionary);

    v9 = xdict;
    if (xdict)
    {
      xpc_object_t value = xpc_dictionary_get_value(xdict, "KeepAlive");
      v11 = (void *)objc_claimAutoreleasedReturnValue(value);
      v12 = v11;
      if (v11 && xpc_get_type(v11) == (xpc_type_t)&_xpc_type_BOOL) {
        retstr->var0 = xpc_BOOL_get_value(v12);
      }
      uint64_t uint64 = xpc_dictionary_get_uint64(xdict, "KeepAliveTime");
      uint64_t v14 = xpc_dictionary_get_uint64(xdict, "KeepCount");
      if (v14) {
        retstr->var2 = v14;
      }
      uint64_t v15 = xpc_dictionary_get_uint64(xdict, "KeepInterval");
      if (v15) {
        retstr->var3 = v15;
      }
      uint64_t v16 = xpc_dictionary_get_uint64(xdict, "ConnectTimeout");
      if (v16) {
        retstr->var4 = v16;
      }

      v9 = xdict;
    }
  }

  return result;
}

- (RSDLocalService)initWithServiceEntryNamed:(const char *)a3
{
  v4 = -[RSDLocalService init](self, "init");
  if (v4 && (v5 = getservbyname(a3, "tcp")) != 0LL)
  {
    -[RSDLocalService setLegacy_port:](v4, "setLegacy_port:", bswap32(LOWORD(v5->s_port)) >> 16);
    -[RSDLocalService setName:](v4, "setName:", strdup(a3));
    -[RSDLocalService setEntitlement:](v4, "setEntitlement:", strdup("AppleInternal"));
    keys = "Legacy";
    xpc_object_t values = &_xpc_BOOL_true;
    xpc_object_t v6 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
    -[RSDLocalService setProperties:](v4, "setProperties:", v6);

    v7 = v4;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (void)fireDevice:(id)a3 fd:(int)a4
{
  id v8 = a3;
  if (a4 == -1) {
    sub_10002474C(&v9, v10);
  }
  xpc_object_t v6 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_fd(v6, "fd", a4);
  id v7 = [v8 copyClientDescriptionWithSensitiveProperties:0];
  xpc_dictionary_set_value(v6, "device", v7);

  xpc_event_publisher_fire(qword_100043060, -[RSDLocalService token](self, "token"), v6);
}

- (BOOL)shouldBeExposedToDevice:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService limit_load_to_device_types](self, "limit_load_to_device_types"));
  if (!v5
    || (xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService limit_load_to_device_types](self, "limit_load_to_device_types")),
        v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 type])),  unsigned int v8 = objc_msgSend(v6, "containsObject:", v7),  v7,  v6,  v5,  v8))
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService limit_load_from_device_types](self, "limit_load_from_device_types"));
    if (!v9
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService limit_load_from_device_types](self, "limit_load_from_device_types")),
          v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [v4 type])),  unsigned __int8 v12 = objc_msgSend(v10, "containsObject:", v11),  v11,  v10,  v9,  (v12 & 1) == 0))
    {
      if (-[RSDLocalService entitlement](self, "entitlement")
        && (!strcmp(-[RSDLocalService entitlement](self, "entitlement"), "AppleInternal")
         || !strcmp(-[RSDLocalService entitlement](self, "entitlement"), "None-AppleInternal"))
        && (os_variant_has_internal_content("com.apple.xpc.remoted") & 1) != 0
        || -[RSDLocalService is_exposed_to_untrusted_devices](self, "is_exposed_to_untrusted_devices"))
      {
        goto LABEL_11;
      }

      if (!-[RSDLocalService is_exposed_to_untrusted_devices_presetup]( self,  "is_exposed_to_untrusted_devices_presetup")) {
        goto LABEL_38;
      }
      int v14 = MKBGetDeviceLockState(0LL);
      uint64_t v15 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v27 = 67109120;
        *(_DWORD *)&v27[4] = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "MobileKeyBagState: %d", v27, 8u);
      }

      BOOL v16 = xpc_dictionary_get_BOOL((xpc_object_t)qword_100043238, "StoreDemoMode");
      if (qword_100043080 != -1) {
        dispatch_once(&qword_100043080, &stru_10003D180);
      }
      int v17 = byte_100043078;
      v18 = (const __CFBoolean *)CFPreferencesCopyValue( @"SetupDone",  @"com.apple.purplebuddy",  @"mobile",  kCFPreferencesCurrentHost);
      v19 = v18;
      if (v18)
      {
        BOOL v20 = CFBooleanGetValue(v18) != 0;
        CFRelease(v19);
      }

      else
      {
        BOOL v20 = 0;
      }

      v21 = (os_log_s *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_DEBUG))
      {
        v22 = "no";
        if (v17) {
          v23 = "yes";
        }
        else {
          v23 = "no";
        }
        if (v16) {
          v24 = "yes";
        }
        else {
          v24 = "no";
        }
        *(_DWORD *)v27 = 136315906;
        *(void *)&v27[4] = v23;
        if (v14 == 3) {
          v25 = "yes";
        }
        else {
          v25 = "no";
        }
        *(_WORD *)&v27[12] = 2080;
        *(void *)&v27[14] = v24;
        *(_WORD *)&v27[22] = 2080;
        v28 = v25;
        if (v20) {
          v22 = "yes";
        }
        __int16 v29 = 2080;
        v30 = v22;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "setup status:\n \tin diagnostics mode: %s\n \tin store demo mode: %s\n \tno passcode set: %s\n \tbuddy is done: %s\n",  v27,  0x2Au);
        if (!v17)
        {
LABEL_22:
          if (v14 == 3)
          {
            if (v20 && !v16) {
              goto LABEL_38;
            }
LABEL_11:
            unsigned __int8 v13 = 1;
            goto LABEL_41;
          }
        }
      }

      else if (!v17)
      {
        goto LABEL_22;
      }

      if (v17) {
        goto LABEL_11;
      }
LABEL_38:
      if (!-[RSDLocalService is_exposed_to_untrusted_devices_internal]( self,  "is_exposed_to_untrusted_devices_internal",  *(_OWORD *)v27,  *(void *)&v27[16],  v28)
        || (os_variant_allows_internal_security_policies("com.apple.xpc.remoted") & 1) == 0)
      {
        unsigned __int8 v13 = [v4 isTrusted];
        goto LABEL_41;
      }

      goto LABEL_11;
    }
  }

  unsigned __int8 v13 = 0;
LABEL_41:

  return v13;
}

- (id)copyServiceDescription
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (-[RSDLocalService entitlement](self, "entitlement"))
  {
    if (!strcmp(-[RSDLocalService entitlement](self, "entitlement"), "None-AppleInternal"))
    {
      xpc_dictionary_set_string(v3, "EntitlementOverride", "None-AppleInternal");
      id v4 = "AppleInternal";
    }

    else
    {
      id v4 = -[RSDLocalService entitlement](self, "entitlement");
    }

    xpc_dictionary_set_string(v3, "Entitlement", v4);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService properties](self, "properties"));

  if (v5)
  {
    xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDLocalService properties](self, "properties"));
    xpc_dictionary_set_value(v3, "Properties", v6);
  }

  if (-[RSDLocalService legacy_port](self, "legacy_port"))
  {
    *(void *)&__int128 v7 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)__str = v7;
    __int128 v10 = v7;
    snprintf(__str, 0x20uLL, "%d", -[RSDLocalService legacy_port](self, "legacy_port"));
    xpc_dictionary_set_string(v3, "Port", __str);
  }

  return v3;
}

- (BOOL)setExposePolicy:(id)a3
{
  id v4 = a3;
  xpc_object_t value = xpc_dictionary_get_value(v4, "LimitExposedToDeviceType");
  xpc_object_t v6 = (void *)objc_claimAutoreleasedReturnValue(value);
  xpc_object_t v7 = xpc_dictionary_get_value(v4, "LimitExposedFromDeviceType");
  uint64_t v8 = objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  BOOL v11 = v10;
  if (!v10)
  {
    v18 = (void *)qword_100043220;
    if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR)) {
      sub_100024844(v18, self);
    }
    goto LABEL_23;
  }

  -[RSDLocalService setIs_exposed_to_untrusted_devices_presetup:]( self,  "setIs_exposed_to_untrusted_devices_presetup:",  xpc_dictionary_get_BOOL(v4, "ExposedToUntrustedDevicesPreSetup"));
  xpc_object_t v12 = xpc_dictionary_get_value(v4, "ExposedToUntrustedDevices");
  unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  int v14 = v13;
  if (v13)
  {
    xpc_type_t type = xpc_get_type(v13);
    if (type == (xpc_type_t)&_xpc_type_BOOL)
    {
      -[RSDLocalService setIs_exposed_to_untrusted_devices:]( self,  "setIs_exposed_to_untrusted_devices:",  xpc_BOOL_get_value(v14));
    }

    else
    {
      BOOL v16 = type;
      if (type == (xpc_type_t)&_xpc_type_array)
      {
        applier[0] = _NSConcreteStackBlock;
        applier[1] = 3221225472LL;
        applier[2] = sub_1000060C4;
        applier[3] = &unk_10003CEF0;
        applier[4] = self;
        xpc_array_apply(v14, applier);
        if (!v6) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }

      int v17 = (void *)qword_100043220;
      if (os_log_type_enabled((os_log_t)qword_100043220, OS_LOG_TYPE_ERROR))
      {
        sub_1000247B4(v17, (uint64_t)self, v16);
        if (!v6) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
  }

  if (v6)
  {
LABEL_19:
    id v20 = sub_100006188((uint64_t)-[RSDLocalService name](self, "name"), v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[RSDLocalService setLimit_load_to_device_types:](self, "setLimit_load_to_device_types:", v21);
  }

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___RSDLocalService;
  -[RSDLocalService dealloc](&v3, "dealloc");
}

- (int)legacy_port
{
  return self->_legacy_port;
}

- (void)setLegacy_port:(int)a3
{
  self->_legacy_port = a3;
}

- (unint64_t)token
{
  return self->_token;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (char)name
{
  return self->_name;
}

- (void)setName:(char *)a3
{
  self->_name = a3;
}

- (char)entitlement
{
  return self->_entitlement;
}

- (void)setEntitlement:(char *)a3
{
  self->_entitlement = a3;
}

- (OS_xpc_object)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
}

- (BOOL)is_exposed_to_untrusted_devices
{
  return self->_is_exposed_to_untrusted_devices;
}

- (void)setIs_exposed_to_untrusted_devices:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices = a3;
}

- (BOOL)is_exposed_to_untrusted_devices_presetup
{
  return self->_is_exposed_to_untrusted_devices_presetup;
}

- (void)setIs_exposed_to_untrusted_devices_presetup:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices_presetup = a3;
}

- (BOOL)is_exposed_to_untrusted_devices_internal
{
  return self->_is_exposed_to_untrusted_devices_internal;
}

- (void)setIs_exposed_to_untrusted_devices_internal:(BOOL)a3
{
  self->_is_exposed_to_untrusted_devices_internal = a3;
}

- (NSArray)limit_load_to_device_types
{
  return self->_limit_load_to_device_types;
}

- (void)setLimit_load_to_device_types:(id)a3
{
}

- (NSArray)limit_load_from_device_types
{
  return self->_limit_load_from_device_types;
}

- (void)setLimit_load_from_device_types:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
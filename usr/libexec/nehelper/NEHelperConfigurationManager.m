@interface NEHelperConfigurationManager
- (NEHelperConfigurationManager)initWithFirstMessage:(id)a3;
- (NSString)name;
- (OS_dispatch_queue)handlerQueue;
- (void)handleMessage:(id)a3;
@end

@implementation NEHelperConfigurationManager

- (NEHelperConfigurationManager)initWithFirstMessage:(id)a3
{
  id v4 = a3;
  v97.receiver = self;
  v97.super_class = (Class)&OBJC_CLASS___NEHelperConfigurationManager;
  v5 = -[NEHelperConfigurationManager init](&v97, "init");
  if (!v5)
  {
LABEL_84:
    v46 = v5;
    goto LABEL_85;
  }

  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  pid_t pid = xpc_connection_get_pid(v7);
  dispatch_queue_attr_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v9);
  dispatch_queue_t v11 = dispatch_queue_create("NEHelperConfigurationManager", v10);
  queue = v5->_queue;
  v5->_queue = (OS_dispatch_queue *)v11;

  v5->_BOOL entitled = 0;
  uint64_t v13 = NECopyUserUUIDFromXPCEUID(v7);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
  userUUID = v5->_userUUID;
  v5->_userUUID = (NSUUID *)v14;

  v5->_userUID = xpc_connection_get_euid(v7);
  v5->_BOOL hasProviderPermission = 0;
  uint64_t v16 = NECopySigningIdentifierForXPCMessage(v4);
  bundleID = v5->_bundleID;
  v5->_bundleID = (NSString *)v16;

  xpc_object_t value = xpc_dictionary_get_value(v4, "preferred-languages");
  type = (void *)objc_claimAutoreleasedReturnValue(value);
  v21 = type;
  if (type)
  {
    type = xpc_get_type(type);
    if (type == &_xpc_type_array)
    {
      type = (void *)xpc_array_get_count(v21);
      if (type)
      {
        v22 = (void *)_CFXPCCreateCFObjectFromXPCObject(v21);
        NEResourcesSetPreferredLanguages();
      }
    }
  }

  if (v5->_bundleID)
  {
    if (xpc_connection_is_extension(v7))
    {
      v23 = v5->_bundleID;
      if (v23)
      {
        v24 = v23;
        uint64_t v26 = ne_log_obj(v24, v25);
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_INFO,  "Client is an extension with bundle identifier %@",  buf,  0xCu);
        }

        v28 = (void *)objc_claimAutoreleasedReturnValue( +[LSPlugInKitProxy pluginKitProxyForIdentifier:]( &OBJC_CLASS___LSPlugInKitProxy,  "pluginKitProxyForIdentifier:",  v24));
        v29 = (void *)objc_claimAutoreleasedReturnValue([v28 containingBundle]);
        uint64_t v30 = objc_claimAutoreleasedReturnValue([v29 bundleIdentifier]);
        v31 = v5->_bundleID;
        v5->_bundleID = (NSString *)v30;

        uint64_t v34 = ne_log_obj(v32, v33);
        v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = v5->_bundleID;
          *(_DWORD *)buf = 138412290;
          v99 = v36;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_INFO,  "Containing app for extension is %@",  buf,  0xCu);
        }
      }
    }

    if (proc_name(pid, buffer, 0x40u) <= 0) {
      snprintf(buffer, 0x40uLL, "%d", pid);
    }
    uint64_t v37 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", buffer));
    clientName = v5->_clientName;
    v5->_clientName = (NSString *)v37;

    v39 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.developer.networking.vpn.api");
    v40 = v39;
    if (v39)
    {
      if (xpc_get_type(v39) == (xpc_type_t)&_xpc_type_array)
      {
        if (xpc_array_get_count(v40))
        {
          string = xpc_array_get_string(v40, 0LL);
          if (string)
          {
            v56 = string;
            size_t v57 = strlen(string);
            if (!strncmp(v56, "allow-vpn", v57))
            {
              objc_storeStrong((id *)&v5->_applicationID, v5->_bundleID);
              v5->_BOOL entitled = 1;
            }
          }
        }
      }
    }

    v41 = (void *)xpc_connection_copy_entitlement_value(v7, "com.apple.security.application-groups");

    if (v41 && xpc_get_type(v41) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(v41))
    {
      __int128 v93 = 0u;
      __int128 v94 = 0u;
      __int128 v95 = 0u;
      __int128 v96 = 0u;
      id v58 = (id)_CFXPCCreateCFObjectFromXPCObject(v41);
      id v59 = [v58 countByEnumeratingWithState:&v93 objects:v109 count:16];
      v42 = v58;
      if (v59)
      {
        id v60 = v59;
        uint64_t v61 = *(void *)v94;
        while (2)
        {
          for (i = 0LL; i != v60; i = (char *)i + 1)
          {
            if (*(void *)v94 != v61) {
              objc_enumerationMutation(v58);
            }
            if ((isa_nsstring(*(void *)(*((void *)&v93 + 1) + 8LL * (void)i)) & 1) == 0)
            {

              v42 = 0LL;
              goto LABEL_54;
            }
          }

          id v60 = [v58 countByEnumeratingWithState:&v93 objects:v109 count:16];
          if (v60) {
            continue;
          }
          break;
        }

        v42 = v58;
      }

- (NSString)name
{
  return self->_bundleID;
}

- (OS_dispatch_queue)handlerQueue
{
  if (self) {
    self = (NEHelperConfigurationManager *)objc_getProperty(self, a2, 32LL, 1);
  }
  return (OS_dispatch_queue *)self;
}

- (void)handleMessage:(id)a3
{
  id v4 = a3;
  int64_t int64 = xpc_dictionary_get_int64(v4, "config-operation");
  if (!int64)
  {
    v10 = 0LL;
    goto LABEL_9;
  }

  int64_t v6 = int64;
  string = xpc_dictionary_get_string(v4, "config-plugin-type");
  if (string)
  {
    dispatch_queue_attr_t v9 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  xpc_dictionary_get_string(v4, "config-plugin-type"));
    string = (const char *)objc_claimAutoreleasedReturnValue(v9);
    v10 = (id (*)(uint64_t, uint64_t))string;
    if (!self) {
      goto LABEL_8;
    }
  }

  else
  {
    v10 = 0LL;
    if (!self)
    {
LABEL_8:
      sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
      goto LABEL_9;
    }
  }

  if (!self->_entitled) {
    goto LABEL_8;
  }
  if (v6 == 5 && !self->_superEntitled)
  {
    uint64_t v11 = ne_log_obj(string, v8);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = objc_getProperty(self, v13, 64LL, 1);
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Rejecting fetch-identities operation from non-super-entitled app %@",  buf,  0xCu);
    }

    goto LABEL_8;
  }

  if (v10)
  {
    v321 = v10;
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v321, 1LL));
    objc_msgSend(objc_getProperty(self, v15, 56, 1), "setObject:forKeyedSubscript:", v14, @"plugin-types");
  }

  else
  {
    id v16 = objc_msgSend(objc_getProperty(self, v8, 56, 1), "removeObjectForKey:", @"plugin-types");
  }

  switch(v6)
  {
    case 1LL:
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
      id v20 = objc_getProperty(self, v19, 56LL, 1);
      id Property = objc_getProperty(self, v21, 32LL, 1);
      v315[0] = _NSConcreteStackBlock;
      v315[1] = 3221225472LL;
      v315[2] = sub_100016CF8;
      v315[3] = &unk_100035140;
      id v316 = v4;
      [v18 loadIndexWithFilter:v20 completionQueue:Property handler:v315];

      goto LABEL_9;
    case 2LL:
      xpc_object_t value = xpc_dictionary_get_value(v4, "config-ids-data");
      v24 = (void *)objc_claimAutoreleasedReturnValue(value);
      uint64_t v25 = v24;
      if (v24 && xpc_get_type(v24) == (xpc_type_t)&_xpc_type_data)
      {
        uint64_t v26 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
        bytes_ptr = xpc_data_get_bytes_ptr(v25);
        v28 = +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  bytes_ptr,  xpc_data_get_length(v25),  0LL);
        v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        uint64_t v30 = -[NSKeyedUnarchiver initForReadingFromData:error:](v26, "initForReadingFromData:error:", v29, 0LL);

        uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSArray);
        uint64_t v32 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v31,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue( -[NSKeyedUnarchiver decodeObjectOfClasses:forKey:]( v30,  "decodeObjectOfClasses:forKey:",  v33,  @"config-identifiers"));

        uint64_t v35 = isa_nsarray(v34);
        int v36 = v35;
        uint64_t v38 = ne_log_obj(v35, v37);
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
        v40 = v39;
        if (v36)
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = objc_getProperty(self, v41, 64LL, 1);
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEBUG,  "%@ fetching configs with IDs: %@",  buf,  0x16u);
          }

          v42 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
          id v44 = objc_getProperty(self, v43, 56LL, 1);
          id v46 = objc_getProperty(self, v45, 32LL, 1);
          v313[0] = _NSConcreteStackBlock;
          v313[1] = 3221225472LL;
          v313[2] = sub_100016DD8;
          v313[3] = &unk_100035168;
          id v314 = v4;
          [v42 loadConfigurations:v34 withFilter:v44 completionQueue:v46 completionHandler:v313];
        }

        else
        {
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = objc_getProperty(self, v178, 64LL, 1);
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v34;
            _os_log_error_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "%@ Received invalid config IDs: %@",  buf,  0x16u);
          }

          sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 0LL, 0LL);
        }
      }

      goto LABEL_9;
    case 3LL:
      size_t length = 0LL;
      data = xpc_dictionary_get_data(v4, "config-data", &length);
      size_t v311 = 0LL;
      id v48 = (void *)xpc_dictionary_get_data(v4, "config-signature", &v311);
      if (length > 0x80000)
      {
        uint64_t v50 = ne_log_obj(v48, v49);
        id v51 = (os_log_s *)objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          id v187 = objc_getProperty(self, v52, 64LL, 1);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v187;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = length;
          _os_log_error_impl( (void *)&_mh_execute_header,  v51,  OS_LOG_TYPE_ERROR,  "%@ configuration is too large: %lu",  buf,  0x16u);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 2LL, 0LL);
        goto LABEL_9;
      }

      v124 = v48;
      v125 = 0LL;
      if (data && length)
      {
        v126 = objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver);
        v127 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytesNoCopy:length:freeWhenDone:]( &OBJC_CLASS___NSData,  "dataWithBytesNoCopy:length:freeWhenDone:",  data,  length,  0LL));
        v128 = -[NSKeyedUnarchiver initForReadingFromData:error:](v126, "initForReadingFromData:error:", v127, 0LL);

        id v129 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v128,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___NEConfiguration),  @"config-object");
        v125 = (void *)objc_claimAutoreleasedReturnValue(v129);
      }

      if (!v124 || !v311)
      {
        if (self->_appGroupEntitled) {
          goto LABEL_122;
        }
        v130 = 0LL;
LABEL_103:
        id v134 = objc_msgSend(objc_getProperty(self, v49, 24, 1), "count");
        if (!v134) {
          goto LABEL_107;
        }
        id v134 = objc_getProperty(self, v135, 40LL, 1);
        if (!v134) {
          goto LABEL_107;
        }
        v131 = (void *)objc_claimAutoreleasedReturnValue( +[NEConfigurationManager sharedManagerForAllUsers]( &OBJC_CLASS___NEConfigurationManager,  "sharedManagerForAllUsers"));
        id v149 = objc_getProperty(self, v148, 24LL, 1);
        objc_msgSend(v131, "addGroups:forApp:", v149, objc_getProperty(self, v150, 40, 1));

LABEL_106:
        goto LABEL_107;
      }

      id v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v124));
      v130 = v48;
      if (!self->_appGroupEntitled) {
        goto LABEL_103;
      }
      if (!v48)
      {
LABEL_122:
        uint64_t v166 = ne_log_obj(v48, v49);
        v167 = (os_log_s *)objc_claimAutoreleasedReturnValue(v166);
        if (os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
        {
          id v224 = objc_getProperty(self, v168, 64LL, 1);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v224;
          _os_log_error_impl( (void *)&_mh_execute_header,  v167,  OS_LOG_TYPE_ERROR,  "%@ cannot create new configurations because it is only app group entitled",  buf,  0xCu);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
        goto LABEL_9;
      }

      v131 = (void *)objc_claimAutoreleasedReturnValue([v125 VPN]);
      if (v131) {
        goto LABEL_106;
      }
      v131 = (void *)objc_claimAutoreleasedReturnValue([v125 appVPN]);
      if (v131) {
        goto LABEL_106;
      }
      v131 = (void *)objc_claimAutoreleasedReturnValue([v125 contentFilter]);
      if (v131) {
        goto LABEL_106;
      }
      v131 = (void *)objc_claimAutoreleasedReturnValue([v125 dnsProxy]);
      if (v131) {
        goto LABEL_106;
      }
      v132 = (void *)objc_claimAutoreleasedReturnValue([v125 relay]);
      BOOL v133 = v132 == 0LL;

      if (v133)
      {
        uint64_t v136 = ne_log_obj(v134, v135);
        v137 = (os_log_s *)objc_claimAutoreleasedReturnValue(v136);
        if (os_log_type_enabled(v137, OS_LOG_TYPE_ERROR))
        {
          v277 = (void *)objc_claimAutoreleasedReturnValue([v125 name]);
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v277;
          _os_log_error_impl( (void *)&_mh_execute_header,  v137,  OS_LOG_TYPE_ERROR,  "Configuration type of %@ does not allow modification by app group entitled apps",  buf,  0xCu);
        }

        sub_10000E864((uint64_t)&OBJC_CLASS___NEHelperServer, v4, 10LL, 0LL);
        goto LABEL_9;
      }

- (void).cxx_destruct
{
}

@end
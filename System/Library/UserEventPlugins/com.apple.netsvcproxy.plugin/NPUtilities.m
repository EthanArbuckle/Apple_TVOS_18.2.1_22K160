@interface NPUtilities
+ (BOOL)compareAddressEndpoints:(id)a3 endpoint2:(id)a4 addressOnly:(BOOL)a5;
+ (BOOL)hasPacketDrop:(id)a3;
+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4;
+ (BOOL)rollDiceWithSuccessRatio:(id)a3;
+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3;
+ (id)connectionInfoToDict:(id)a3 dictionary:(id)a4;
+ (id)copyBase64HeaderValueFromData:(id)a3;
+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3;
+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4;
+ (id)copyDataHexString:(id)a3;
+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3;
+ (id)copyNetworkDescription:(id)a3;
+ (id)copyTrueClientIPAddressFromPreferences;
+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4;
+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4;
+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4;
+ (id)getHashForObject:(id)a3;
+ (id)getInterfaceName:(int64_t)a3;
+ (id)getInterfaceTypeString:(int64_t)a3;
+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4;
+ (id)machoUUIDFromPID:(int)a3;
+ (id)parseXHost:(id)a3;
+ (id)sharedEmphemeralSession;
+ (id)stringFromLinkQualityValue:(int)a3;
+ (id)stripWhitespace:(id)a3;
+ (id)timestampIdentifierToName:(unint64_t)a3;
+ (int)pidFromAuditToken:(id *)a3;
+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3;
+ (int64_t)interfaceTypeOfInterface:(id)a3;
+ (int64_t)interfaceTypeOfNWInterface:(id)a3;
+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4;
+ (unint64_t)parseXRTT:(id)a3;
+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3;
+ (void)fillOutConnectionInfo:(id)a3 withPath:(id)a4 interface:(id)a5 remoteEndpoint:(id)a6 parameters:(id)a7 outputHandler:(nw_protocol *)a8;
+ (void)parseXTimeout:(id)a3 hardTTLInSeconds:(double *)a4;
+ (void)postNotification:(id)a3 value:(unint64_t)a4;
+ (void)removeDataFromKeychainWithIdentifier:(id)a3;
+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4;
+ (void)removeKeyFromKeychainWithIdentifier:(id)a3;
+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5;
+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4;
@end

@implementation NPUtilities

+ (id)sharedEmphemeralSession
{
  if (qword_17DF8 != -1) {
    dispatch_once(&qword_17DF8, &stru_14778);
  }
  return (id)qword_17DF0;
}

+ (id)copyDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v15[0] = kSecClass;
  v15[1] = kSecAttrService;
  v16[0] = kSecClassGenericPassword;
  v16[1] = v5;
  v15[2] = kSecAttrAccount;
  v15[3] = kSecMatchLimit;
  v16[2] = v6;
  v16[3] = kSecMatchLimitOne;
  v15[4] = kSecReturnData;
  v16[4] = &__kCFBooleanTrue;
  v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v16,  v15,  5LL));
  CFTypeRef v14 = 0LL;
  if (SecItemCopyMatching(v7, &v14)
    || (CFTypeRef v8 = v14, v9 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v8, v9) & 1) == 0))
  {
    id v11 = nplog_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_BAD4();
    }

    CFTypeRef v10 = 0LL;
  }

  else
  {
    CFTypeRef v10 = v14;
  }

  return (id)v10;
}

+ (void)saveDataToKeychain:(id)a3 withIdentifier:(id)a4 accountName:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v19[0] = kSecClass;
  v19[1] = kSecAttrService;
  v20[0] = kSecClassGenericPassword;
  v20[1] = v7;
  v19[2] = kSecAttrAccount;
  v20[2] = v8;
  id v9 = a3;
  CFTypeRef v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  3LL));
  v17[0] = kSecAttrService;
  v17[1] = kSecAttrAccount;
  v18[0] = v7;
  v18[1] = v8;
  v17[2] = kSecValueData;
  v17[3] = kSecAttrAccessible;
  v18[2] = v9;
  v18[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  id v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  4LL));

  OSStatus v12 = SecItemUpdate(v10, v11);
  if (v12 == -25300)
  {
    id v13 = -[__CFDictionary mutableCopy](v11, "mutableCopy");
    [v13 setObject:kSecClassGenericPassword forKeyedSubscript:kSecClass];
    OSStatus v12 = SecItemAdd((CFDictionaryRef)v13, 0LL);
  }

  if (v12)
  {
    id v14 = nplog_obj();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_BB34();
    }

    [a1 removeDataFromKeychainWithIdentifier:v7 accountName:v8];
  }
}

+ (unint64_t)totalDataInKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v24[0] = kSecClass;
  v24[1] = kSecAttrService;
  v25[0] = kSecClassGenericPassword;
  v25[1] = v3;
  v24[2] = kSecMatchLimit;
  v24[3] = kSecReturnData;
  v25[2] = kSecMatchLimitAll;
  v25[3] = &__kCFBooleanTrue;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  4LL));
  CFTypeRef result = 0LL;
  OSStatus v5 = SecItemCopyMatching(v4, &result);
  id v6 = 0LL;
  id v7 = (void *)result;
  if (!v5)
  {
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSData);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      id v6 = (char *)[v7 length];
    }

    else
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSArray);
      if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
      {
        __int128 v20 = 0u;
        __int128 v21 = 0u;
        __int128 v18 = 0u;
        __int128 v19 = 0u;
        id v10 = v7;
        id v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v11)
        {
          id v12 = v11;
          id v6 = 0LL;
          uint64_t v13 = *(void *)v19;
          do
          {
            for (i = 0LL; i != v12; i = (char *)i + 1)
            {
              if (*(void *)v19 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
              uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData);
              if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0) {
                id v6 = &v6[(void)objc_msgSend(v15, "length", (void)v18)];
              }
            }

            id v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
          }

          while (v12);
        }

        else
        {
          id v6 = 0LL;
        }
      }

      else
      {
        id v6 = 0LL;
      }
    }
  }

  return (unint64_t)v6;
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v14[0] = kSecClass;
  v14[1] = kSecAttrService;
  v15[0] = kSecClassGenericPassword;
  v15[1] = v3;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  OSStatus v5 = SecItemDelete(v4);
  if (v5 != -25300 && v5 != 0)
  {
    OSStatus v7 = v5;
    id v8 = nplog_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      OSStatus v13 = v7;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to delete %@ from the keychain: %d",  (uint8_t *)&v10,  0x12u);
    }
  }
}

+ (void)removeDataFromKeychainWithIdentifier:(id)a3 accountName:(id)a4
{
  id v5 = a3;
  v17[0] = kSecClass;
  v17[1] = kSecAttrService;
  v18[0] = kSecClassGenericPassword;
  v18[1] = v5;
  v17[2] = kSecAttrAccount;
  v18[2] = a4;
  id v6 = a4;
  OSStatus v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  3LL));

  OSStatus v8 = SecItemDelete(v7);
  if (v8 != -25300 && v8 != 0)
  {
    OSStatus v10 = v8;
    id v11 = nplog_obj();
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 1024;
      OSStatus v16 = v10;
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "Failed to delete %@ from the keychain: %d",  (uint8_t *)&v13,  0x12u);
    }
  }
}

+ (__SecKey)copyKeyFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v11[0] = kSecClass;
  v11[1] = kSecAttrApplicationLabel;
  v12[0] = kSecClassKey;
  v12[1] = v3;
  v11[2] = kSecMatchLimit;
  v11[3] = kSecReturnRef;
  v12[2] = kSecMatchLimitOne;
  v12[3] = &__kCFBooleanTrue;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  4LL));
  CFTypeRef cf = 0LL;
  if (SecItemCopyMatching(v4, &cf) || (CFTypeID v5 = CFGetTypeID(cf), v5 != SecKeyGetTypeID()))
  {
    id v7 = nplog_obj();
    OSStatus v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_BAD4();
    }

    if (cf) {
      CFRelease(cf);
    }
    id v6 = 0LL;
  }

  else
  {
    id v6 = (__SecKey *)cf;
  }

  return v6;
}

+ (void)saveKeyToKeychain:(__SecKey *)a3 withIdentifier:(id)a4
{
  id v5 = a4;
  v9[0] = kSecClass;
  v9[1] = kSecAttrApplicationLabel;
  v9[2] = kSecValueRef;
  v9[3] = kSecAttrAccessible;
  v10[0] = kSecClassKey;
  v10[1] = v5;
  v10[2] = a3;
  v10[3] = kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly;
  id v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v10,  v9,  4LL));
  if (SecItemAdd(v6, 0LL))
  {
    id v7 = nplog_obj();
    OSStatus v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_BB94();
    }
  }
}

+ (void)removeKeyFromKeychainWithIdentifier:(id)a3
{
  id v3 = a3;
  v14[0] = kSecClass;
  v14[1] = kSecAttrApplicationLabel;
  v15[0] = kSecClassKey;
  v15[1] = v3;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
  OSStatus v5 = SecItemDelete(v4);
  if (v5 != -25300 && v5 != 0)
  {
    OSStatus v7 = v5;
    id v8 = nplog_obj();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 1024;
      OSStatus v13 = v7;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "Failed to delete key %@ from the keychain: %d",  (uint8_t *)&v10,  0x12u);
    }
  }
}

+ (id)copyItemIdentifiersFromKeychainWithAccountName:(id)a3
{
  id v3 = a3;
  v27[0] = kSecClass;
  v27[1] = kSecAttrAccount;
  v28[0] = kSecClassGenericPassword;
  v28[1] = v3;
  v27[2] = kSecMatchLimit;
  v27[3] = kSecReturnAttributes;
  v28[2] = kSecMatchLimitAll;
  v28[3] = &__kCFBooleanTrue;
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v28,  v27,  4LL));
  CFTypeRef result = 0LL;
  if (SecItemCopyMatching(v4, &result)
    || (CFTypeRef v5 = result, v6 = objc_opt_class(&OBJC_CLASS___NSArray), (objc_opt_isKindOfClass(v5, v6) & 1) == 0))
  {
    id v17 = nplog_obj();
    OSStatus v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_BAD4();
    }
    goto LABEL_19;
  }

  OSStatus v7 = (id)result;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  id v8 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  if (!v8)
  {
LABEL_19:
    int v10 = 0LL;
    goto LABEL_20;
  }

  id v9 = v8;
  __int128 v19 = v4;
  id v20 = v3;
  int v10 = 0LL;
  uint64_t v11 = *(void *)v22;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v22 != v11) {
        objc_enumerationMutation(v7);
      }
      OSStatus v13 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
      {
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKeyedSubscript:kSecAttrService]);
        uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
        {
          if (!v10) {
            int v10 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
          }
          -[NSMutableArray addObject:](v10, "addObject:", v15, v19, v20);
        }
      }
    }

    id v9 = -[os_log_s countByEnumeratingWithState:objects:count:]( v7,  "countByEnumeratingWithState:objects:count:",  &v21,  v26,  16LL);
  }

  while (v9);
  v4 = v19;
  id v3 = v20;
LABEL_20:

  if (result) {
    CFRelease(result);
  }

  return v10;
}

+ (int64_t)interfaceTypeOfInterface:(id)a3
{
  uint64_t v3 = nw_interface_get_type((nw_interface_t)a3) - 1;
  else {
    return 0LL;
  }
}

+ (int64_t)interfaceTypeOfNWInterface:(id)a3
{
  int64_t result = (int64_t)[a3 type];
  return result;
}

+ (id)getInterfaceName:(int64_t)a3
{
  else {
    return off_147D8[a3 - 1];
  }
}

+ (int64_t)protocolTypeFromPath:(id)a3 endpoint:(id)a4
{
  CFTypeRef v5 = (nw_path *)a3;
  uint64_t v6 = (nw_endpoint *)a4;
  if (nw_path_has_ipv6(v5))
  {
    BOOL v7 = !nw_path_has_ipv4(v5);
    if (!v6)
    {
LABEL_13:
      if (v7) {
        int64_t v10 = 2LL;
      }
      else {
        int64_t v10 = 1LL;
      }
      goto LABEL_16;
    }
  }

  else
  {
    BOOL v7 = 0;
    if (!v6) {
      goto LABEL_13;
    }
  }

  int sa_family = nw_endpoint_get_address(v6)->sa_family;
  uint64_t v9 = 3LL;
  if (!v7) {
    uint64_t v9 = 1LL;
  }
  if (sa_family != 2) {
    uint64_t v9 = 0LL;
  }
  if (sa_family == 30) {
    int64_t v10 = 2LL;
  }
  else {
    int64_t v10 = v9;
  }
LABEL_16:

  return v10;
}

+ (void)fillOutConnectionInfo:(id)a3 withPath:(id)a4 interface:(id)a5 remoteEndpoint:(id)a6 parameters:(id)a7 outputHandler:(nw_protocol *)a8
{
  id v13 = a3;
  id v14 = a4;
  __int16 v15 = (nw_interface *)a5;
  uint64_t v16 = (nw_endpoint *)a6;
  id v17 = (nw_parameters *)a7;
  __int128 v18 = nw_endpoint_copy_address_string(v16);
  __int128 v19 = nw_endpoint_copy_port_string(v16);
  id v20 = v19;
  if (v18 && v19)
  {
    __int128 v21 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%s@%s", v18, v19);
    [v13 setEdgeAddress:v21];
  }

  else if (!v18)
  {
    goto LABEL_8;
  }

  free(v18);
LABEL_8:
  if (v20) {
    free(v20);
  }
LABEL_10:
  if (v14 && !v15) {
    __int16 v15 = (nw_interface *)nw_path_copy_interface(v14);
  }
  if (v14 && v15)
  {
    objc_msgSend( v13,  "setIPType:",  +[NPUtilities protocolTypeFromPath:endpoint:]( NPUtilities,  "protocolTypeFromPath:endpoint:",  v14,  v16));
    objc_msgSend( v13,  "setInterfaceType:",  +[NPUtilities interfaceTypeOfInterface:](NPUtilities, "interfaceTypeOfInterface:", v15));
LABEL_17:
    __int128 v22 = +[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", nw_interface_get_name(v15));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    [v13 setInterfaceName:v23];

    goto LABEL_18;
  }

  if (v15) {
    goto LABEL_17;
  }
LABEL_18:
  if (a8)
  {
    __int128 v24 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)a8->var2 + 28);
    if (v24)
    {
      uint64_t v83 = 0LL;
      if (v17)
      {
        v75 = a8;
        if (nw_parameters_get_multipath_service(v17))
        {
          uint64_t v25 = (*((uint64_t (**)(nw_protocol *, uint64_t, uint64_t *))a8->var2 + 28))(a8, 3LL, &v83);
          v26 = 0LL;
          LOBYTE(v27) = 0;
          uint64_t v28 = v83;
          unint64_t v29 = 0xFFFFFFFFLL;
          if (v25 && v83 == 24)
          {
            v30 = (void *)v25;
            v74 = v16;
            unint64_t v31 = *(unsigned int *)(v25 + 16);
            v32 = "counter";
            uint64_t v82 = v25;
            v81 = v17;
            if ((_DWORD)v31)
            {
              unint64_t v33 = 0LL;
              v26 = 0LL;
              LOBYTE(v76) = 0;
              unint64_t v29 = 0xFFFFFFFFLL;
              v78 = v15;
              id v79 = v14;
              do
              {
                uint64_t v34 = *(void *)(v30[1] + 8 * v33);
                if (v34)
                {
                  v35 = *(unsigned int **)(v34 + 32);
                  if (v35[15])
                  {
                    v36 = v26;
                    unint64_t v37 = v29;
                    v38 = (nw_interface *)nw_interface_create_with_index();
                    v39 = v38;
                    if (v38)
                    {
                      v40 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  nw_interface_get_name(v38));
                      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                      if (v41)
                      {
                        v42 = v32;
                        if (!v26) {
                          v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                        }
                        v43 = -[NSData initWithBytes:length:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBytes:length:",  v35,  408LL);
                        v36 = v26;
                        -[NSMutableDictionary setObject:forKeyedSubscript:]( v26,  "setObject:forKeyedSubscript:",  v43,  v41);

                        uint64_t v44 = v35[6];
                        if ((_DWORD)v44)
                        {
                          LODWORD(v45) = v35[7];
                          uint64_t v45 = v44 >= v45 ? v45 : 0LL;
                          unint64_t v46 = v44 - v45;
                          if (v46 < v37) {
                            unint64_t v37 = v46;
                          }
                        }

                        v32 = v42;
                        if ((v76 & 1) == 0) {
                          int v76 = (v35[61] >> 4) & 1;
                        }
                      }

                      else
                      {
                        id v49 = nplog_obj();
                        v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
                        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v85 = v39;
                          _os_log_error_impl( &dword_0,  v50,  OS_LOG_TYPE_ERROR,  "Failed to get the interface name from %@",  buf,  0xCu);
                        }
                      }
                    }

                    else
                    {
                      id v47 = nplog_obj();
                      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                      {
                        unsigned int v48 = v35[15];
                        *(_DWORD *)buf = 67109120;
                        LODWORD(v85) = v48;
                        _os_log_error_impl( &dword_0,  v41,  OS_LOG_TYPE_ERROR,  "Failed to create an nw_interface object with interface index %d",  buf,  8u);
                      }
                    }

                    v30 = (void *)v82;
                    unint64_t v31 = *(unsigned int *)(v82 + 16);
                    unint64_t v29 = v37;
                    id v17 = v81;
                    v26 = v36;
                    __int16 v15 = v78;
                    id v14 = v79;
                  }
                }

                ++v33;
              }

              while (v33 < v31);
            }

            else
            {
              LOBYTE(v76) = 0;
              v26 = 0LL;
              unint64_t v29 = 0xFFFFFFFFLL;
            }

            if (*(_DWORD *)(*v30 + 28LL) == 2)
            {
              uint64_t v53 = 0LL;
              v80 = 0LL;
              v54 = *(unsigned int **)(*v30 + 32LL);
              int v73 = *((void *)v32 + 507);
              unint64_t v77 = v29;
              do
              {
                if (LOWORD(v54[v53 + 10]))
                {
                  v55 = (nw_interface *)nw_interface_create_with_index();
                  v56 = v55;
                  if (v55)
                  {
                    v57 = +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  nw_interface_get_name(v55));
                    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
                    if (v58)
                    {
                      v59 = v80;
                      if (!v80) {
                        v59 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
                      }
                      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedShort:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedShort:",  HIWORD(v54[v53 + 10])));
                      v80 = v59;
                      -[NSMutableDictionary setObject:forKeyedSubscript:](v59, "setObject:forKeyedSubscript:", v60, v58);
                    }

                    else
                    {
                      id v63 = nplog_obj();
                      v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v63);
                      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v85 = v56;
                        _os_log_error_impl( &dword_0,  v60,  OS_LOG_TYPE_ERROR,  "Failed to get the interface name from %@",  buf,  0xCu);
                      }
                    }

                    unint64_t v29 = v77;
                  }

                  else
                  {
                    id v61 = nplog_obj();
                    v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v61);
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
                    {
                      int v62 = LOWORD(v54[v53 + 10]);
                      *(_DWORD *)buf = v73;
                      LODWORD(v85) = v62;
                      _os_log_error_impl( &dword_0,  v58,  OS_LOG_TYPE_ERROR,  "Failed to create an nw_interface object with interface index %d",  buf,  8u);
                    }
                  }
                }

                v53 += 18LL;
              }

              while (v53 != 72);
              [v13 setMultipathSubflowSwitchCounts:v80];
              [v13 setMultipathSubflowCount:*v54];
              [v13 setMultipathConnectedSubflowCount:*v54];

              id v17 = v81;
            }

            if (v15) {
              [v13 setMultipathPrimarySubflowInterfaceIndex:nw_interface_get_index(v15)];
            }
            [v13 setIsMultipath:1];
            freemptcpinfo(v82);
            uint64_t v28 = v83;
            uint64_t v16 = v74;
            LOBYTE(v27) = v76;
          }

          if (v28) {
            goto LABEL_87;
          }
        }

        else
        {
          v26 = 0LL;
          LOBYTE(v27) = 0;
          unint64_t v29 = 0xFFFFFFFFLL;
        }

        v52 = v75;
        __int128 v24 = (uint64_t (*)(nw_protocol *, uint64_t, uint64_t *))*((void *)v75->var2 + 28);
      }

      else
      {
        v52 = a8;
        v26 = 0LL;
        LOBYTE(v27) = 0;
        unint64_t v29 = 0xFFFFFFFFLL;
      }

      uint64_t v64 = v24(v52, 1LL, &v83);
      v65 = (unsigned int *)v64;
      if (v64 && v83 == 408)
      {
        v66 = (void *)objc_claimAutoreleasedReturnValue([v13 interfaceName]);

        if (v66)
        {
          if (!v26) {
            v26 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
          }
          v67 = objc_alloc(&OBJC_CLASS___NSData);
          v68 = -[NSData initWithBytesNoCopy:length:](v67, "initWithBytesNoCopy:length:", v65, v83);
          v69 = (void *)objc_claimAutoreleasedReturnValue([v13 interfaceName]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v26, "setObject:forKeyedSubscript:", v68, v69);

          uint64_t v70 = v65[6];
          if ((_DWORD)v70)
          {
            LODWORD(v71) = v65[7];
            else {
              uint64_t v71 = 0LL;
            }
            unint64_t v72 = v70 - v71;
            if (v72 < v29) {
              unint64_t v29 = v72;
            }
          }

          int v27 = (v65[61] >> 4) & 1;
          goto LABEL_87;
        }
      }

      else if (!v64)
      {
LABEL_87:
        uint64_t v51 = v27 & 1;
        goto LABEL_88;
      }

      free(v65);
      goto LABEL_87;
    }
  }

  uint64_t v51 = 0LL;
  v26 = 0LL;
  unint64_t v29 = 0xFFFFFFFFLL;
LABEL_88:
  [v13 setTCPInfo:v26];
  [v13 setMinimumRTT:v29];
  [v13 setTFOSucceeded:v51];
}

+ (BOOL)hasPacketDrop:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && [v3 state] && objc_msgSend(v4, "state") != (char *)&dword_4 + 1)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "TCPInfo", 0));
    id v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
          uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 TCPInfo]);
          __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v10]);

          if ([v12 length] == &stru_158.flags)
          {
            id v13 = v12;
            if (*(void *)((char *)[v13 bytes] + 84))
            {

              LOBYTE(v5) = 1;
              goto LABEL_17;
            }
          }
        }

        id v5 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

+ (id)stripWhitespace:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && [v3 length]) {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v3,  "stringByReplacingOccurrencesOfString:withString:options:range:",  @"\\s+",  &stru_15690,  1024,  0,  objc_msgSend(v3, "length")));
  }
  else {
    id v5 = 0LL;
  }

  return v5;
}

+ (id)hexDumpBytes:(const void *)a3 length:(unint64_t)a4
{
  uint64_t v4 = 0LL;
  if (a3 && a4)
  {
    BOOL v7 = malloc((2 * a4) | 1);
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0LL;
      unint64_t v10 = 2LL;
      do
      {
        sprintf(&v8[v10 - 2], "%x", *((char *)a3 + v9++));
        if (v9 >= a4) {
          break;
        }
        BOOL v11 = v10 >= 2 * a4 - 1;
        v10 += 2LL;
      }

      while (!v11);
      v8[2 * a4] = 0;
      uint64_t v4 = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  v8,  4LL);
      free(v8);
    }

    else
    {
      uint64_t v4 = 0LL;
    }
  }

  return v4;
}

+ (void)parseXTimeout:(id)a3 hardTTLInSeconds:(double *)a4
{
  id v10 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v10, v5) & 1) != 0)
  {
    [v10 doubleValue];
    double v7 = v6 * 60.0;
    BOOL v8 = v6 <= 0.0;
    double v9 = 92160.0;
    if (!v8) {
      double v9 = v7;
    }
    if (v9 > 151200.0) {
      double v9 = 151200.0;
    }
  }

  else
  {
    double v9 = 92160.0;
  }

  *a4 = v9;
}

+ (id)parseXHost:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && [v3 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@","]);
    double v7 = 0LL;
    if ([v5 count])
    {
      unint64_t v8 = 0LL;
      *(void *)&__int128 v6 = 138412290LL;
      __int128 v15 = v6;
      do
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v15));
        id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NPUtilities endpointFromString:defaultPortString:]( &OBJC_CLASS___NPUtilities,  "endpointFromString:defaultPortString:",  v9,  0LL));

        if (v10)
        {
          if (!v7) {
            double v7 = -[NSMutableArray initWithCapacity:]( [NSMutableArray alloc],  "initWithCapacity:",  [v5 count]);
          }
          -[NSMutableArray addObject:](v7, "addObject:", v10);
        }

        else
        {
          id v11 = nplog_obj();
          __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v8]);
            *(_DWORD *)buf = v15;
            __int128 v17 = v13;
            _os_log_error_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Invalid host specification: %@", buf, 0xCu);
          }
        }

        ++v8;
      }

      while (v8 < (unint64_t)[v5 count]);
    }
  }

  else
  {
    double v7 = 0LL;
  }

  return v7;
}

+ (unint64_t)parseXRTT:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0 && [v3 length])
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 componentsSeparatedByString:@","]);
    if ([v5 count])
    {
      __int128 v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
      else {
        unint64_t v7 = 0LL;
      }
    }

    else
    {
      unint64_t v7 = 0LL;
    }
  }

  else
  {
    unint64_t v7 = 0LL;
  }

  return v7;
}

+ (id)copyBase64HeaderValueFromData:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 base64EncodedStringWithOptions:0]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @":%@:", v3));

  return v4;
}

+ (id)copyCurrentNetworkCharacteristicsForPath:(id)a3
{
  id v3 = a3;
  if ([v3 status] == (char *)&dword_0 + 1)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 interface]);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 interfaceName]);
    if (!v5 || (uint64_t v6 = nwi_state_copy()) == 0)
    {
      double v9 = 0LL;
LABEL_27:

      goto LABEL_28;
    }

    uint64_t v7 = v6;
    uint64_t ifstate = nwi_state_get_ifstate(v6, [v5 UTF8String]);
    double v9 = (void *)ifstate;
    if (ifstate)
    {
      if ((nwi_ifstate_get_flags(ifstate) & 3) != 0)
      {
        id v10 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
        int v23 = 0;
        uint64_t signature = nwi_ifstate_get_signature(v9, 2LL, &v23);
        if (signature) {
          BOOL v12 = v23 <= 0;
        }
        else {
          BOOL v12 = 1;
        }
        int v13 = !v12;
        if (v13 == 1) {
          -[NSMutableData appendBytes:length:](v10, "appendBytes:length:", signature);
        }
        uint64_t v14 = nwi_ifstate_get_signature(v9, 30LL, &v23);
        if (v14 && v23 >= 1)
        {
          __int128 v15 = (const char *)v14;
          if ([v4 type] == (char *)&dword_0 + 2)
          {
            __int128 v16 = (const char *)&unk_17DA0;
            __int128 v17 = v10;
            uint64_t v18 = 20LL;
          }

          else
          {
            uint64_t v18 = v23;
            __int128 v17 = v10;
            __int128 v16 = v15;
          }
        }

        else
        {
          if ((v13 & 1) != 0)
          {
LABEL_25:
            unint64_t v19 = ((unint64_t)nwi_ifstate_get_flags(v9) >> 1) & 1;
            v25[0] = v10;
            v24[0] = @"Signature";
            v24[1] = @"InterfaceType";
            id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v4 type]));
            v25[1] = v20;
            v24[2] = @"HasIPv6";
            __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v19));
            v25[2] = v21;
            double v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v25,  v24,  3LL));

            goto LABEL_26;
          }

          __int128 v16 = "default_signature";
          __int128 v17 = v10;
          uint64_t v18 = 18LL;
        }

        -[NSMutableData appendBytes:length:](v17, "appendBytes:length:", v16, v18);
        goto LABEL_25;
      }

      double v9 = 0LL;
    }

+ (id)connectionInfoToDict:(id)a3 dictionary:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (NSMutableDictionary *)a4;
  uint64_t v7 = v6;
  *(void *)v75 = 0LL;
  uint64_t v76 = 0LL;
  char v77 = 0;
  if (!v5)
  {
    id v10 = 0LL;
    goto LABEL_57;
  }

  if (!v6) {
    uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  }
  unint64_t v8 = (unint64_t)[v5 pathType];
  if (v8 > 5) {
    double v9 = 0LL;
  }
  else {
    double v9 = off_147F8[v8];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"PathType");
  if ([v5 pathType] == (char *)&dword_0 + 2)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 fallbackReason]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v11,  @"FallbackReasonNumber");

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPConnectionInfo getFallbackReasonDescription:]( NSPConnectionInfo,  "getFallbackReasonDescription:",  [v5 fallbackReason]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v12,  @"FallbackReason");

    unint64_t v13 = (unint64_t)[v5 fallbackReasonCategory];
    if (v13 <= 4) {
      double v9 = off_14828[v13];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  @"FallbackCategory");
    uint64_t v14 = objc_alloc(&OBJC_CLASS___NSNumber);
    [v5 fallbackDelay];
    __int128 v15 = -[NSNumber initWithDouble:](v14, "initWithDouble:");
    __int128 v16 = @"FallbackDelay";
    __int128 v17 = v7;
    uint64_t v18 = (__CFString *)v15;
    goto LABEL_12;
  }

  if ([v5 pathType] == (char *)&dword_0 + 1)
  {
    unint64_t v19 = (unint64_t)[v5 edgeType];
    if (v19 <= 3) {
      double v9 = off_14850[v19];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v9, @"EdgeType");
    id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 edgeAddress]);
    if (v20)
    {
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v5 edgeAddress]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v21, @"EdgeAddress");
    }

    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  @"unknown",  @"EdgeAddress");
    }

    __int128 v15 = (NSNumber *)objc_claimAutoreleasedReturnValue([v5 firstTxByteTimeStamp]);
    if (v15)
    {
      __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v5 firstTxByteTimeStamp]);
      int v23 = (void *)objc_claimAutoreleasedReturnValue([v22 description]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v23,  @"tunnelFirstTxByteTimestamp");

      goto LABEL_21;
    }

    uint64_t v18 = @"unknown";
    __int128 v16 = @"tunnelFirstTxByteTimestamp";
    __int128 v17 = v7;
LABEL_12:
    -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", v18, v16);
LABEL_21:
  }

  else {
    __int128 v24 = @"no";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v24, @"IsMultipath");
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 multipathSubflowCount]));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v25, @"SubflowCount");

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v5 multipathConnectedSubflowCount]));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v26,  @"ConnectedSubflowCount");

  else {
    int v27 = @"no";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v27,  @"IsTFOProbeSucceeded");
  if (if_indextoname([v5 multipathPrimarySubflowInterfaceIndex], v75))
  {
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", v75));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v28,  @"PrimarySubflowInterface");
  }

  uint64_t v29 = objc_claimAutoreleasedReturnValue([v5 multipathSubflowSwitchCounts]);
  if (v29)
  {
    v30 = (void *)v29;
    unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue([v5 multipathSubflowSwitchCounts]);
    id v32 = [v31 count];

    if (v32)
    {
      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v5 multipathSubflowSwitchCounts]);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v33,  @"SwitchCounts");
    }
  }

  [v5 connectionDelay];
  if (v34 > 0.0)
  {
    [v5 connectionDelay];
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v35,  @"ConnectionDelay");
  }

  [v5 firstTxByteDelay];
  if (v36 > 0.0)
  {
    [v5 firstTxByteDelay];
    unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v37,  @"FirstTxByteDelay");
  }

  [v5 timeToFirstByte];
  if (v38 > 0.0)
  {
    [v5 timeToFirstByte];
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v39,  @"TimeToFirstByte");
  }

  if ([v5 tunnelConnectionError])
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v5 tunnelConnectionError]));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v40,  @"ConnectionError");
  }

  uint64_t v41 = objc_claimAutoreleasedReturnValue([v5 TCPInfo]);
  if (v41)
  {
    v42 = (void *)v41;
    v43 = (void *)objc_claimAutoreleasedReturnValue([v5 TCPInfo]);
    id v44 = [v43 count];

    if (v44)
    {
      id v63 = v7;
      v66 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v70 = 0u;
      __int128 v71 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue([v5 TCPInfo]);
      id v67 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
      if (v67)
      {
        uint64_t v65 = *(void *)v69;
        do
        {
          for (i = 0LL; i != v67; i = (char *)i + 1)
          {
            if (*(void *)v69 != v65) {
              objc_enumerationMutation(obj);
            }
            uint64_t v46 = *(void *)(*((void *)&v68 + 1) + 8LL * (void)i);
            id v47 = v5;
            unsigned int v48 = (void *)objc_claimAutoreleasedReturnValue([v5 TCPInfo]);
            id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 objectForKeyedSubscript:v46]);

            id v50 = v49;
            uint64_t v51 = (char *)[v50 bytes];
            v72[0] = @"TxBytes";
            v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v51 + 76)));
            v73[0] = v52;
            v72[1] = @"TxPackets";
            uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v51 + 68)));
            v73[1] = v53;
            v72[2] = @"RxBytes";
            v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v51 + 108)));
            v73[2] = v54;
            v72[3] = @"RxPackets";
            v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v51 + 100)));
            v73[3] = v55;
            v72[4] = @"Resend";
            v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  *(void *)(v51 + 284)));
            v73[4] = v56;
            v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  5LL));

            -[NSMutableDictionary setObject:forKeyedSubscript:](v66, "setObject:forKeyedSubscript:", v57, v46);
            id v5 = v47;
          }

          id v67 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
        }

        while (v67);
      }

      uint64_t v7 = v63;
      -[NSMutableDictionary setObject:forKeyedSubscript:](v63, "setObject:forKeyedSubscript:", v66, @"TCPMetrics");
    }
  }

  [v5 timeIntervalSinceLastUsage];
  if (v58 > 0.0)
  {
    [v5 timeIntervalSinceLastUsage];
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v59,  @"TimeSinceLastUsage");
  }

  else {
    v60 = @"no";
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v60, @"TFOSucceeded");
  id v61 = (void *)objc_claimAutoreleasedReturnValue([v5 timingIntervals]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v61, @"TimingIntervals");

  uint64_t v7 = v7;
  id v10 = v7;
LABEL_57:

  return v10;
}

+ (BOOL)printDictionaryAsJson:(id)a3 debugName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", v5))
  {
    printf("%s are not a valid JSON object\n", (const char *)[v6 UTF8String]);
LABEL_6:
    BOOL v10 = 0;
    goto LABEL_7;
  }

  id v14 = 0LL;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v5,  1LL,  &v14));
  id v8 = v14;
  if (!v7)
  {
    id v11 = (const char *)[v6 UTF8String];
    id v12 = objc_claimAutoreleasedReturnValue([v8 description]);
    printf("Failed to create JSON data from the %s: %s\n", v11, (const char *)[v12 UTF8String]);

    goto LABEL_6;
  }

  double v9 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v7, 4LL);
  puts(-[NSString UTF8String](v9, "UTF8String"));

  BOOL v10 = 1;
LABEL_7:

  return v10;
}

+ (id)endpointFromString:(id)a3 defaultPortString:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NPUtilities stripWhitespace:](&OBJC_CLASS___NPUtilities, "stripWhitespace:", a3));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"@"]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 componentsSeparatedByString:@"."]);
  if ((unint64_t)[v8 count] >= 3)
  {
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0LL; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          if ([*(id *)(*((void *)&v24 + 1) + 8 * (void)i) isEqualToString:@"_tcp"])
          {
            int v23 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:0]);
            __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", (char *)objc_msgSend(v9, "count") - 1));
            uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
            if ((char *)[v9 count] - 4 > (char *)0xFFFFFFFFFFFFFFFCLL)
            {
              __int128 v21 = v18;
            }

            else
            {
              unint64_t v19 = (_BYTE *)(&dword_0 + 2);
              do
              {
                id v20 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:v19]);
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v18 stringByAppendingFormat:@".%@", v20]);

                ++v19;
                uint64_t v18 = v21;
              }

              while (v19 < (char *)[v9 count] - 1);
            }

            __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NWBonjourServiceEndpoint endpointWithName:type:domain:]( &OBJC_CLASS___NWBonjourServiceEndpoint,  "endpointWithName:type:domain:",  v23,  v21,  v17));

            goto LABEL_22;
          }
        }

        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }

  if ((unint64_t)[v7 count] < 2)
  {
    if (v5) {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NWHostEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWHostEndpoint,  "endpointWithHostname:port:",  v6,  v5));
    }
    else {
      __int128 v16 = 0LL;
    }
  }

  else
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:0]);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndexedSubscript:1]);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NWHostEndpoint endpointWithHostname:port:]( &OBJC_CLASS___NWHostEndpoint,  "endpointWithHostname:port:",  v14,  v15));
  }

+ (BOOL)compareAddressEndpoints:(id)a3 endpoint2:(id)a4 addressOnly:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_class(&OBJC_CLASS___NWAddressEndpoint);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0)
  {
    uint64_t v10 = objc_opt_class(&OBJC_CLASS___NWAddressEndpoint);
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
    {
      id v11 = v8;
      uint64_t v12 = (unsigned __int8 *)[v7 address];
      unint64_t v13 = (unsigned __int8 *)[v11 address];
      int v14 = v12[1];
      if (v14 == v13[1])
      {
        if (v14 == 30)
        {
          if (*v12 >= 0x1Cu
            && *v13 >= 0x1Cu
            && (a5 || *((unsigned __int16 *)v12 + 1) == *((unsigned __int16 *)v13 + 1)))
          {
            BOOL v15 = *((void *)v12 + 1) == *((void *)v13 + 1) && *((void *)v12 + 2) == *((void *)v13 + 2);
            goto LABEL_22;
          }
        }

        else if (v14 == 2 {
               && *v12 >= 0x10u
        }
               && *v13 >= 0x10u
               && (a5 || *((unsigned __int16 *)v12 + 1) == *((unsigned __int16 *)v13 + 1)))
        {
          BOOL v15 = *((_DWORD *)v12 + 1) == *((_DWORD *)v13 + 1);
LABEL_22:
          BOOL v16 = v15;
          goto LABEL_17;
        }
      }

      BOOL v16 = 0;
LABEL_17:

      goto LABEL_18;
    }
  }

  BOOL v16 = 0;
LABEL_18:

  return v16;
}

+ (id)getInterfaceTypeString:(int64_t)a3
{
  else {
    return off_14870[a3 - 1];
  }
}

+ (BOOL)rollDiceWithSuccessRatio:(id)a3
{
  id v3 = a3;
  unsigned int bytes = 0;
  if (SecRandomCopyBytes(kSecRandomDefault, 4uLL, &bytes) < 0)
  {
    id v9 = nplog_obj();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_BBF4(v10, v11, v12, v13, v14, v15, v16, v17);
    }

    BOOL v8 = 0;
  }

  else
  {
    double v4 = (double)(bytes % 0x2710) / 10000.0;
    id v5 = nplog_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_BC28(v6, v4);
    }

    [v3 doubleValue];
    BOOL v8 = v4 < v7;
  }

  return v8;
}

+ (id)timestampIdentifierToName:(unint64_t)a3
{
  if (a3 - 1 > 0xE) {
    return @"EnableNSP";
  }
  else {
    return off_14888[a3 - 1];
  }
}

+ (id)getHashForObject:(id)a3
{
  return +[NEHasher hashObject:withClassPrefixWhitelist:]( &OBJC_CLASS___NEHasher,  "hashObject:withClassPrefixWhitelist:",  a3,  &off_17DD0);
}

+ (id)copyDataHexString:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    double v4 = v13;
    memset(v13, 0, sizeof(v13));
    id v5 = v3;
    id v6 = (unsigned __int8 *)[v5 bytes];
    char v12 = 60;
    if ([v5 length])
    {
      uint64_t v7 = 0LL;
      do
      {
        snprintf(v4, 3uLL, "%02x", v6[v7]);
        BOOL v8 = v4 + 2;
        uint64_t v9 = v4 + 2 - &v12;
        if (v7 && (v7 & 3) == 0 && v9 <= 254)
        {
          v4[2] = 32;
          BOOL v8 = v4 + 3;
          uint64_t v9 = v4 + 3 - &v12;
        }

        double v4 = v8;
      }

      while (v9 < 254);
      if (v9 > 254) {
        goto LABEL_15;
      }
    }

    else
    {
      BOOL v8 = v13;
    }

    *v8++ = 62;
LABEL_15:
    *BOOL v8 = 0;
    uint64_t v10 = -[NSString initWithUTF8String:](objc_alloc(&OBJC_CLASS___NSString), "initWithUTF8String:", &v12);
    goto LABEL_16;
  }

  uint64_t v10 = &stru_15690;
LABEL_16:

  return v10;
}

+ (id)copyNetworkDescription:(id)a3
{
  id v3 = a3;
  double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"InterfaceType"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Signature"]);

  id v6 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NPUtilities getInterfaceTypeString:]( NPUtilities,  "getInterfaceTypeString:",  (int)[v4 intValue]));
  id v8 = +[NPUtilities copyDataHexString:](&OBJC_CLASS___NPUtilities, "copyDataHexString:", v5);
  uint64_t v9 = -[NSString initWithFormat:](v6, "initWithFormat:", @"(%@): %@", v7, v8);

  return v9;
}

+ (int64_t)certificateDateIsValid:(__SecCertificate *)a3
{
  if (a3)
  {
    double v4 = SecCertificateNotValidBefore(a3, a2);
    CFAbsoluteTime v5 = v4;
    if (v4 == 0.0) {
      id v6 = 0LL;
    }
    else {
      id v6 = CFDateCreate(kCFAllocatorDefault, v4);
    }
    double v8 = SecCertificateNotValidAfter(a3);
    CFAbsoluteTime v9 = v8;
    if (v8 == 0.0) {
      uint64_t v10 = 0LL;
    }
    else {
      uint64_t v10 = CFDateCreate(kCFAllocatorDefault, v8);
    }
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current == 0.0)
    {
      uint64_t v13 = 0LL;
      int64_t v7 = 4LL;
    }

    else
    {
      char v12 = CFDateCreate(0LL, Current);
      uint64_t v13 = v12;
      int64_t v7 = 4LL;
      if (v6 && v12)
      {
        if (CFDateCompare(v12, v6, 0LL) == kCFCompareLessThan)
        {
          id v16 = nplog_obj();
          uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            int64_t v7 = 2LL;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Current time before valid time", buf, 2u);
          }

          else
          {
            int64_t v7 = 2LL;
          }

+ (void)postNotification:(id)a3 value:(unint64_t)a4
{
  id v5 = a3;
  id v6 = NPGetInternalQueue();
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v6);
  dispatch_assert_queue_V2(v7);

  int out_token = -1;
  if (!notify_register_check((const char *)[v5 UTF8String], &out_token))
  {
    if (notify_get_state(out_token, &v8) || v8 != a4)
    {
      uint64_t v8 = a4;
      if (!notify_set_state(out_token, a4)) {
        notify_post((const char *)[v5 UTF8String]);
      }
    }

    notify_cancel(out_token);
  }
}

+ (id)copyTrueClientIPAddressFromPreferences
{
  CFPropertyListRef v2 = CFPreferencesCopyAppValue(@"NSPTrueClientIPAddress", kCFPreferencesCurrentApplication);
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (v3 && (uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
  {
    id v5 = nplog_obj();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      uint64_t v10 = v3;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "Detected true client ip address in preferences file: %{public}@",  (uint8_t *)&v9,  0xCu);
    }

    id v7 = v3;
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

+ (id)stringFromLinkQualityValue:(int)a3
{
  id v3 = @"Invalid";
  uint64_t v4 = @"Minimally Viable";
  id v5 = @"Poor";
  id v6 = @"Good";
  if (a3 != 100) {
    id v6 = @"Invalid";
  }
  if (a3 != 50) {
    id v5 = v6;
  }
  if (a3 != 20) {
    uint64_t v4 = v5;
  }
  if (a3 == 10) {
    id v3 = @"Bad";
  }
  if (a3 == -1) {
    id v3 = @"Unknown";
  }
  if (a3 == -2) {
    id v3 = @"Off";
  }
  if (a3 <= 19) {
    id v7 = v3;
  }
  else {
    id v7 = v4;
  }
  return  -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@ (%d)",  v7,  *(void *)&a3);
}

+ (id)machoUUIDFromPID:(int)a3
{
  uint64_t v8 = 0LL;
  memset(v7, 0, sizeof(v7));
  id v3 = 0LL;
  if (proc_pidinfo(a3, 17, 1uLL, v7, 56) == 56) {
    id v3 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", v7);
  }
  id v4 = nplog_obj();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_BCD0();
  }

  return v3;
}

+ (int)pidFromAuditToken:(id *)a3
{
  return a3->var0[5];
}

+ (id)createMaskedIPv4Address:(id)a3 prefix:(unint64_t)a4
{
  if (!a3)
  {
    id v11 = 0LL;
    id v12 = nplog_obj();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_BD30(v8, v13, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_6;
  }

  id v6 = a3;
  id v7 = sub_73F0((uint64_t)&OBJC_CLASS___NPUtilities, a4);
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (!v8)
  {
LABEL_6:
    uint64_t v10 = 0LL;
    goto LABEL_7;
  }

  uint64_t v21 = 0LL;
  inet_pton(2, (const char *)[v6 UTF8String], (char *)&v21 + 4);
  inet_pton(2, (const char *)-[os_log_s UTF8String](v8, "UTF8String"), &v21);
  HIDWORD(v21) &= v21;
  id v9 = sub_732C((uint64_t)&OBJC_CLASS___NPUtilities, (char *)&v21 + 4, 4uLL, 2LL);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_7:

  return v10;
}

+ (id)createMaskedIPv6Address:(id)a3 prefix:(unint64_t)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = nplog_obj();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_BDA0(v7, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_6;
  }

  id v6 = sub_7484((uint64_t)&OBJC_CLASS___NPUtilities, a4);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (!v7)
  {
LABEL_6:
    id v9 = 0LL;
    goto LABEL_7;
  }

  int8x16_t v20 = 0uLL;
  int8x16_t v19 = 0uLL;
  inet_pton(30, (const char *)[v5 UTF8String], &v20);
  inet_pton(30, (const char *)-[os_log_s UTF8String](v7, "UTF8String"), &v19);
  int8x16_t v20 = vandq_s8(v19, v20);
  id v8 = sub_732C((uint64_t)&OBJC_CLASS___NPUtilities, &v20, 0x10uLL, 30LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
LABEL_7:

  return v9;
}

@end
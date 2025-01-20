@interface ConnectionInfo
- (BOOL)onCellular;
- (ConnectionInfo)init;
- (NSString)connectionType;
- (void)dealloc;
- (void)reachabilityCallback:(id)a3;
@end

@implementation ConnectionInfo

- (ConnectionInfo)init
{
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___ConnectionInfo;
  v2 = -[ConnectionInfo init](&v30, "init");
  if (v2)
  {
    v3 = SCPreferencesCreate(0LL, @"Ripcord", 0LL);
    if (v3)
    {
      v4 = v3;
      v5 = SCNetworkSetCopyCurrent(v3);
      if (v5)
      {
        v6 = v5;
        v7 = SCNetworkSetCopyServices(v5);
        if (v7)
        {
          v8 = v7;
          CFIndex Count = CFArrayGetCount(v7);
          if (Count < 1)
          {
            LOBYTE(v10) = 0;
          }

          else
          {
            BOOL v10 = 0;
            unint64_t v11 = Count + 1;
            do
            {
              ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v8, v11 - 2);
              Interface = SCNetworkServiceGetInterface(ValueAtIndex);
              if (Interface)
              {
                v14 = Interface;
                CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
                if (InterfaceType)
                {
                  if (CFEqual(InterfaceType, kSCValNetInterfaceTypeEthernet))
                  {
                    BSDName = SCNetworkInterfaceGetBSDName(v14);
                    if (BSDName)
                    {
                      v17 = BSDName;
                      if (!CFStringHasPrefix(BSDName, @"awdl"))
                      {
                        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity( 0LL,  kSCDynamicStoreDomainState,  v17,  kSCEntNetLink);
                        if (NetworkInterfaceEntity)
                        {
                          v19 = NetworkInterfaceEntity;
                          v20 = SCDynamicStoreCreate(0LL, @"AggD", 0LL, 0LL);
                          if (v20)
                          {
                            v21 = v20;
                            BOOL v29 = v10;
                            v22 = (const __CFDictionary *)SCDynamicStoreCopyValue(v20, v19);
                            if (v22)
                            {
                              v23 = v22;
                              value = 0LL;
                              if (CFDictionaryGetValueIfPresent(v22, kSCPropNetLinkActive, (const void **)&value))
                              {
                                int v28 = CFBooleanGetValue((CFBooleanRef)value);
                                BOOL v29 = v28 != 0;
                                if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
                                {
                                  *(_DWORD *)buf = 138412546;
                                  v24 = "not used";
                                  if (v28) {
                                    v24 = "active";
                                  }
                                  v33 = v17;
                                  __int16 v34 = 2080;
                                  v35 = v24;
                                  _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEBUG,  "Interface %@ is %s",  buf,  0x16u);
                                }
                              }

                              CFRelease(v23);
                            }

                            CFRelease(v21);
                            BOOL v10 = v29;
                          }

                          CFRelease(v19);
                        }
                      }
                    }
                  }
                }
              }

              --v11;
            }

            while (v11 > 1);
          }

          CFRelease(v8);
        }

        else
        {
          LOBYTE(v10) = 0;
        }

        CFRelease(v6);
        CFRelease(v4);
        if (v10)
        {
          connectionType = v2->_connectionType;
          v26 = @"wired";
          goto LABEL_31;
        }
      }

      else
      {
        CFRelease(v4);
      }
    }

    connectionType = v2->_connectionType;
    v26 = @"wifi";
LABEL_31:
    v2->_connectionType = &v26->isa;
  }

  return v2;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___ConnectionInfo;
  -[ConnectionInfo dealloc](&v2, "dealloc");
}

- (BOOL)onCellular
{
  return -[NSString isEqualToString:](self->_connectionType, "isEqualToString:", @"cellular");
}

- (void)reachabilityCallback:(id)a3
{
}

- (NSString)connectionType
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
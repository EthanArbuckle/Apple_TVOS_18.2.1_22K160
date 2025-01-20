@interface NEIKEv2InformationalPacket
+ (id)copyTypeDescription;
+ (id)createDeleteResponse:(void *)a3 child:;
+ (id)createInformationalResponse:(void *)a3 ikeSA:;
+ (unint64_t)exchangeType;
- (uint64_t)isDeleteChild;
- (uint64_t)isDeleteIKE;
- (uint64_t)isMOBIKE;
- (uint64_t)validateDeleteChild:(uint64_t)a1;
- (uint64_t)validateUpdateAddresses:(void *)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2InformationalPacket

+ (id)createDeleteResponse:(void *)a3 child:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  if (v5)
  {
    v6 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket), v4);
    if (v6)
    {
      v7 = objc_alloc_init(&OBJC_CLASS___NEIKEv2DeletePayload);
      v8 = v7;
      if (v7) {
        v7->_protocol = 3LL;
      }
      id v17 = v5;
      [MEMORY[0x189603F18] arrayWithObjects:&v17 count:1];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8) {
        objc_setProperty_atomic(v8, v9, v10, 32LL);
      }

      if ((-[NEIKEv2Payload isValid]((uint64_t)v8) & 1) != 0)
      {
        v16 = v8;
        [MEMORY[0x189603F18] arrayWithObjects:&v16 count:1];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(v6, v12, v11, 88LL);

        id v13 = v6;
LABEL_12:

        goto LABEL_13;
      }

      ne_log_obj();
      v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
        _os_log_fault_impl(&dword_1876B1000, v15, OS_LOG_TYPE_FAULT, "%s called with null delete.isValid", buf, 0xCu);
      }
    }

    else
    {
      ne_log_obj();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl( &dword_1876B1000,  (os_log_t)v8,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
      }
    }

    id v13 = 0LL;
    goto LABEL_12;
  }

  ne_log_obj();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "+[NEIKEv2InformationalPacket(Exchange) createDeleteResponse:child:]";
    _os_log_fault_impl(&dword_1876B1000, (os_log_t)v6, OS_LOG_TYPE_FAULT, "%s called with null childSPI", buf, 0xCu);
  }

  id v13 = 0LL;
LABEL_13:

  return v13;
}

- (uint64_t)validateDeleteChild:(uint64_t)a1
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v5 = v3;
  if (a1)
  {
    if (v3)
    {
      __int128 v18 = 0u;
      __int128 v19 = 0u;
      __int128 v16 = 0u;
      __int128 v17 = 0u;
      objc_getProperty((id)a1, v4, 88LL, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7)
      {
        uint64_t v9 = v7;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0LL; i != v9; ++i)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v6);
            }
            SEL v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (v12)
            {
              if (v12[3] == 3LL)
              {
                id v13 = objc_getProperty(v12, v8, 32LL, 1);
                int v14 = objc_msgSend(v13, "containsObject:", v5, (void)v16);

                if (v14)
                {

                  a1 = 1LL;
                  goto LABEL_16;
                }
              }
            }
          }

          uint64_t v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      a1 = 0LL;
    }

    else
    {
      a1 = -[NEIKEv2InformationalPacket isDeleteChild]((void *)a1, v4);
    }
  }

+ (id)createInformationalResponse:(void *)a3 ikeSA:
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  objc_opt_self();
  uint64_t v7 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2InformationalPacket), v4);
  if (!v7)
  {
    ne_log_obj();
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v16,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2InformationalPacket alloc] initOutbound:] failed",  buf,  2u);
    }

    goto LABEL_41;
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  if (v4) {
    id Property = objc_getProperty(v4, v6, 64LL, 1);
  }
  else {
    id Property = 0LL;
  }
  id v9 = Property;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v44;
    do
    {
      for (uint64_t i = 0LL; i != v11; ++i)
      {
        if (*(void *)v44 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        if (v15) {
          uint64_t v15 = *(void *)(v15 + 24);
        }
        v12 |= (v15 & 0xFFFE) == 16388;
      }

      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }

    while (v11);
  }

  else
  {
    char v12 = 0;
  }

  if (v5 && (v5[18] & 1) != 0 && -[NEIKEv2Packet hasNotification:](v4, (const char *)0xA08D))
  {
    ne_log_obj();
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v42 = (void *)objc_msgSend(v4, "copyShortDescription", (void)v43);
      *(_DWORD *)buf = 138412290;
      v48 = v42;
      _os_log_debug_impl( &dword_1876B1000,  v18,  OS_LOG_TYPE_DEBUG,  "%@ received sending notify payload request",  buf,  0xCu);
    }

    id v20 = objc_getProperty(v5, v19, 88LL, 1);
    [v20 IMEI];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 dataUsingEncoding:4];
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v22 = +[NEIKEv2NotifyPayload createNotifyPayloadType:data:]( (uint64_t)&OBJC_CLASS___NEIKEv2NotifyPayload,  0xA08DuLL,  v16);
      BOOL v23 = -[NEIKEv2Packet addNotifyPayload:](v7, v22);

      if (!v23)
      {
        ne_log_obj();
        v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v39 = "[packet addNotifyPayload:notifyPayload] failed";
          goto LABEL_44;
        }

- (uint64_t)validateUpdateAddresses:(void *)a1
{
  uint64_t v62 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  id v5 = v3;
  if (!a1)
  {
    uint64_t v36 = 0LL;
    goto LABEL_39;
  }

  if (!v3)
  {
    ne_log_obj();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v58 = "-[NEIKEv2InformationalPacket(Exchange) validateUpdateAddresses:]";
      _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "%s called with null ikeSA", buf, 0xCu);
    }

- (void)gatherPayloads
{
  id newValue = objc_alloc_init(MEMORY[0x189603FA8]);
  if (self)
  {
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v3, 64, 1));
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v4, 88, 1));
    if (objc_getProperty(self, v5, 96LL, 1)) {
      objc_msgSend(newValue, "addObject:", objc_getProperty(self, v6, 96, 1));
    }
    objc_msgSend(newValue, "addObjectsFromArray:", objc_getProperty(self, v6, 56, 1));
    objc_setProperty_atomic(self, v7, newValue, 80LL);
  }

  else
  {
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
    [newValue addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v29 = *MEMORY[0x1895F89C0];
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  if (self) {
    self = (NEIKEv2InformationalPacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  id v3 = self;
  uint64_t v4 = -[NEIKEv2InformationalPacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v21,  v28,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v10, 64LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v11, 64, 1), "arrayByAddingObject:", v8);
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_24;
            }

            id v27 = v8;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v27, 1, (void)v21);
            uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2)
            {
LABEL_24:
              __int128 v18 = v2;
              SEL v19 = v13;
              ptrdiff_t v20 = 64LL;
              goto LABEL_29;
            }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"INFORMATIONAL";
}

+ (unint64_t)exchangeType
{
  return 37LL;
}

- (uint64_t)isDeleteIKE
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 88LL, 1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && *(void *)(v6 + 24) == 1LL)
        {
          uint64_t v3 = 1LL;
          goto LABEL_12;
        }
      }

      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (uint64_t)isMOBIKE
{
  if ((-[NEIKEv2Packet hasNotification:](a1, (const char *)0x4011) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400F) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400D) & 1) != 0
    || (-[NEIKEv2Packet hasNotification:](a1, (const char *)0x400E) & 1) != 0)
  {
    return 1LL;
  }

  else
  {
    return -[NEIKEv2Packet hasNotification:](a1, (const char *)0x4010);
  }

- (uint64_t)isDeleteChild
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  id v2 = objc_getProperty(a1, a2, 88LL, 1);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0LL; i != v3; ++i)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && *(void *)(v6 + 24) == 3LL)
        {
          uint64_t v3 = 1LL;
          goto LABEL_12;
        }
      }

      uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

@end
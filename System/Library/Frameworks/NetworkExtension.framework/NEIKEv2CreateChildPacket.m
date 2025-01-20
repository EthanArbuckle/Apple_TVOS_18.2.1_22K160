@interface NEIKEv2CreateChildPacket
+ (id)copyTypeDescription;
+ (id)createChildSAResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:;
+ (os_log_s)createRekeyRequestChildSA:(uint64_t)a1;
+ (unint64_t)exchangeType;
- (BOOL)isRekeyIKE;
- (uint64_t)validateRekeyResponseChildSA:(uint64_t)a1;
- (void)filloutPayloads;
- (void)gatherPayloads;
@end

@implementation NEIKEv2CreateChildPacket

+ (os_log_s)createRekeyRequestChildSA:(uint64_t)a1
{
  uint64_t v92 = *MEMORY[0x1895F89C0];
  v2 = a2;
  objc_opt_self();
  if (!v2)
  {
    ne_log_obj();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      goto LABEL_34;
    }
    int v90 = 136315138;
    v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
    v87 = "%s called with null childSA";
    goto LABEL_49;
  }

  id v4 = objc_getProperty(v2, v3, 176LL, 1);

  if (v4)
  {
    v6 = -[NEIKEv2Packet initOutbound](objc_alloc(&OBJC_CLASS___NEIKEv2CreateChildPacket));
    if (!v6)
    {
      ne_log_obj();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v90) = 0;
        _os_log_fault_impl( &dword_1876B1000,  v13,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2CreateChildPacket alloc] initOutbound:] failed",  (uint8_t *)&v90,  2u);
      }

      goto LABEL_57;
    }

    id Property = objc_getProperty(v2, v5, 56LL, 1);
    v9 = Property;
    if (Property) {
      id Property = objc_getProperty(Property, v8, 80LL, 1);
    }
    id v10 = Property;
    objc_opt_self();
    if (v10)
    {
      v11 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NotifyPayload);
      v13 = (os_log_s *)v11;
      if (v11)
      {
        v11->_notifyType = 16393LL;
        objc_setProperty_atomic(v11, v12, v10, 40LL);
      }
    }

    else
    {
      ne_log_obj();
      v89 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_FAULT))
      {
        int v90 = 136315138;
        v91 = "+[NEIKEv2NotifyPayload createNotifyPayloadType:spi:]";
        _os_log_fault_impl(&dword_1876B1000, v89, OS_LOG_TYPE_FAULT, "%s called with null spi", (uint8_t *)&v90, 0xCu);
      }

      v13 = 0LL;
    }

    if (-[NEIKEv2Packet addNotifyPayload:](v6, v13))
    {
      id v15 = objc_getProperty(v2, v14, 48LL, 1);
      uint64_t v16 = [v15 mode];

      if (v16 != 1 || -[NEIKEv2Packet addNotification:data:](v6, 0x4007uLL, 0LL))
      {
        v17 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ChildSAPayload);
        objc_setProperty_atomic(v6, v18, v17, 96LL);

        id v20 = objc_getProperty(v2, v19, 176LL, 1);
        objc_getProperty(v6, v21, 96LL, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v22;
        if (v22) {
          objc_setProperty_atomic(v22, v23, v20, 24LL);
        }

        v27 = objc_alloc_init(&OBJC_CLASS___NEIKEv2KeyExchangePayload);
        objc_setProperty_atomic(v6, v28, v27, 104LL);
        v30 = -[NEIKEv2ChildSA preferredKEMProtocol](v2, v29);
        objc_getProperty(v6, v31, 104LL, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v32;
        if (v32) {
          objc_setProperty_atomic(v32, v33, v30, 24LL);
        }

        id v36 = objc_getProperty(v2, v35, 112LL, 1);
        v37 = v36;
        if (v36) {
          v38 = (void *)*((void *)v36 + 2);
        }
        else {
          v38 = 0LL;
        }
        id v39 = v38;
        objc_getProperty(v6, v40, 104LL, 1);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v41;
        if (v41) {
          objc_setProperty_atomic(v41, v42, v39, 32LL);
        }

        objc_getProperty(v6, v44, 104LL, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        char v46 = -[NEIKEv2Payload isValid]((uint64_t)v45);

        if ((v46 & 1) == 0)
        {
          ne_log_obj();
          v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
            goto LABEL_56;
          }
          int v90 = 136315138;
          v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
          v84 = "%s called with null packet.ke.isValid";
        }

        else
        {
LABEL_22:
          objc_getProperty(v6, v26, 96LL, 1);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          char v48 = -[NEIKEv2Payload isValid]((uint64_t)v47);

          if ((v48 & 1) != 0)
          {
            v49 = objc_alloc_init(&OBJC_CLASS___NEIKEv2NoncePayload);
            objc_setProperty_atomic(v6, v50, v49, 112LL);

            objc_getProperty(v2, v51, 80LL, 1);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_getProperty(v6, v53, 112LL, 1);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v54;
            if (v54) {
              objc_setProperty_atomic(v54, v55, v52, 24LL);
            }

            objc_getProperty(v6, v57, 112LL, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            char v59 = -[NEIKEv2Payload isValid]((uint64_t)v58);

            if ((v59 & 1) != 0)
            {
              v60 = objc_alloc_init(&OBJC_CLASS___NEIKEv2InitiatorTrafficSelectorPayload);
              objc_setProperty_atomic(v6, v61, v60, 128LL);
              v63 = -[NEIKEv2ChildSA initiatorTrafficSelectors](v2, v62);
              objc_getProperty(v6, v64, 128LL, 1);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = v65;
              if (v65) {
                objc_setProperty_atomic(v65, v66, v63, 24LL);
              }

              objc_getProperty(v6, v68, 128LL, 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              char v70 = -[NEIKEv2Payload isValid]((uint64_t)v69);

              if ((v70 & 1) != 0)
              {
                v71 = objc_alloc_init(&OBJC_CLASS___NEIKEv2ResponderTrafficSelectorPayload);
                objc_setProperty_atomic(v6, v72, v71, 136LL);
                v74 = -[NEIKEv2ChildSA responderTrafficSelectors](v2, v73);
                objc_getProperty(v6, v75, 136LL, 1);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = v76;
                if (v76) {
                  objc_setProperty_atomic(v76, v77, v74, 24LL);
                }

                objc_getProperty(v6, v79, 136LL, 1);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                char v81 = -[NEIKEv2Payload isValid]((uint64_t)v80);

                if ((v81 & 1) != 0)
                {
                  v82 = v6;
LABEL_58:

                  goto LABEL_59;
                }

                ne_log_obj();
                v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v83, OS_LOG_TYPE_FAULT)) {
                  goto LABEL_56;
                }
                int v90 = 136315138;
                v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
                v84 = "%s called with null packet.tsr.isValid";
                goto LABEL_54;
              }

              ne_log_obj();
              v83 = (os_log_s *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_FAULT))
              {
                int v90 = 136315138;
                v91 = "+[NEIKEv2CreateChildPacket(Exchange) createRekeyRequestChildSA:]";
                v84 = "%s called with null packet.tsi.isValid";
                goto LABEL_54;
              }

- (uint64_t)validateRekeyResponseChildSA:(uint64_t)a1
{
  uint64_t v167 = *MEMORY[0x1895F89C0];
  v3 = a2;
  v5 = v3;
  if (a1)
  {
    if (!v3)
    {
      ne_log_obj();
      v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        v161 = "-[NEIKEv2CreateChildPacket(Exchange) validateRekeyResponseChildSA:]";
        _os_log_fault_impl(&dword_1876B1000, v7, OS_LOG_TYPE_FAULT, "%s called with null childSA", buf, 0xCu);
      }

+ (id)createChildSAResponse:(unint64_t)a3 errorCode:(void *)a4 errorData:
{
  id v6 = a2;
  id v7 = a4;
  objc_opt_self();
  uint64_t v8 = (void *)-[NEIKEv2Packet initResponse:]((uint64_t)objc_alloc(&OBJC_CLASS___NEIKEv2CreateChildPacket), v6);
  if (!v8)
  {
    ne_log_obj();
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl( &dword_1876B1000,  v11,  OS_LOG_TYPE_FAULT,  "[[NEIKEv2CreateChildPacket alloc] initResponse:] failed",  buf,  2u);
    }

    id v9 = 0LL;
    goto LABEL_10;
  }

  id v9 = v8;
  if (!-[NEIKEv2Packet addNotification:data:](v8, a3, v7))
  {
    ne_log_obj();
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v14 = 0;
      _os_log_fault_impl(&dword_1876B1000, v12, OS_LOG_TYPE_FAULT, "[packet addNotification:data:] failed", v14, 2u);
    }

LABEL_10:
    uint64_t v10 = 0LL;
    goto LABEL_11;
  }

  id v9 = v9;
  uint64_t v10 = v9;
LABEL_11:

  return v10;
}

- (void)gatherPayloads
{
  v2 = self;
  if (self) {
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 64LL, 1);
  }
  id v16 = (id)-[NEIKEv2CreateChildPacket mutableCopy](self, "mutableCopy");
  id v3 = objc_alloc_init(MEMORY[0x189603FA8]);
  -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16393LL, v16, v3);
  if (v2)
  {
    if (objc_getProperty(v2, v4, 120LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v5, 120, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16387LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16391LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16394LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16395LL, v16, v3);
    if (objc_getProperty(v2, v6, 88LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v7, 88, 1));
    }
    if (objc_getProperty(v2, v7, 96LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v8, 96, 1));
    }
    if (objc_getProperty(v2, v8, 112LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v9, 112, 1));
    }
    if (objc_getProperty(v2, v9, 104LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v10, 104, 1));
    }
    if (objc_getProperty(v2, v10, 128LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v11, 128, 1));
    }
    if (objc_getProperty(v2, v11, 136LL, 1)) {
      objc_msgSend(v3, "addObject:", objc_getProperty(v2, v12, 136, 1));
    }
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:]((uint64_t)v2, 16386LL, v16, v3);
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v13, 144, 1));
    [v3 addObjectsFromArray:v16];
    objc_msgSend(v3, "addObjectsFromArray:", objc_getProperty(v2, v14, 56, 1));
    objc_setProperty_atomic(v2, v15, v3, 80LL);
  }

  else
  {
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16387LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16391LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16394LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16395LL, v16, v3);
    -[NEIKEv2Packet addNotification:fromArray:toPayloads:](0LL, 16386LL, v16, v3);
    [v3 addObjectsFromArray:0];
    [v3 addObjectsFromArray:v16];
    [v3 addObjectsFromArray:0];
  }
}

- (void)filloutPayloads
{
  v2 = self;
  uint64_t v31 = *MEMORY[0x1895F89C0];
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  if (self) {
    self = (NEIKEv2CreateChildPacket *)objc_getProperty(self, a2, 80LL, 1);
  }
  id v3 = self;
  uint64_t v4 = -[NEIKEv2CreateChildPacket countByEnumeratingWithState:objects:count:]( v3,  "countByEnumeratingWithState:objects:count:",  &v23,  v30,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v24;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 88LL;
LABEL_29:
          objc_setProperty_atomic(v2, v9, v8, v10);
          goto LABEL_30;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 96LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 104LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 112LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 120LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 128LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!v2) {
            goto LABEL_30;
          }
          ptrdiff_t v10 = 136LL;
          goto LABEL_29;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v2 && objc_getProperty(v2, v11, 64LL, 1))
          {
            objc_msgSend(objc_getProperty(v2, v12, 64, 1), "arrayByAddingObject:", v8);
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
            SEL v19 = v2;
            id v20 = v14;
            ptrdiff_t v21 = 64LL;
            goto LABEL_50;
          }

          v29 = v8;
          objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v29, 1, (void)v23);
          SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2) {
            goto LABEL_45;
          }
        }

        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v2 && objc_getProperty(v2, v15, 144LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v16, 144, 1), "arrayByAddingObject:", v8);
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:
              ptrdiff_t v21 = 144LL;
              SEL v19 = v2;
              id v20 = v14;
              goto LABEL_50;
            }

            SEL v28 = v8;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v28, 1, (void)v23);
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2) {
              goto LABEL_47;
            }
          }

          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_30;
            }
            if (v2 && objc_getProperty(v2, v17, 56LL, 1))
            {
              objc_msgSend(objc_getProperty(v2, v18, 56, 1), "arrayByAddingObject:", v8);
              SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_49:
              SEL v19 = v2;
              id v20 = v14;
              ptrdiff_t v21 = 56LL;
LABEL_50:
              objc_setProperty_atomic(v19, v13, v20, v21);
              goto LABEL_51;
            }

            v27 = v8;
            objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", &v27, 1, (void)v23);
            SEL v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v2) {
              goto LABEL_49;
            }
          }
        }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"CREATE_CHILD_SA";
}

+ (unint64_t)exchangeType
{
  return 36LL;
}

- (BOOL)isRekeyIKE
{
  return objc_getProperty(a1, a2, 88LL, 1) != 0LL;
}

@end
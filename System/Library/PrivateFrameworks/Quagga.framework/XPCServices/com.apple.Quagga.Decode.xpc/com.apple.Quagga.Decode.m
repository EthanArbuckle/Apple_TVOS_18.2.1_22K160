void start()
{
  xpc_main((xpc_connection_handler_t)sub_100003994);
}

void sub_100003994(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100003A0C;
  handler[3] = &unk_100004128;
  id v3 = a1;
  v1 = (_xpc_connection_s *)v3;
  xpc_connection_set_event_handler(v1, handler);
  xpc_connection_activate(v1);
}

void sub_100003A0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  id v5 = v3;
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_error)
  {
    v6 = (void *)_CFXPCCreateCFObjectFromXPCMessage(v5);
    if (!v6 || (uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v6, v7) & 1) == 0))
    {
      NSLog(@"Invalid input!");
      xpc_object_t reply = xpc_dictionary_create_reply(v5);
      v18 = 0LL;
      v16 = 0LL;
      v15 = 0LL;
LABEL_22:
      xpc_connection_send_message(v4, reply);

      goto LABEL_23;
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"PayloadDecodingOptions"]);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0) {
        [v8 addEntriesFromDictionary:v9];
      }
    }

    [v8 setObject:kCFBooleanTrue forKeyedSubscript:MRCDescriptorPayloadDecodingOptionShouldForceInProcessDecoding];
    v11 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"DescriptorAttributes"]);
    if (v11
      && (uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSDictionary), (objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      && (uint64_t v13 = MRCDescriptorCreateWithAttributes(v11)) != 0)
    {
      v14 = (const void *)v13;
      v21 = 0LL;
      v15 = (void *)MRCDescriptorDecodePayloadAndSupplementalPayloadWithOptions(v13, &v21, v8, 0LL);
      v16 = v21;
      CFRelease(v14);
    }

    else
    {
      v16 = 0LL;
      v15 = 0LL;
    }

    if (v15)
    {
      v18 = (void *)_CFXPCCreateXPCObjectFromCFObject(v15);
      if (v16)
      {
LABEL_15:
        v19 = (void *)_CFXPCCreateXPCObjectFromCFObject(v16);
LABEL_18:
        xpc_object_t v20 = xpc_dictionary_create_reply(v5);
        xpc_object_t reply = v20;
        if (v18) {
          xpc_dictionary_set_value(v20, "DecodedStringValue", v18);
        }
        if (v19)
        {
          xpc_dictionary_set_value(reply, "SupplementalPayloadStringValue", v19);
        }

        goto LABEL_22;
      }
    }

    else
    {
      v18 = 0LL;
      if (v16) {
        goto LABEL_15;
      }
    }

    v19 = 0LL;
    goto LABEL_18;
  }

LABEL_23:
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}
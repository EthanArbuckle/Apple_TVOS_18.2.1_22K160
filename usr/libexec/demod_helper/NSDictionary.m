@interface NSDictionary
+ (NSDictionary)dictionaryWithXPCDictionary:(id)a3;
+ (id)dictionaryFromJsonData:(id)a3;
+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4;
- (BOOL)saveAsDataInXPCDictionary:(id)a3 forKey:(const char *)a4;
- (NSDictionary)initWithXPCDictionary:(id)a3;
- (id)convertToNSData;
- (id)createXPCDictionary;
- (id)objectForKey:(id)a3 ofType:(Class)a4;
@end

@implementation NSDictionary

+ (NSDictionary)dictionaryWithXPCDictionary:(id)a3
{
  id v3 = a3;
  v4 = -[NSDictionary initWithXPCDictionary:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithXPCDictionary:", v3);

  return v4;
}

- (NSDictionary)initWithXPCDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0LL;
  v17[0] = &v16;
  v17[1] = 0x3032000000LL;
  v17[2] = sub_100018DEC;
  v17[3] = sub_100018DFC;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_100018E04;
  v13 = &unk_100044E18;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_dictionary_apply(v4, &v10))
  {
    id v6 = sub_100021D84();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002A8C4((uint64_t)v17, v7);
    }

    v5 =  -[NSDictionary initWithDictionary:]( v5,  "initWithDictionary:",  *(void *)(v17[0] + 40LL),  v10,  v11,  v12,  v13);
    v8 = v5;
  }

  else
  {
    v8 = 0LL;
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)createXPCDictionary
{
  xpc_object_t v3 = xpc_dictionary_create(0LL, 0LL, 0LL);
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id v4 = self;
  NSUInteger v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
  if (v5)
  {
    NSUInteger v6 = v5;
    v7 = &APFSContainerGetSpaceInfo_ptr;
    uint64_t v8 = *(void *)v39;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v38 + 1) + 8 * v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v10, (void)v38));
        uint64_t v12 = objc_opt_class(v7[117]);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          xpc_dictionary_set_string( v3, (const char *)[v10 UTF8String], (const char *)objc_msgSend(v11, "UTF8String"));
        }

        else
        {
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSData);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
          {
            v14 = (const char *)[v10 UTF8String];
            id v15 = v11;
            id v16 = [v15 bytes];
            v17 = v15;
            v7 = &APFSContainerGetSpaceInfo_ptr;
            xpc_dictionary_set_data(v3, v14, v16, (size_t)[v17 length]);
          }

          else
          {
            uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSNumber);
            if ((objc_opt_isKindOfClass(v11, v18) & 1) != 0)
            {
              id v19 = v11;
              if (!strcmp((const char *)[v19 objCType], "i")
                || (id v20 = v19, !strcmp((const char *)[v20 objCType], "s"))
                || (id v21 = v20, !strcmp((const char *)[v21 objCType], "q"))
                || (id v22 = v21, !strcmp((const char *)[v22 objCType], "q")))
              {
                xpc_dictionary_set_int64( v3, (const char *)[v10 UTF8String], (int64_t)objc_msgSend(v19, "longLongValue"));
              }

              else
              {
                id v23 = v22;
                if (!strcmp((const char *)[v23 objCType], "f")
                  || (id v24 = v23, !strcmp((const char *)[v24 objCType], "d")))
                {
                  v30 = (const char *)[v10 UTF8String];
                  [v23 doubleValue];
                  xpc_dictionary_set_double(v3, v30, v31);
                }

                else
                {
                  id v25 = v24;
                  if (strcmp((const char *)[v25 objCType], "B"))
                  {
                    id v26 = v25;
                    if (strcmp((const char *)[v26 objCType], "c"))
                    {
                      id v36 = sub_100021D84();
                      v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
                      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
                        sub_10002A9A4(v26, v37);
                      }

LABEL_32:
                      id v33 = 0LL;
                      goto LABEL_33;
                    }
                  }

                  xpc_dictionary_set_BOOL( v3, (const char *)[v10 UTF8String], (BOOL)objc_msgSend(v25, "BOOLValue"));
                }

                v7 = &APFSContainerGetSpaceInfo_ptr;
              }
            }

            else
            {
              uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSDate);
              if ((objc_opt_isKindOfClass(v11, v27) & 1) == 0)
              {
                id v34 = sub_100021D84();
                id v26 = (id)objc_claimAutoreleasedReturnValue(v34);
                if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR)) {
                  sub_10002AA20((uint64_t)v10, (uint64_t)v11, (os_log_s *)v26);
                }
                goto LABEL_32;
              }

              v28 = (const char *)[v10 UTF8String];
              [v11 timeIntervalSince1970];
              xpc_dictionary_set_date(v3, v28, (uint64_t)v29);
            }
          }
        }

        ++v9;
      }

      while (v6 != v9);
      NSUInteger v32 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v38,  v42,  16LL);
      NSUInteger v6 = v32;
    }

    while (v32);
  }

  id v33 = v3;
LABEL_33:

  return v33;
}

+ (id)dictionaryFromJsonData:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v9 = sub_100021D84();
    NSUInteger v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10002AAB0(v5, v10, v11);
    }
    goto LABEL_11;
  }

  id v16 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v3,  0LL,  &v16));
  NSUInteger v5 = (os_log_s *)v16;
  if (!v4)
  {
    id v12 = sub_100021D84();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10002AB30(v5);
    }

LABEL_11:
    v7 = 0LL;
    goto LABEL_5;
  }

  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;

    NSUInteger v5 = v7;
  }

  else
  {
    id v14 = sub_100021D84();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10002ABB4();
    }

    v7 = 0LL;
    NSUInteger v5 = (os_log_s *)v4;
  }

+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4
    && (value = xpc_dictionary_get_value(v6, a4), id v9 = (char *)objc_claimAutoreleasedReturnValue(value),
                                                  (a4 = v9) != 0LL)
    && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)a4);
    size_t length = xpc_data_get_length((xpc_object_t)a4);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472LL;
    destructor[2] = nullsub_1;
    destructor[3] = &unk_100044E40;
    a4 = (id)a4;
    uint64_t v18 = (char *)a4;
    dispatch_data_t v14 = dispatch_data_create(bytes_ptr, length, v13, destructor);

    id v15 = (void *)objc_claimAutoreleasedReturnValue([a1 dictionaryFromJsonData:v14]);
  }

  else
  {
    id v15 = 0LL;
  }

  return v15;
}

- (BOOL)saveAsDataInXPCDictionary:(id)a3 forKey:(const char *)a4
{
  id v6 = a3;
  LOBYTE(v7) = 0;
  if (v6)
  {
    if (a4)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary convertToNSData](self, "convertToNSData"));
      v7 = v8;
      if (v8)
      {
        id v9 = (dispatch_data_s *)[v8 _createDispatchData];
        xpc_object_t v10 = xpc_data_create_with_dispatch_data(v9);

        xpc_dictionary_set_value(v6, a4, v10);
        LOBYTE(v7) = 1;
      }
    }
  }

  return (char)v7;
}

- (id)convertToNSData
{
  if (!+[NSJSONSerialization isValidJSONObject:](&OBJC_CLASS___NSJSONSerialization, "isValidJSONObject:", self))
  {
    id v7 = sub_100021D84();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002ACAC();
    }
    goto LABEL_10;
  }

  id v10 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  self,  0LL,  &v10));
  id v4 = (os_log_s *)v10;
  if (!v3)
  {
    id v8 = sub_100021D84();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002AC28(v4);
    }

LABEL_10:
    NSUInteger v5 = 0LL;
    goto LABEL_4;
  }

  NSUInteger v5 = v3;

  id v4 = v5;
LABEL_4:

  return v5;
}

- (id)objectForKey:(id)a3 ofType:(Class)a4
{
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self, "objectForKey:", a3));
  id v6 = (void *)v5;
  if (v5 && (objc_opt_isKindOfClass(v5, a4) & 1) != 0) {
    id v7 = v6;
  }
  else {
    id v7 = 0LL;
  }

  return v7;
}

  ;
}

  ;
}

@end
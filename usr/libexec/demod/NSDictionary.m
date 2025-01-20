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
  v17[2] = sub_10002EB20;
  v17[3] = sub_10002EB30;
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  v12 = sub_10002EB38;
  v13 = &unk_1000F9B70;
  v15 = &v16;
  v5 = self;
  v14 = v5;
  if (xpc_dictionary_apply(v4, &v10))
  {
    id v6 = sub_10003A95C();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100095B70((uint64_t)v17, v7);
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
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  id v4 = self;
  NSUInteger v5 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
  if (v5)
  {
    NSUInteger v6 = v5;
    v7 = &AATermsEntryDevice_ptr;
    uint64_t v8 = *(void *)v43;
    do
    {
      uint64_t v9 = 0LL;
      do
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v42 + 1) + 8 * v9);
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v4, "objectForKey:", v10, (void)v42));
        uint64_t v13 = objc_opt_class(v7[224], v12);
        if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
        {
          xpc_dictionary_set_string( v3, (const char *)[v10 UTF8String], (const char *)objc_msgSend(v11, "UTF8String"));
        }

        else
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSData, v14);
          if ((objc_opt_isKindOfClass(v11, v15) & 1) != 0)
          {
            v17 = (const char *)[v10 UTF8String];
            id v18 = v11;
            id v19 = [v18 bytes];
            v20 = v18;
            v7 = &AATermsEntryDevice_ptr;
            xpc_dictionary_set_data(v3, v17, v19, (size_t)[v20 length]);
          }

          else
          {
            uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber, v16);
            if ((objc_opt_isKindOfClass(v11, v21) & 1) != 0)
            {
              id v23 = v11;
              if (!strcmp((const char *)[v23 objCType], "i")
                || (id v24 = v23, !strcmp((const char *)[v24 objCType], "s"))
                || (id v25 = v24, !strcmp((const char *)[v25 objCType], "q"))
                || (id v26 = v25, !strcmp((const char *)[v26 objCType], "q")))
              {
                xpc_dictionary_set_int64( v3, (const char *)[v10 UTF8String], (int64_t)objc_msgSend(v23, "longLongValue"));
              }

              else
              {
                id v27 = v26;
                if (!strcmp((const char *)[v27 objCType], "f")
                  || (id v28 = v27, !strcmp((const char *)[v28 objCType], "d")))
                {
                  v34 = (const char *)[v10 UTF8String];
                  [v27 doubleValue];
                  xpc_dictionary_set_double(v3, v34, v35);
                }

                else
                {
                  id v29 = v28;
                  if (strcmp((const char *)[v29 objCType], "B"))
                  {
                    id v30 = v29;
                    if (strcmp((const char *)[v30 objCType], "c"))
                    {
                      id v40 = sub_10003A95C();
                      v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
                      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                        sub_100095C50(v30, v41);
                      }

LABEL_32:
                      id v37 = 0LL;
                      goto LABEL_33;
                    }
                  }

                  xpc_dictionary_set_BOOL( v3, (const char *)[v10 UTF8String], (BOOL)objc_msgSend(v29, "BOOLValue"));
                }

                v7 = &AATermsEntryDevice_ptr;
              }
            }

            else
            {
              uint64_t v31 = objc_opt_class(&OBJC_CLASS___NSDate, v22);
              if ((objc_opt_isKindOfClass(v11, v31) & 1) == 0)
              {
                id v38 = sub_10003A95C();
                id v30 = (id)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR)) {
                  sub_100095CCC((uint64_t)v10, (uint64_t)v11, (os_log_s *)v30);
                }
                goto LABEL_32;
              }

              v32 = (const char *)[v10 UTF8String];
              [v11 timeIntervalSince1970];
              xpc_dictionary_set_date(v3, v32, (uint64_t)v33);
            }
          }
        }

        ++v9;
      }

      while (v6 != v9);
      NSUInteger v36 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v42,  v46,  16LL);
      NSUInteger v6 = v36;
    }

    while (v36);
  }

  id v37 = v3;
LABEL_33:

  return v37;
}

+ (id)dictionaryFromJsonData:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v10 = sub_10003A95C();
    NSUInteger v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100095D5C(v6, v11, v12);
    }
    goto LABEL_11;
  }

  id v17 = 0LL;
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v3,  0LL,  &v17));
  NSUInteger v6 = (os_log_s *)v17;
  if (!v4)
  {
    id v13 = sub_10003A95C();
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100095DDC(v6);
    }

LABEL_11:
    uint64_t v8 = 0LL;
    goto LABEL_5;
  }

  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v4, v7) & 1) != 0)
  {
    uint64_t v8 = v4;

    NSUInteger v6 = v8;
  }

  else
  {
    id v15 = sub_10003A95C();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100095E60();
    }

    uint64_t v8 = 0LL;
    NSUInteger v6 = (os_log_s *)v4;
  }

+ (id)dictionaryFromXPCDictionary:(id)a3 withDataFromKey:(const char *)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if (a4
    && (value = xpc_dictionary_get_value(v6, a4), uint64_t v9 = (char *)objc_claimAutoreleasedReturnValue(value),
                                                  (a4 = v9) != 0LL)
    && xpc_get_type(v9) == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr((xpc_object_t)a4);
    size_t length = xpc_data_get_length((xpc_object_t)a4);
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(9LL, 0LL);
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    destructor[0] = _NSConcreteStackBlock;
    destructor[1] = 3221225472LL;
    destructor[2] = nullsub_1;
    destructor[3] = &unk_1000F9768;
    a4 = (id)a4;
    id v18 = (char *)a4;
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
      uint64_t v7 = v8;
      if (v8)
      {
        uint64_t v9 = (dispatch_data_s *)[v8 _createDispatchData];
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
    id v7 = sub_10003A95C();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100095F58();
    }
    goto LABEL_10;
  }

  id v10 = 0LL;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  self,  0LL,  &v10));
  id v4 = (os_log_s *)v10;
  if (!v3)
  {
    id v8 = sub_10003A95C();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100095ED4(v4);
    }

LABEL_10:
    uint64_t v5 = 0LL;
    goto LABEL_4;
  }

  uint64_t v5 = v3;

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

@end
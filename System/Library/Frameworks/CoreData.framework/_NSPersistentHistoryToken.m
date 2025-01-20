@interface _NSPersistentHistoryToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (_NSPersistentHistoryToken)initWithCoder:(id)a3;
- (_NSPersistentHistoryToken)initWithDictionary:(id)a3;
- (_NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4;
- (id)description;
- (id)storeTokens;
- (int64_t)compare:(id)a3;
- (int64_t)compareToken:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NSPersistentHistoryToken

- (_NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryToken;
  v6 = -[_NSPersistentHistoryToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_storeTokens = (NSDictionary *)(id)[MEMORY[0x189603F68] dictionaryWithObject:a3 forKey:a4];
    }

    else
    {

      return 0LL;
    }
  }

  return v7;
}

- (_NSPersistentHistoryToken)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryToken;
  v4 = -[_NSPersistentHistoryToken init](&v6, sel_init);
  if (v4)
  {
    if ([a3 count])
    {
      v4->_storeTokens = (NSDictionary *)a3;
    }

    else
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)dealloc
{
  self->_storeTokens = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryToken;
  -[_NSPersistentHistoryToken dealloc](&v3, sel_dealloc);
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<NSPersistentHistoryToken - %@>", self->_storeTokens];
}

- (id)storeTokens
{
  return self->_storeTokens;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0) {
    return -[NSDictionary isEqual:](self->_storeTokens, "isEqual:", [a3 storeTokens]);
  }
  else {
    return 0;
  }
}

- (int64_t)compare:(id)a3
{
  objc_super v3 = (void *)NSString;
  v4 = NSStringFromSelector(a2);
  v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  v7 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A48], objc_msgSend( v3, "stringWithFormat:", @"%@ is not supported for %@, use %@", v4, v6, NSStringFromSelector(sel_compareToken_error_)), 0 reason userInfo];
  objc_exception_throw(v7);
  return -[_NSPersistentHistoryToken compareToken:error:](v8, v9, v10, v11);
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  v51[1] = *MEMORY[0x1895F89C0];
  v7 = (void *)objc_msgSend( (id)objc_msgSend(-[_NSPersistentHistoryToken storeTokens](self, "storeTokens"), "allKeys"),  "sortedArrayUsingComparator:",  &__block_literal_global_16);
  v8 = (void *)objc_msgSend( (id)objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "allKeys"),  "sortedArrayUsingComparator:",  &__block_literal_global_11_0);
  uint64_t v9 = [v7 count];
  if (v9 != [v8 count])
  {
    v18 = (void *)MEMORY[0x189607870];
    uint64_t v19 = *MEMORY[0x189607460];
    uint64_t v50 = *MEMORY[0x1896075F0];
    v51[0] = [NSString stringWithFormat:@"Tokens have different number of stores."];
    v20 = (void *)objc_msgSend( v18,  "errorWithDomain:code:userInfo:",  v19,  134501,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1));
    if (v20) {
      goto LABEL_17;
    }
    uint64_t v21 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    __int16 v48 = 1024;
    int v49 = 89;
    goto LABEL_27;
  }

  if (([v7 isEqualToArray:v8] & 1) == 0)
  {
    v29 = (void *)MEMORY[0x189607870];
    uint64_t v30 = *MEMORY[0x189607460];
    uint64_t v44 = *MEMORY[0x1896075F0];
    uint64_t v45 = [NSString stringWithFormat:@"Tokens have different set of stores."];
    v20 = (void *)objc_msgSend( v29,  "errorWithDomain:code:userInfo:",  v30,  134501,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    if (v20)
    {
LABEL_17:
      if (a4)
      {
        int64_t v13 = 0LL;
        *a4 = v20;
        return v13;
      }

      return 0LL;
    }

    uint64_t v31 = [NSString stringWithUTF8String:"Illegal attempt to return an error without one in %s:%d"];
    _NSCoreDataLog( 17LL,  v31,  v32,  v33,  v34,  v35,  v36,  v37,  (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = (os_log_s *)__pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT)) {
      return 0LL;
    }
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    __int16 v48 = 1024;
    int v49 = 96;
LABEL_27:
    _os_log_fault_impl( &dword_186681000,  v28,  OS_LOG_TYPE_FAULT,  "CoreData: Illegal attempt to return an error without one in %s:%d",  buf,  0x12u);
    return 0LL;
  }

  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
  if (!v10) {
    return 3LL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v40;
  int64_t v13 = 3LL;
  while (2)
  {
    for (uint64_t i = 0LL; i != v11; ++i)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v7);
      }
      uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      uint64_t v16 = objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "objectForKey:", v15);
      if (v16)
      {
        uint64_t v17 = objc_msgSend(-[NSDictionary objectForKey:](self->_storeTokens, "objectForKey:", v15), "compare:", v16);
        if (v17)
        {
          if (v17 == 1) {
            return 4LL;
          }
          else {
            return 2LL;
          }
        }
      }
    }

    uint64_t v11 = [v7 countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v11) {
      continue;
    }
    break;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  uint64_t v11 = 0LL;
  if (-[NSDictionary count](self->_storeTokens, "count"))
  {
    storeTokens = self->_storeTokens;
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __33___NSPersistentHistoryToken_hash__block_invoke;
    v6[3] = &unk_189EAA0A8;
    v6[4] = &v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](storeTokens, "enumerateKeysAndObjectsUsingBlock:", v6);
    id v4 = (id)v9[3];
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryToken;
    id v4 = -[_NSPersistentHistoryToken hash](&v7, sel_hash);
    v9[3] = (uint64_t)v4;
  }

  _Block_object_dispose(&v8, 8);
  return (unint64_t)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSPersistentHistoryToken)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSPersistentHistoryToken;
  id v4 = -[_NSPersistentHistoryToken init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x189604010];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = (NSDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0),  @"NSPersistentHistoryTokenDictionary");
    v4->_storeTokens = v8;
    if (!-[NSDictionary count](v8, "count"))
    {

      return 0LL;
    }
  }

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

@end
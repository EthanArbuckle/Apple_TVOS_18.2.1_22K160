@interface NEDNSPacket
+ (id)createDataWithQuery:(id)a3;
- (BOOL)isAuthoritativeAnswer;
- (BOOL)isRecursionAvailable;
- (BOOL)isRecursionDesired;
- (BOOL)isTruncated;
- (NSArray)additionalRecords;
- (NSArray)answers;
- (NSArray)authorities;
- (NSArray)queries;
- (NSDate)timestamp;
- (NSString)responseCodeString;
- (id)createResponse;
- (id)initFromData:(id)a3;
- (int64_t)identifier;
- (int64_t)messageType;
- (int64_t)opCode;
- (int64_t)responseCode;
@end

@implementation NEDNSPacket

- (id)initFromData:(id)a3
{
  uint64_t v67 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  char v64 = 1;
  v63.receiver = self;
  v63.super_class = (Class)&OBJC_CLASS___NEDNSPacket;
  v6 = -[NEDNSPacket init](&v63, sel_init);
  if (!v6)
  {
    v19 = 0LL;
    v29 = 0LL;
    v33 = 0LL;
    v37 = 0LL;
    v9 = 0LL;
LABEL_33:
    v38 = 0LL;
    char v64 = 0;
    goto LABEL_50;
  }

  v7 = (NSDate *)objc_alloc_init(MEMORY[0x189603F50]);
  timestamp = v6->_timestamp;
  v6->_timestamp = v7;

  objc_storeStrong((id *)&v6->_data, a3);
  v9 = -[NEByteParser initWithData:](objc_alloc(&OBJC_CLASS___NEByteParser), v5);
  v6->_identifier = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet identifier";
LABEL_46:
    _os_log_error_impl(&dword_1876B1000, v39, OS_LOG_TYPE_ERROR, v40, buf, 2u);
    goto LABEL_47;
  }

  unsigned int v10 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  v6->_flags = v10;
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet flags";
    goto LABEL_46;
  }

  v6->_messageType = v10 >> 15;
  v6->_opCode = (v10 >> 11) & 0xF;
  v6->_isAuthoritativeAnswer = (v10 & 0x400) != 0;
  v6->_isTruncated = (v10 & 0x200) != 0;
  v6->_isRecursionDesired = BYTE1(v10) & 1;
  v6->_isRecursionAvailable = (v10 & 0x80) != 0;
  v6->_responseCode = v10 & 0xF;
  unsigned int v11 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet query count";
    goto LABEL_46;
  }

  unsigned int v12 = v11;
  unsigned int v13 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet answer count";
    goto LABEL_46;
  }

  unsigned int v14 = v13;
  unsigned int v15 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      goto LABEL_47;
    }
    *(_WORD *)buf = 0;
    v40 = "Failed to parse DNS packet authority count";
    goto LABEL_46;
  }

  unsigned int v16 = v15;
  unsigned int v17 = -[NEByteParser parse16Bits:]((uint64_t)v9, &v64);
  if (!v64)
  {
    ne_log_obj();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v40 = "Failed to parse DNS packet additional record count";
      goto LABEL_46;
    }

- (NSString)responseCodeString
{
  unint64_t v2 = -[NEDNSPacket responseCode](self, "responseCode");
  if (v2 > 6) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_18A08BBE0[v2]->isa;
  }
}

- (id)createResponse
{
  uint64_t v70 = *MEMORY[0x1895F89C0];
  if (self->_messageType == 1) {
    return self->_data;
  }
  id v44 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v50 = 0u;
  __int128 v51 = 0u;
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  v43 = self;
  v4 = self->_queries;
  uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v50,  v62,  16LL);
  if (!v5) {
    goto LABEL_44;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v51;
  v45 = v4;
  do
  {
    uint64_t v8 = 0LL;
    do
    {
      if (*(void *)v51 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v50 + 1) + 8 * v8);
      [(id)v9 answerData];
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        if (v9)
        {
          unsigned int v11 = *(void **)(v9 + 40);
          if (!v11 || (unint64_t)[v11 length] >= 0x10000)
          {
            ne_log_obj();
            unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              uint64_t v13 = *(void *)(v9 + 16);
              uint64_t v14 = [*(id *)(v9 + 40) length];
              *(_DWORD *)buf = 138412546;
              uint64_t v65 = v13;
              __int16 v66 = 2048;
              uint64_t v67 = v14;
              unsigned int v15 = v12;
              unsigned int v16 = "Failed to create an answer for %@, invalid answer data length (%lu)";
              uint32_t v17 = 22;
              goto LABEL_33;
            }

            goto LABEL_34;
          }

          uint64_t v18 = *(void *)(v9 + 24);
          BOOL v19 = v18 == 28 || v18 == 1;
          if (v19 && *(void *)(v9 + 32) == 1LL)
          {
            id v20 = objc_alloc_init(MEMORY[0x189603FB8]);
            [*(id *)(v9 + 16) componentsSeparatedByString:@"."];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v57 = 0u;
            __int128 v58 = 0u;
            __int128 v59 = 0u;
            __int128 v60 = 0u;
            id v22 = v21;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v57 objects:v63 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v58;
              while (2)
              {
                for (uint64_t i = 0LL; i != v24; ++i)
                {
                  if (*(void *)v58 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  if ((unint64_t)[v27 length] > 0x3F)
                  {

                    v29 = 0LL;
                    goto LABEL_40;
                  }

                  buf[0] = [v27 length];
                  [v20 appendBytes:buf length:1];
                  if (buf[0])
                  {
                    unint64_t v28 = (const char *)[v27 UTF8String];
                    [v20 appendBytes:v28 length:strlen(v28)];
                  }
                }

                uint64_t v24 = [v22 countByEnumeratingWithState:&v57 objects:v63 count:16];
                if (v24) {
                  continue;
                }
                break;
              }
            }

            __int16 v56 = bswap32(*(unsigned __int16 *)(v9 + 24)) >> 16;
            [v20 appendBytes:&v56 length:2];
            __int16 v55 = bswap32(*(unsigned __int16 *)(v9 + 32)) >> 16;
            [v20 appendBytes:&v55 length:2];
            *(_DWORD *)buf = bswap32(*(_DWORD *)(v9 + 8));
            [v20 appendBytes:buf length:4];
            __int16 v54 = bswap32([*(id *)(v9 + 40) length]) >> 16;
            [v20 appendBytes:&v54 length:2];
            [v20 appendData:*(void *)(v9 + 40)];
            v29 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithData:v20];
LABEL_40:

            if (v29) {
              [v44 addObject:v29];
            }
            v4 = v45;
            goto LABEL_36;
          }

          ne_log_obj();
          unsigned int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v30 = *(void *)(v9 + 16);
            uint64_t v31 = *(void *)(v9 + 24);
            uint64_t v32 = *(void *)(v9 + 32);
            *(_DWORD *)buf = 138412802;
            uint64_t v65 = v30;
            __int16 v66 = 2048;
            uint64_t v67 = v31;
            __int16 v68 = 2048;
            uint64_t v69 = v32;
            unsigned int v15 = v12;
            unsigned int v16 = "Failed to create an answer for %@, unsupported record type (%ld) and/or record class (%ld)";
            uint32_t v17 = 32;
LABEL_33:
            _os_log_error_impl(&dword_1876B1000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
          }

- (int64_t)identifier
{
  return self->_identifier;
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (int64_t)messageType
{
  return self->_messageType;
}

- (int64_t)opCode
{
  return self->_opCode;
}

- (BOOL)isAuthoritativeAnswer
{
  return self->_isAuthoritativeAnswer;
}

- (BOOL)isTruncated
{
  return self->_isTruncated;
}

- (BOOL)isRecursionDesired
{
  return self->_isRecursionDesired;
}

- (BOOL)isRecursionAvailable
{
  return self->_isRecursionAvailable;
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (NSArray)queries
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (NSArray)answers
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSArray)authorities
{
  return (NSArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSArray)additionalRecords
{
  return (NSArray *)objc_getProperty(self, a2, 80LL, 1);
}

- (void).cxx_destruct
{
}

+ (id)createDataWithQuery:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x189603FB8]);
  __int16 v27 = 2560;
  [v4 appendBytes:&v27 length:2];
  __int16 v26 = 1;
  [v4 appendBytes:&v26 length:2];
  __int16 v25 = 256;
  [v4 appendBytes:&v25 length:2];
  __int16 v24 = 0;
  [v4 appendBytes:&v24 length:2];
  __int16 v23 = 0;
  [v4 appendBytes:&v23 length:2];
  __int16 v22 = 0;
  [v4 appendBytes:&v22 length:2];
  [v3 name];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 componentsSeparatedByString:@"."];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        unsigned int v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ((unint64_t)[v12 length] > 0x3F)
        {

          uint64_t v14 = 0LL;
          goto LABEL_13;
        }

        LOBYTE(v17) = [v12 length];
        [v4 appendBytes:&v17 length:1];
        if ((_BYTE)v17)
        {
          uint64_t v13 = (const char *)[v12 UTF8String];
          [v4 appendBytes:v13 length:strlen(v13)];
        }
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  __int16 v17 = bswap32([v3 recordType]) >> 16;
  [v4 appendBytes:&v17 length:2];
  __int16 v16 = bswap32([v3 recordClass]) >> 16;
  [v4 appendBytes:&v16 length:2];
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189603F48]) initWithData:v4];
LABEL_13:

  return v14;
}

@end
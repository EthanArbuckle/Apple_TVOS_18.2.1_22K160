@interface NEIKEv2ChildSAPayload
+ (id)copyTypeDescription;
- (BOOL)generatePayloadData;
- (BOOL)hasRequiredFields;
- (BOOL)parsePayloadData;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (unint64_t)type;
@end

@implementation NEIKEv2ChildSAPayload

- (unint64_t)type
{
  return 33LL;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithCapacity:0];
  v8 = (void *)[(id)objc_opt_class() copyTypeDescription];
  [v7 appendPrettyObject:v8 withName:@"Payload Type" andIndent:v5 options:a4];

  if (self) {
    id Property = objc_getProperty(self, v9, 24LL, 1);
  }
  else {
    id Property = 0LL;
  }
  [v7 appendPrettyObject:Property withName:@"Proposals" andIndent:v5 options:a4];
  return v7;
}

- (id)description
{
  return -[NEIKEv2ChildSAPayload descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0LL, 14LL);
}

- (BOOL)hasRequiredFields
{
  if (self) {
    self = (NEIKEv2ChildSAPayload *)objc_getProperty(self, a2, 24LL, 1);
  }
  return -[NEIKEv2ChildSAPayload count](self, "count") != 0;
}

- (BOOL)generatePayloadData
{
  v2 = self;
  uint64_t v171 = *MEMORY[0x1895F89C0];
  if (self && objc_getProperty(self, a2, 16LL, 1))
  {
LABEL_3:
    id Property = objc_getProperty(v2, v3, 16LL, 1);
    return Property != 0LL;
  }

  if (!-[NEIKEv2ChildSAPayload hasRequiredFields](v2, "hasRequiredFields"))
  {
    ne_log_obj();
    v111 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v111, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1876B1000, v111, OS_LOG_TYPE_ERROR, "Child SA payload missing required fields", buf, 2u);
    }

    return 0;
  }

  id v7 = objc_alloc_init(MEMORY[0x189603FB8]);
  if (v2) {
    id v8 = objc_getProperty(v2, v6, 24LL, 1);
  }
  else {
    id v8 = 0LL;
  }
  unsigned __int8 v10 = [v8 count];
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  __int128 v159 = 0u;
  v114 = v2;
  if (v2) {
    id v11 = objc_getProperty(v2, v9, 24LL, 1);
  }
  else {
    id v11 = 0LL;
  }
  obuint64_t j = v11;
  unint64_t v119 = [obj countByEnumeratingWithState:&v156 objects:v170 count:16];
  if (!v119) {
    goto LABEL_128;
  }
  unsigned __int8 v121 = 0;
  uint64_t v12 = 0LL;
  id v115 = v7;
  int v116 = v10 - 1;
  uint64_t v117 = *(void *)v157;
  uint64_t v13 = *(void *)v157;
  while (2)
  {
    if (v13 != v117) {
      objc_enumerationMutation(obj);
    }
    v14 = *(void **)(*((void *)&v156 + 1) + 8 * v12);
    objc_msgSend(v14, "encryptionProtocols", v114);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    selfa = v14;
    if (v14) {
      id v17 = objc_getProperty(v14, v15, 96LL, 1);
    }
    else {
      id v17 = 0LL;
    }
    id v18 = v17;

    if (v18)
    {
      id v20 = selfa;
      if (selfa) {
        id v20 = objc_getProperty(selfa, v19, 96LL, 1);
      }
      id v21 = v20;
      id v169 = v21;
      uint64_t v22 = [MEMORY[0x189603F18] arrayWithObjects:&v169 count:1];

      id v16 = (id)v22;
    }

    if (![v16 count])
    {
      ne_log_obj();
      v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl( &dword_1876B1000,  v23,  OS_LOG_TYPE_ERROR,  "Child SA proposal missing encryption protocol",  buf,  2u);
      }

      goto LABEL_135;
    }

    uint64_t v120 = v12;
    v23 = (os_log_s *)objc_alloc_init(MEMORY[0x189603FB8]);
    __int128 v152 = 0u;
    __int128 v153 = 0u;
    __int128 v154 = 0u;
    __int128 v155 = 0u;
    id v16 = v16;
    uint64_t v24 = [v16 countByEnumeratingWithState:&v152 objects:v168 count:16];
    v128 = v16;
    if (!v24)
    {

      LOBYTE(v26) = 0;
      v37 = selfa;
      goto LABEL_45;
    }

    unint64_t v25 = v24;
    int v26 = 0;
    char v27 = 0;
    uint64_t v28 = 0LL;
    uint64_t v29 = *(void *)v153;
    for (uint64_t i = *(void *)v153; ; uint64_t i = *(void *)v153)
    {
      if (i != v29) {
        objc_enumerationMutation(v16);
      }
      uint64_t v31 = *(void *)(*((void *)&v152 + 1) + 8 * v28);
      *(void *)buf = 0LL;
      LODWORD(v130) = 0;
      if (!v31)
      {
        LODWORD(v32) = 0;
LABEL_33:
        buf[0] = 3;
        buf[4] = 1;
        *(_WORD *)&buf[6] = bswap32(v32) >> 16;
        *(_WORD *)&buf[2] = 2048;
        -[os_log_s appendBytes:length:](v23, "appendBytes:length:", buf, 8LL);
        ++v26;
        if (!v31) {
          goto LABEL_36;
        }
        goto LABEL_34;
      }

      unint64_t v32 = *(void *)(v31 + 16);
      if (v32 != 12 && (v32 > 0x1E || ((0x401C0000u >> v32) & 1) == 0)) {
        goto LABEL_33;
      }
      unsigned int v33 = (*(_BYTE *)(v31 + 8) & 1) != 0 ? 256 : 128;
      buf[0] = 3;
      buf[4] = 1;
      *(_WORD *)&buf[6] = bswap32(v32) >> 16;
      LOWORD(v130) = 3712;
      WORD1(v130) = __rev16(v33);
      *(_WORD *)&buf[2] = 3072;
      -[os_log_s appendBytes:length:](v23, "appendBytes:length:", buf, 8LL);
      -[os_log_s appendBytes:length:](v23, "appendBytes:length:", &v130, 4LL);
      ++v26;
LABEL_34:
      unint64_t v34 = *(void *)(v31 + 16);
      if (v34 <= 0x1F)
      {
        unsigned int v35 = (0xD01C0000 >> v34) & 1;
        goto LABEL_37;
      }

- (BOOL)parsePayloadData
{
  *(void *)((char *)&v68[1] + 4) = *MEMORY[0x1895F89C0];
  if (!self || !objc_getProperty(self, a2, 16LL, 1))
  {
    ne_log_obj();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v68[0] = "-[NEIKEv2ChildSAPayload parsePayloadData]";
      uint64_t v5 = "%s called with null self.payloadData";
      goto LABEL_69;
    }

- (void).cxx_destruct
{
}

+ (id)copyTypeDescription
{
  return @"SA(CHILD)";
}

@end
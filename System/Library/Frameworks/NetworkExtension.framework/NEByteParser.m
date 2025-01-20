@interface NEByteParser
- (BOOL)copyBytes:(void *)a3 to:;
- (id)copyWithZone:(_NSZone *)a3;
- (id)parseAddressWithFamily:(uint64_t)a1;
- (uint64_t)parse16Bits:(uint64_t)result;
- (uint64_t)parse32Bits:(uint64_t)result;
- (uint64_t)parseBytes:(uint64_t)result;
- (void)initWithData:(void *)a1;
- (void)parseDomainName;
@end

@implementation NEByteParser

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = +[NEByteParser allocWithZone:](&OBJC_CLASS___NEByteParser, "allocWithZone:", a3);
  if (self) {
    id Property = objc_getProperty(self, v4, 16LL, 1);
  }
  else {
    id Property = 0LL;
  }
  return -[NEByteParser initWithData:](v5, Property);
}

- (void).cxx_destruct
{
}

- (void)initWithData:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_CLASS___NEByteParser;
    id v5 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      uint64_t v6 = [v4 bytes];
      a1[1] = 0LL;
      a1[3] = v6;
      a1[4] = v6;
    }
  }

  return a1;
}

- (BOOL)copyBytes:(void *)a3 to:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v6 = &a2[*(void *)(a1 + 8)];
  unint64_t v7 = objc_msgSend(objc_getProperty((id)a1, a2, 16, 1), "length");
  if ((unint64_t)v6 > v7)
  {
    ne_log_obj();
    objc_super v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 8);
      int v11 = 134218240;
      v12 = a2;
      __int16 v13 = 2048;
      uint64_t v14 = v10;
      _os_log_error_impl( &dword_1876B1000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to advance by %lu bytes from offset %lu",  (uint8_t *)&v11,  0x16u);
    }
  }

  else if (a3)
  {
    memcpy(a3, *(const void **)(a1 + 32), (size_t)a2);
  }

  return (unint64_t)v6 <= v7;
}

- (void)parseDomainName
{
  v2 = self;
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id v3 = objc_getProperty(self, a2, 16LL, 1);
    bzero(v11, 0x3F1uLL);
    uint64_t v4 = v2[3];
    unint64_t v10 = v2[4];
    if (_NE_DNSMessageExtractDomainNameString( v4,  [v3 length],  v2[4],  (uint64_t)v11,  (uint64_t)&v10)
      || (unint64_t v6 = v2[4], v7 = v10 - v6, v10 <= v6)
      || (unint64_t v8 = v2[1] + v7, v8 > objc_msgSend(objc_getProperty(v2, v5, 16, 1), "length")))
    {
      v2 = 0LL;
    }

    else
    {
      v2[1] += v7;
      v2[4] = v10;
      [NSString stringWithCString:v11 encoding:4];
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (uint64_t)parse16Bits:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unsigned __int16 v5 = 0;
    BOOL v4 = -[NEByteParser copyBytes:to:](result, (const char *)2, &v5);
    if (v4)
    {
      *(void *)(v3 + 32) += 2LL;
      *(void *)(v3 + 8) += 2LL;
    }

    *a2 = v4;
    return bswap32(v5) >> 16;
  }

  return result;
}

- (uint64_t)parse32Bits:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    unsigned int v5 = 0;
    BOOL v4 = -[NEByteParser copyBytes:to:](result, (const char *)4, &v5);
    if (v4)
    {
      *(void *)(v3 + 32) += 4LL;
      *(void *)(v3 + 8) += 4LL;
    }

    *a2 = v4;
    return bswap32(v5);
  }

  return result;
}

- (uint64_t)parseBytes:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 32);
    BOOL v5 = -[NEByteParser copyBytes:to:](result, a2, 0LL);
    result = 0LL;
    if (v5)
    {
      *(void *)(v3 + 32) += a2;
      *(void *)(v3 + 8) += a2;
      return v4;
    }
  }

  return result;
}

- (id)parseAddressWithFamily:(uint64_t)a1
{
  if (!a1) {
    goto LABEL_11;
  }
  if (a2 == 2)
  {
    size_t v4 = 16LL;
    uint64_t v5 = 4LL;
  }

  else
  {
    if (a2 != 30) {
      goto LABEL_11;
    }
    size_t v4 = 46LL;
    uint64_t v5 = 16LL;
  }

  unint64_t v6 = *(const void **)(a1 + 32);
  unint64_t v7 = 0LL;
  *(void *)(a1 + 32) += v5;
  *(void *)(a1 + 8) += v5;
  if (!v6 || (unint64_t v8 = (char *)malloc(v4)) == 0LL)
  {
LABEL_11:
    unint64_t v7 = 0LL;
    return v7;
  }

  v9 = v8;
  if (inet_ntop(a2, v6, v8, v4)) {
    unint64_t v7 = (void *)[objc_alloc(NSString) initWithCString:v9 encoding:4];
  }
  else {
    unint64_t v7 = 0LL;
  }
  free(v9);
  return v7;
}

@end
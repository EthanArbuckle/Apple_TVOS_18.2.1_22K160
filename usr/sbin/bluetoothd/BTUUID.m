@interface BTUUID
+ (id)UUID128:(const char *)a3;
+ (id)UUID128WithString:(id)a3;
+ (id)UUID16:(unsigned __int16)a3;
+ (id)UUIDWithBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)UUIDWithData:(id)a3;
+ (id)UUIDWithLittleEndianBytes:(const char *)a3 length:(unint64_t)a4;
+ (id)randomUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToUUID16:(unsigned __int16)a3;
- (BTUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4;
- (BTUUID)initWithCoder:(id)a3;
- (NSData)data;
- (NSData)swappedData;
- (id)UUID128;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
@end

@implementation BTUUID

- (BTUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  if (a4 == 16 || a4 == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___BTUUID;
    v6 = -[BTUUID init](&v10, "init");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", a3, a4));
      -[BTUUID setData:](v6, "setData:", v7);
    }

    self = v6;
    v8 = self;
  }

  else
  {
    v8 = 0LL;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[BTUUID init](+[BTUUID allocWithZone:](&OBJC_CLASS___BTUUID, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  -[BTUUID setData:](v4, "setData:", v5);

  return v4;
}

+ (id)UUIDWithLittleEndianBytes:(const char *)a3 length:(unint64_t)a4
{
  v7 = (char *)&v11 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  bzero(v7, a4);
  if (a4)
  {
    v8 = v7;
    unint64_t v9 = a4;
    do
      *v8++ = a3[--v9];
    while (v9);
  }

  return (id)objc_claimAutoreleasedReturnValue([a1 UUIDWithBytes:v7 length:a4]);
}

+ (id)UUIDWithData:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a1 UUIDWithBytes:[v4 bytes] length:[v4 length]]);

  return v5;
}

+ (id)UUIDWithBytes:(const char *)a3 length:(unint64_t)a4
{
  if (a3)
  {
    if (a4 == 16 || a4 == 2) {
      id v4 = [objc_alloc((Class)a1) initWithBytes:a3 length:a4];
    }
    else {
      id v4 = 0LL;
    }
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

+ (id)UUID16:(unsigned __int16)a3
{
  __int16 v4 = __rev16(a3);
  return [objc_alloc((Class)a1) initWithBytes:&v4 length:2];
}

+ (id)UUID128:(const char *)a3
{
  return [objc_alloc((Class)a1) initWithBytes:a3 length:16];
}

+ (id)UUID128WithString:(id)a3
{
  id v4 = a3;
  else {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a1 UUID128:uu]);
  }

  return v5;
}

+ (id)randomUUID
{
  return (id)objc_claimAutoreleasedReturnValue([a1 UUID128:out]);
}

- (id)UUID128
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v4 = [v3 length];

  if (v4 == (id)16) {
    return self;
  }
  id v6 = objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v7 = (char *)[v6 bytes];

  __int16 v8 = 0;
  char v9 = v7[1];
  char v10 = *v7;
  unint64_t v11 = 0x8000008000100000LL;
  int v12 = -80438433;
  return (id)objc_claimAutoreleasedReturnValue(+[BTUUID UUID128:](&OBJC_CLASS___BTUUID, "UUID128:", &v8));
}

- (NSData)swappedData
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v4 = (char *)[v3 length];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](&OBJC_CLASS___NSMutableData, "dataWithLength:", v4));
  id v6 = objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v7 = [v6 bytes];

  id v8 = v5;
  for (i = [v8 mutableBytes]; v4; --v4)
    *i++ = v4[(void)(v7 - 1)];
  return (NSData *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  [v5 encodeObject:v4 forKey:@"uuidBytes"];
}

- (BTUUID)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___BTUUID;
  id v5 = -[BTUUID init](&v8, "init");
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 decodeObjectForKey:@"uuidBytes"]);
    -[BTUUID setData:](v5, "setData:", v6);
  }

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___BTUUID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
    id v7 = [v6 length];
    objc_super v8 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
    id v9 = [v8 length];

    if (v7 == v9)
    {
      char v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
      unsigned __int8 v12 = [v10 isEqualToData:v11];
    }

    else
    {
      char v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID UUID128](self, "UUID128"));
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 UUID128]);
      unsigned __int8 v12 = [v10 isEqual:v11];
    }

    BOOL v13 = v12;
  }

  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isEqualToUUID16:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v6 = [v5 length];

  if (v6 != (id)2) {
    return 0;
  }
  id v7 = objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  unsigned int v8 = bswap32(*(unsigned __int16 *)[v7 bytes]);

  return v3 == HIWORD(v8);
}

- (id)description
{
  id v3 = objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v4 = (const unsigned __int8 *)[v3 bytes];

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  id v6 = [v5 length];

  if (v6 == (id)2)
  {
    id v7 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"0x%04X",  bswap32(*(unsigned __int16 *)v4) >> 16));
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
    id v9 = [v8 length];

    if (v9 == (id)16)
    {
      memset(out, 0, 37);
      uuid_unparse_upper(v4, out);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", out));
    }

    else
    {
      id v7 = @"<>";
    }
  }

  return v7;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
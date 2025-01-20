@interface UARPAssetTag
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UARPAssetTag)init;
- (UARPAssetTag)initWithChar1:(char)a3 char2:(char)a4 char3:(char)a5 char4:(char)a6;
- (UARPAssetTag)initWithCoder:(id)a3;
- (UARPAssetTag)initWithString:(id)a3;
- (char)char1;
- (char)char2;
- (char)char3;
- (char)char4;
- (const)decodeCharForKey:(id)a3 key:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)tag;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPAssetTag

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetTag)init
{
  return 0LL;
}

- (UARPAssetTag)initWithChar1:(char)a3 char2:(char)a4 char3:(char)a5 char4:(char)a6
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___UARPAssetTag;
  v10 = -[UARPAssetTag init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_char1 = a3;
    v10->_char2 = a4;
    v10->_char3 = a5;
    v10->_char4 = a6;
    LOBYTE(v13) = a3;
    BYTE1(v13) = a4;
    BYTE2(v13) = a5;
    HIBYTE(v13) = a6;
    v10->_tag = uarpPayloadTagPack(&v13);
  }

  return v11;
}

- (UARPAssetTag)initWithString:(id)a3
{
  id v4 = a3;
  if ([v4 length] == 4)
  {
    v5 = (char *)[v4 UTF8String];
    self =  -[UARPAssetTag initWithChar1:char2:char3:char4:]( self,  "initWithChar1:char2:char3:char4:",  *v5,  v5[1],  v5[2],  v5[3]);
    v6 = self;
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%c%c%c%c",  self->_char1,  self->_char2,  self->_char3,  self->_char4);
}

- (const)decodeCharForKey:(id)a3 key:(id)a4
{
  uint64_t v5 = 0LL;
  result = (const char *)[a3 decodeBytesForKey:a4 returnedLength:&v5];
  if (!v5) {
    return 0LL;
  }
  return result;
}

- (UARPAssetTag)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[UARPAssetTag decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, @"char1");
  if (v5)
  {
    v6 = -[UARPAssetTag decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, @"char2");
    if (v6
      && (v7 = v6, (v8 = -[UARPAssetTag decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, @"char3")) != 0LL)
      && (v9 = v8,
          (v10 = -[UARPAssetTag decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, @"char4")) != 0LL))
    {
      self =  -[UARPAssetTag initWithChar1:char2:char3:char4:]( self,  "initWithChar1:char2:char3:char4:",  *v5,  *v7,  *v9,  *v10);
      uint64_t v5 = (const char *)self;
    }

    else
    {
      uint64_t v5 = 0LL;
    }
  }

  return (UARPAssetTag *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  p_char1 = &self->_char1;
  id v5 = a3;
  [v5 encodeBytes:p_char1 length:1 forKey:@"char1"];
  [v5 encodeBytes:&self->_char2 length:1 forKey:@"char2"];
  [v5 encodeBytes:&self->_char3 length:1 forKey:@"char3"];
  [v5 encodeBytes:&self->_char4 length:1 forKey:@"char4"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]( objc_alloc(&OBJC_CLASS___UARPAssetTag),  "initWithChar1:char2:char3:char4:",  self->_char1,  self->_char2,  self->_char3,  self->_char4);
}

- (unint64_t)hash
{
  return self->_tag;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (UARPAssetTag *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      BOOL v10 = 1;
    }

    else
    {
      id v5 = v4;
      int char1 = self->_char1;
      if (char1 == -[UARPAssetTag char1](v5, "char1")
        && (int char2 = self->_char2, char2 == -[UARPAssetTag char2](v5, "char2"))
        && (int char3 = self->_char3, char3 == -[UARPAssetTag char3](v5, "char3")))
      {
        int char4 = self->_char4;
        BOOL v10 = char4 == -[UARPAssetTag char4](v5, "char4");
      }

      else
      {
        BOOL v10 = 0;
      }
    }
  }

  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (char)char1
{
  return self->_char1;
}

- (char)char2
{
  return self->_char2;
}

- (char)char3
{
  return self->_char3;
}

- (char)char4
{
  return self->_char4;
}

- (unsigned)tag
{
  return self->_tag;
}

@end
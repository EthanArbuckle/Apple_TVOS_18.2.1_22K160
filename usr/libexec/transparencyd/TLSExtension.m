@interface TLSExtension
+ (id)parseFromData:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)extensionData;
- (id)data;
- (unint64_t)parsedLength;
- (unsigned)extensionType;
- (void)setExtensionData:(id)a3;
- (void)setExtensionType:(unsigned __int8)a3;
- (void)setParsedLength:(unint64_t)a3;
@end

@implementation TLSExtension

- (id)data
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if (-[TLSMessageClass encodeByte:buffer:]( self,  "encodeByte:buffer:",  -[TLSExtension extensionType](self, "extensionType"),  v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension extensionData](self, "extensionData"));
    unsigned int v5 = -[TLSMessageClass encodeByteArray:minLength:maxLength:buffer:]( self,  "encodeByteArray:minLength:maxLength:buffer:",  v4,  0LL,  0xFFFFLL,  v3);

    v6 = 0LL;
    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithData:](&OBJC_CLASS___NSData, "dataWithData:", v3));
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [v4 bytes];
  id v6 = v4;
  id v7 = [v6 bytes];
  v8 = (char *)[v6 length] + (void)v7;
  v9 = objc_alloc_init(&OBJC_CLASS___TLSExtension);
  unsigned __int8 v14 = 0;
  v10 = -[TLSMessageClass parseByte:end:result:](v9, "parseByte:end:result:", v5, v8, &v14);
  if (v10)
  {
    -[TLSExtension setExtensionType:](v9, "setExtensionType:", v14);
    id v13 = 0LL;
    v10 = -[TLSMessageClass parseByteArray:end:minLength:maxLength:result:]( v9,  "parseByteArray:end:minLength:maxLength:result:",  v10,  v8,  0LL,  0xFFFFLL,  &v13);
    id v11 = v13;
    if (v10)
    {
      -[TLSExtension setExtensionData:](v9, "setExtensionData:", v11);
      -[TLSExtension setParsedLength:]( v9,  "setParsedLength:",  v10 - (_BYTE *)[objc_retainAutorelease(v6) bytes]);
      v10 = v9;
    }
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (TLSExtension *)a3;
  if (self == v5)
  {
    unsigned __int8 v10 = 1;
  }

  else
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___TLSExtension, v4);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension data](self, "data"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TLSExtension data](v7, "data"));

      unsigned __int8 v10 = [v8 isEqualToData:v9];
    }

    else
    {
      unsigned __int8 v10 = 0;
    }
  }

  return v10;
}

- (unsigned)extensionType
{
  return self->_extensionType;
}

- (void)setExtensionType:(unsigned __int8)a3
{
  self->_extensionType = a3;
}

- (NSData)extensionData
{
  return (NSData *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setExtensionData:(id)a3
{
}

- (unint64_t)parsedLength
{
  return self->_parsedLength;
}

- (void)setParsedLength:(unint64_t)a3
{
  self->_parsedLength = a3;
}

- (void).cxx_destruct
{
}

@end
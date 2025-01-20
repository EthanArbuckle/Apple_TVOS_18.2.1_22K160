@interface PDSharingMailboxPayload
- (NSData)data;
- (PDSharingMailboxPayload)init;
- (PDSharingMailboxPayload)initWithData:(id)a3 scheme:(unint64_t)a4;
- (PDSharingMailboxPayload)initWithDictionary:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)scheme;
- (void)setData:(id)a3;
- (void)setScheme:(unint64_t)a3;
@end

@implementation PDSharingMailboxPayload

- (PDSharingMailboxPayload)init
{
  return 0LL;
}

- (PDSharingMailboxPayload)initWithData:(id)a3 scheme:(unint64_t)a4
{
  id v7 = a3;
  v8 = 0LL;
  if (v7 && a4)
  {
    v12.receiver = self;
    v12.super_class = (Class)&OBJC_CLASS___PDSharingMailboxPayload;
    v9 = -[PDSharingMailboxPayload init](&v12, "init");
    v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_data, a3);
      v10->_scheme = a4;
    }

    self = v10;
    v8 = self;
  }

  return v8;
}

- (PDSharingMailboxPayload)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"data"]);
  if (v5)
  {
    v6 = -[NSData initWithBase64EncodedString:options:]( objc_alloc(&OBJC_CLASS___NSData),  "initWithBase64EncodedString:options:",  v5,  0LL);
    if (v6)
    {
      id v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue([v4 PKStringForKey:@"type"]);
      v8 = v7;
      if (v7 == @"AEAD_AES_128_GCM")
      {
LABEL_6:
        uint64_t v10 = 1LL;
LABEL_7:

        self = -[PDSharingMailboxPayload initWithData:scheme:](self, "initWithData:scheme:", v6, v10);
        v11 = self;
LABEL_14:

        goto LABEL_15;
      }

      if (v7)
      {
        unsigned __int8 v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", @"AEAD_AES_128_GCM");

        if ((v9 & 1) != 0) {
          goto LABEL_6;
        }
        objc_super v12 = v8;
        if (v12 == @"AEAD_AES_256_GCM"
          || (v13 = v12,
              unsigned __int8 v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", @"AEAD_AES_256_GCM"),
              v13,
              (v14 & 1) != 0))
        {
          uint64_t v10 = 2LL;
          goto LABEL_7;
        }
      }
    }

    v11 = 0LL;
    goto LABEL_14;
  }

  v11 = 0LL;
LABEL_15:

  return v11;
}

- (id)dictionaryRepresentation
{
  v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSData base64EncodedStringWithOptions:](self->_data, "base64EncodedStringWithOptions:", 0LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, @"data");

  unint64_t scheme = self->_scheme;
  v6 = @"AEAD_AES_256_GCM";
  if (scheme != 2) {
    v6 = 0LL;
  }
  if (scheme == 1) {
    id v7 = @"AEAD_AES_128_GCM";
  }
  else {
    id v7 = v6;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, @"type");
  id v8 = -[NSMutableDictionary copy](v3, "copy");

  return v8;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (unint64_t)scheme
{
  return self->_scheme;
}

- (void)setScheme:(unint64_t)a3
{
  self->_unint64_t scheme = a3;
}

- (void).cxx_destruct
{
}

@end
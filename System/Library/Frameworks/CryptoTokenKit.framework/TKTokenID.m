@interface TKTokenID
+ (BOOL)supportsSecureCoding;
+ (id)encodedCertificateID:(id)a3;
+ (id)encodedKeyID:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)classID;
- (NSString)instanceID;
- (NSString)stringRepresentation;
- (TKTokenID)initWithClassID:(id)a3 instanceID:(id)a4;
- (TKTokenID)initWithCoder:(id)a3;
- (TKTokenID)initWithTokenID:(id)a3;
- (id)decodedCertificateID:(id)a3 error:(id *)a4;
- (id)decodedKeyID:(id)a3 error:(id *)a4;
- (id)decodedObjectID:(id)a3 isCertificate:(BOOL *)a4 error:(id *)a5;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TKTokenID

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TKTokenID)initWithTokenID:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___TKTokenID;
    v5 = -[TKTokenID init](&v10, sel_init);
    if (v5)
    {
      if ([v4 hasSuffix:@":"])
      {
        objc_msgSend(v4, "substringToIndex:", objc_msgSend(v4, "length") - 1);
        v6 = (NSString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v6 = (NSString *)v4;
      }

      stringRepresentation = v5->_stringRepresentation;
      v5->_stringRepresentation = v6;
    }

    self = v5;
    v7 = self;
  }

  else
  {
    v7 = 0LL;
  }

  return v7;
}

- (TKTokenID)initWithClassID:(id)a3 instanceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    [NSString stringWithFormat:@"%@:%@", v6, v7];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v8 = v6;
  }

  v9 = v8;
  objc_super v10 = -[TKTokenID initWithTokenID:](self, "initWithTokenID:", v8);

  return v10;
}

- (TKTokenID)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tokenID"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  id v6 = -[TKTokenID initWithTokenID:](self, "initWithTokenID:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  -[TKTokenID stringRepresentation](self, "stringRepresentation");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v5 forKey:@"tokenID"];
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[TKTokenID stringRepresentation](self, "stringRepresentation");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringRepresentation];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v5 isEqualToString:v6];
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSString)classID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 componentsSeparatedByString:@":"];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 firstObject];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)instanceID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 componentsSeparatedByString:@":"];
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)[v3 count] < 2)
  {
    id v4 = &stru_189F8C1A8;
  }

  else
  {
    [v3 objectAtIndexedSubscript:1];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v4;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<tkid:%@>", self->_stringRepresentation];
}

+ (id)encodedKeyID:(id)a3
{
  id v3 = a3;
  id v4 = -[TKBERTLVRecord initWithPropertyList:](objc_alloc(&OBJC_CLASS___TKBERTLVRecord), "initWithPropertyList:", v3);
  if (!v4) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58], @"failed to serialize objectID '%@'", v3 format];
  }
  -[TKTLVRecord data](v4, "data");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)encodedCertificateID:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = -[TKBERTLVRecord initWithTag:value:]( objc_alloc(&OBJC_CLASS___TKBERTLVRecord),  "initWithTag:value:",  0x5FC8C6BFE112LL,  v3);
  -[TKTLVRecord data](v4, "data");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)decodedObjectID:(id)a3 isCertificate:(BOOL *)a4 error:(id *)a5
{
  v22[1] = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v9 = +[TKTLVRecord recordFromData:](&OBJC_CLASS___TKBERTLVRecord, "recordFromData:", v8);
  if ([v9 tag] != 0x5FC8C6BFE112)
  {
    uint64_t v13 = [v9 propertyList];
    if (v13)
    {
      v11 = (void *)v13;
      BOOL v12 = 0;
    }

    else
    {
      v14 = -[TKTokenID stringRepresentation](self, "stringRepresentation");
      int v15 = [v14 isEqualToString:*MEMORY[0x18960BAD0]];

      if (v15)
      {
        v16 = (void *)[objc_alloc(MEMORY[0x189607908]) initForReadingFromData:v8 error:0];
        [v16 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1896075C8]];
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v11 = 0LL;
      }

      BOOL v12 = 0;
      if (a5 && !v11)
      {
        v17 = (void *)MEMORY[0x189607870];
        uint64_t v21 = *MEMORY[0x1896075E0];
        v22[0] = @"corrupted objectID detected";
        [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:&v21 count:1];
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:v18];
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        BOOL v12 = 0;
        v11 = 0LL;
      }
    }

    goto LABEL_12;
  }

  [v9 value];
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TKTokenID decodedObjectID:isCertificate:error:](self, "decodedObjectID:isCertificate:error:", v10, a4, a5);
  if (v11)
  {
    BOOL v12 = 1;
LABEL_12:
    *a4 = v12;
  }

  id v19 = v11;

  return v19;
}

- (id)decodedKeyID:(id)a3 error:(id *)a4
{
  v11[1] = *MEMORY[0x1895F89C0];
  -[TKTokenID decodedObjectID:isCertificate:error:](self, "decodedObjectID:isCertificate:error:", a3, &v9, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v9)
  {

    if (a4)
    {
      id v6 = (void *)MEMORY[0x189607870];
      uint64_t v10 = *MEMORY[0x189607490];
      v11[0] = @"Expecting key, but provided certificate objectID";
      [MEMORY[0x189603F68] dictionaryWithObjects:v11 forKeys:&v10 count:1];
      char v7 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 errorWithDomain:@"CryptoTokenKit" code:-6 userInfo:v7];
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    id v5 = 0LL;
  }

  return v5;
}

- (id)decodedCertificateID:(id)a3 error:(id *)a4
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)stringRepresentation
{
  return (NSString *)objc_getProperty(self, a2, 8LL, 1);
}

- (void).cxx_destruct
{
}

@end
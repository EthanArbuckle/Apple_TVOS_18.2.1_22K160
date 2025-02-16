@interface _SFSignedData
+ (BOOL)supportsSecureCoding;
- (NSData)data;
- (NSData)signature;
- (_SFSignedData)initWithCoder:(id)a3;
- (_SFSignedData)initWithData:(id)a3 signature:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _SFSignedData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_SFSignedData)initWithData:(id)a3 signature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS____SFSignedData;
  v8 = -[_SFSignedData init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(&OBJC_CLASS___SFSignedData_Ivars);
    id signedDataInternal = v8->_signedDataInternal;
    v8->_id signedDataInternal = v9;

    uint64_t v11 = [v6 copy];
    v12 = v8->_signedDataInternal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    uint64_t v14 = [v7 copy];
    v15 = v8->_signedDataInternal;
    v16 = (void *)v15[2];
    v15[2] = v14;
  }

  return v8;
}

- (_SFSignedData)initWithCoder:(id)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS____SFSignedData;
  v5 = -[_SFSignedData init](&v21, sel_init);
  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___SFSignedData_Ivars);
    id signedDataInternal = v5->_signedDataInternal;
    v5->_id signedDataInternal = v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_data"];
    v9 = v5->_signedDataInternal;
    v10 = (void *)v9[1];
    v9[1] = v8;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_signature"];
    v12 = v5->_signedDataInternal;
    v13 = (void *)v12[2];
    v12[2] = v11;

    uint64_t v14 = v5->_signedDataInternal;
    if (!v14[1] || !v14[2])
    {
      v15 = (void *)MEMORY[0x189607870];
      uint64_t v16 = *MEMORY[0x189607460];
      uint64_t v22 = *MEMORY[0x1896075E0];
      [NSString stringWithFormat:@"Failed to deserialize object of type %@", objc_opt_class()];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      objc_super v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 errorWithDomain:v16 code:4865 userInfo:v18];
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      [v4 failWithError:v19];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *((void *)self->_signedDataInternal + 1);
  id v5 = a3;
  [v5 encodeObject:v4 forKey:@"_data"];
  [v5 encodeObject:*((void *)self->_signedDataInternal + 2) forKey:@"_signature"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)[objc_alloc((Class)objc_opt_class()) initWithData:*((void *)self->_signedDataInternal + 1) signature:*((void *)self->_signedDataInternal + 2)];
}

- (NSData)data
{
  return (NSData *)*((id *)self->_signedDataInternal + 1);
}

- (NSData)signature
{
  return (NSData *)*((id *)self->_signedDataInternal + 2);
}

- (void).cxx_destruct
{
}

@end
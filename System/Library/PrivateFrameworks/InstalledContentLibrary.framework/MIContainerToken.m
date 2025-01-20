@interface MIContainerToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isTransient;
- (MIContainerToken)initWithCoder:(id)a3;
- (MIContainerToken)initWithContainer:(id)a3;
- (NSData)serializedContainerRepresentation;
- (NSString)identifier;
- (NSString)personaUniqueString;
- (NSURL)containerURL;
- (id)description;
- (unint64_t)containerClass;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MIContainerToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIContainerToken)initWithContainer:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MIContainerToken;
  v5 = -[MIContainerToken init](&v15, sel_init);
  if (v5)
  {
    [v4 rawContainer];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      uint64_t v7 = [v4 identifier];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

      uint64_t v9 = [v4 personaUniqueString];
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v9;

      v5->_isTransient = [v4 isTransient];
      v5->_containerClass = [v4 containerClass];
      uint64_t v11 = [v6 serializedContainerRepresentation];
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v11;
    }

    else
    {
      uint64_t v13 = [v4 containerURL];
      serializedContainerRepresentation = v5->_containerURL;
      v5->_containerURL = (NSURL *)v13;
    }
  }

  return v5;
}

- (MIContainerToken)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MIContainerToken;
  v5 = -[MIContainerToken init](&v23, sel_init);
  if (v5)
  {
    if ([v4 containsValueForKey:@"containerURL"])
    {
      uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerURL"];
      containerURL = v5->_containerURL;
      v5->_containerURL = (NSURL *)v6;

      if (!v5->_containerURL)
      {
        uint64_t v9 = @"Serialized container did not encode containerURL";
        uint64_t v10 = 52LL;
LABEL_12:
        _CreateAndLogError( (uint64_t)"-[MIContainerToken initWithCoder:]",  v10,  @"MIInstallerErrorDomain",  186LL,  0LL,  0LL,  v9,  v8,  v22);
        goto LABEL_13;
      }
    }

    else
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v11;

      if (!v5->_identifier)
      {
        uint64_t v9 = @"Serialized container did not encode an identifier";
        uint64_t v10 = 58LL;
        goto LABEL_12;
      }

      uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personaUniqueString"];
      personaUniqueString = v5->_personaUniqueString;
      v5->_personaUniqueString = (NSString *)v13;

      v5->_isTransient = [v4 decodeBoolForKey:@"isTransient"];
      [v4 decodeObjectOfClass:objc_opt_class() forKey:@"containerClass"];
      objc_super v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_containerClass = [v15 unsignedLongLongValue];

      if (v5->_containerClass - 15 <= 0xFFFFFFFFFFFFFFF1LL)
      {
        _CreateAndLogError( (uint64_t)"-[MIContainerToken initWithCoder:]",  70LL,  @"MIInstallerErrorDomain",  186LL,  0LL,  0LL,  @"Serialized container encoded invalid class: %llu",  v16,  v5->_containerClass);
LABEL_13:
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v4 failWithError:v20];

        v19 = 0LL;
        goto LABEL_14;
      }

      uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serializedContainerRepresentation"];
      serializedContainerRepresentation = v5->_serializedContainerRepresentation;
      v5->_serializedContainerRepresentation = (NSData *)v17;

      if (!v5->_serializedContainerRepresentation)
      {
        uint64_t v9 = @"Serialized container did not encode the MobileContainerManager serialization of the container";
        uint64_t v10 = 76LL;
        goto LABEL_12;
      }
    }
  }

  v19 = v5;
LABEL_14:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIContainerToken serializedContainerRepresentation](self, "serializedContainerRepresentation");
  if (v5)
  {
    -[MIContainerToken identifier](self, "identifier");
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v6 forKey:@"identifier"];

    -[MIContainerToken personaUniqueString](self, "personaUniqueString");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v7 forKey:@"personaUniqueString"];

    objc_msgSend(v4, "encodeBool:forKey:", -[MIContainerToken isTransient](self, "isTransient"), @"isTransient");
    objc_msgSend( MEMORY[0x189607968],  "numberWithUnsignedLongLong:",  -[MIContainerToken containerClass](self, "containerClass"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 encodeObject:v8 forKey:@"containerClass"];

    -[MIContainerToken serializedContainerRepresentation](self, "serializedContainerRepresentation");
  }

  else
  {
    -[MIContainerToken containerURL](self, "containerURL");
  }

  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:");
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = (void *)NSString;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MIContainerToken personaUniqueString](self, "personaUniqueString");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v8 = -[MIContainerToken isTransient](self, "isTransient");
    unint64_t v9 = -[MIContainerToken containerClass](self, "containerClass");
    uint64_t v10 = 78LL;
    if (v8) {
      uint64_t v10 = 89LL;
    }
    [v4 stringWithFormat:@"<%@ identity:%@/%@ isTransient:%c containerClass:%llu>", v6, v3, v7, v10, v9];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[MIContainerToken containerURL](self, "containerURL");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 path];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 stringWithFormat:@"<%@ containerPath:%@>", v6, v12];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (BOOL)isTransient
{
  return self->_isTransient;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (NSURL)containerURL
{
  return self->_containerURL;
}

- (NSData)serializedContainerRepresentation
{
  return self->_serializedContainerRepresentation;
}

- (void).cxx_destruct
{
}

@end
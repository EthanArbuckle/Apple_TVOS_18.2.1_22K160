@interface MIAppReferenceMetadata
+ (BOOL)supportsSecureCoding;
+ (id)referenceMetadataFromURL:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)serializeToURL:(id)a3 error:(id *)a4;
- (MIAppReferenceMetadata)init;
- (MIAppReferenceMetadata)initWithCoder:(id)a3;
- (NSArray)personas;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPersonas:(id)a3;
@end

@implementation MIAppReferenceMetadata

- (MIAppReferenceMetadata)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIAppReferenceMetadata;
  return -[MIAppReferenceMetadata init](&v3, "init");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MIAppReferenceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MIAppReferenceMetadata init](self, "init");
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSArray);
    v7 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v6,  objc_opt_class(&OBJC_CLASS___NSString),  0LL);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v8 forKey:@"personas"]);
    personas = v5->_personas;
    v5->_personas = (NSArray *)v9;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  [v4 encodeObject:v5 forKey:@"personas"];
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MIAppReferenceMetadata *)a3;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }

  else
  {
    objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4) & 1) != 0)
    {
      id v5 = v4;
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](v5, "personas"));

      BOOL v8 = sub_100013970(v6, v7);
    }

    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (BOOL)serializeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v7, "encodeObject:forKey:", self, NSKeyedArchiveRootObjectKey);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v7, "encodedData"));

  id v18 = 0LL;
  unsigned __int8 v9 = [v8 writeToURL:v6 options:268435457 error:&v18];
  id v10 = v18;
  if ((v9 & 1) != 0)
  {
    BOOL v11 = 1;
  }

  else
  {
    v12 = (void *)MIInstallerErrorDomain;
    v13 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v15 = sub_1000130F4( (uint64_t)"-[MIAppReferenceMetadata serializeToURL:error:]",  96LL,  v12,  4LL,  v10,  0LL,  @"Failed to write serialized MIAppReferences to %@",  v14,  (uint64_t)v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    id v10 = v16;
    if (a4)
    {
      id v10 = v16;
      BOOL v11 = 0;
      *a4 = v10;
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

+ (id)referenceMetadataFromURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v34 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v6,  3LL,  &v34));
  id v8 = v34;
  unsigned __int8 v9 = v8;
  if (!v7)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    if ([v20 isEqualToString:NSCocoaErrorDomain])
    {
      id v21 = [v9 code];

      if (v21 == (id)260) {
        goto LABEL_11;
      }
    }

    else
    {
    }

    v26 = (void *)MIInstallerErrorDomain;
    v27 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v29 = sub_1000130F4( (uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]",  119LL,  v26,  130LL,  v9,  0LL,  @"Failed to read reference metadata from %@",  v28,  (uint64_t)v27);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);

    id v10 = 0LL;
    v13 = 0LL;
    unsigned __int8 v9 = (void *)v30;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  id v33 = v8;
  id v10 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v7,  &v33);
  id v11 = v33;

  if (!v10)
  {
    v22 = (void *)MIInstallerErrorDomain;
    v23 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v25 = sub_1000130F4( (uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]",  126LL,  v22,  130LL,  v11,  0LL,  @"Failed to read reference metadata from %@",  v24,  (uint64_t)v23);
    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(v25);

LABEL_11:
    id v10 = 0LL;
    v13 = 0LL;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }

  id v12 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v10,  "decodeObjectOfClass:forKey:",  objc_opt_class(a1),  NSKeyedArchiveRootObjectKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if (!v13)
  {
    uint64_t v14 = (void *)MIInstallerErrorDomain;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v10, "error"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
    id v18 = sub_1000130F4( (uint64_t)"+[MIAppReferenceMetadata referenceMetadataFromURL:error:]",  132LL,  v14,  130LL,  v15,  0LL,  @"Failed to decode reference metadata from %@",  v17,  (uint64_t)v16);
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    id v11 = (id)v19;
  }

  -[NSKeyedUnarchiver finishDecoding](v10, "finishDecoding");
  unsigned __int8 v9 = v11;
  if (a4)
  {
LABEL_15:
    if (!v13) {
      *a4 = v9;
    }
  }

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](self, "personas"));
  id v7 = [v6 copyWithZone:a3];
  [v5 setPersonas:v7];

  return v5;
}

- (NSArray)personas
{
  return self->_personas;
}

- (void)setPersonas:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
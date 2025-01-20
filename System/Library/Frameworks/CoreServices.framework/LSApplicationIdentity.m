@interface LSApplicationIdentity
+ (BOOL)personaWithUniqueString:(id)a3 getPersonaType:(unint64_t *)a4 error:(id *)a5;
+ (BOOL)supportsSecureCoding;
+ (Class)currentIdentityClass;
+ (id)bundleIdentifierForIdentityString:(id)a3 error:(id *)a4;
+ (id)enumeratorWithOptions:(unint64_t)a3;
+ (id)identityStringsForApplicationWithBundleIdentifier:(id)a3 error:(id *)a4;
+ (unsigned)classVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsMigration;
- (Class)classForCoder;
- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 URL:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6;
- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 personaUniqueString:(id)a5 error:(id *)a6;
- (LSApplicationIdentity)initWithCoder:(id)a3;
- (LSApplicationIdentity)initWithIdentityBookmark:(id)a3 identityString:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6;
- (LSApplicationIdentity)initWithIdentityString:(id)a3;
- (LSApplicationIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5;
- (id)bundleIdentifier;
- (id)findApplicationRecordFetchingPlaceholder:(int64_t)a3 error:(id *)a4;
- (id)findApplicationRecordWithError:(id *)a3;
- (id)initForRecord:(id)a3 personaWithAttributes:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSApplicationIdentity

- (id)initForRecord:(id)a3 personaWithAttributes:(id)a4
{
  v6 = (LSApplicationRecord *)a3;
  v7 = (_LSPersonaWithAttributes *)a4;
  computeIdentityBookmark(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  computeIdentityString(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_LSDatabase store]((uint64_t)v7);
  if (v7) {
    uint64_t v11 = -[_LSPersonaWithAttributes personaType]((uint64_t)v7);
  }
  else {
    uint64_t v11 = 4LL;
  }
  v12 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:]( self,  "initWithIdentityBookmark:identityString:personaUniqueString:personaType:",  v8,  v9,  v10,  v11);

  return v12;
}

- (LSApplicationIdentity)initWithIdentityBookmark:(id)a3 identityString:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
  v13 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:]( &v17,  sel_initWithIdentityString_personaUniqueString_personaType_,  v11,  v12,  a6);
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identityBookmark = v13->_identityBookmark;
    v13->_identityBookmark = (NSString *)v14;
  }

  return v13;
}

- (void).cxx_destruct
{
}

+ (unsigned)classVersion
{
  return 2;
}

+ (Class)currentIdentityClass
{
  return (Class)objc_opt_class();
}

- (id)bundleIdentifier
{
  return self->_identityBookmark;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
  -[LSBundleIdentity encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt32:forKey:", objc_msgSend((id)objc_opt_class(), "classVersion"), @"version");
  [v4 encodeObject:self->_identityBookmark forKey:@"identityBookmark"];
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (LSApplicationIdentity)initWithIdentityString:(id)a3 parsedIdentityStringDictionary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = [v9 objectForKey:@"b"];
  id v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    if (v11)
    {
LABEL_9:
      id v15 = v12;
      goto LABEL_14;
    }
  }

  else
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0) {
      goto LABEL_9;
    }
  }

  _LSDefaultLog();
  v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:].cold.1( (uint64_t)v8,  v16,  v17,  v18,  v19,  v20,  v21,  v22);
  }

  id v15 = 0LL;
LABEL_14:
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = [v9 objectForKey:@"p"];
  v25 = (void *)v24;
  if (v23 && v24 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v25 = 0LL;
  }

  uint64_t v26 = objc_opt_class();
  uint64_t v27 = [v9 objectForKey:@"pt"];
  v28 = (void *)v27;
  if (v26 && v27 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v28 = 0LL;
  }

  uint64_t v29 = objc_opt_class();
  uint64_t v30 = [v9 objectForKey:@"v"];
  v31 = (void *)v30;
  if (v29 && v30 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v31 = 0LL;
  }

  if (!v15 || (v25 != 0LL) == (v28 == 0LL))
  {

    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -50LL,  (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]",  319LL,  0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    if (v28) {
      uint64_t v32 = [v28 unsignedIntegerValue];
    }
    else {
      uint64_t v32 = 4LL;
    }
    v38.receiver = self;
    v38.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
    v36 = -[LSBundleIdentity initWithIdentityString:personaUniqueString:personaType:]( &v38,  sel_initWithIdentityString_personaUniqueString_personaType_,  v8,  v25,  v32);
    v35 = v36;
    if (v36)
    {
      objc_storeStrong((id *)&v36->_identityBookmark, v15);
      id v34 = 0LL;
      goto LABEL_37;
    }

    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607688],  12LL,  (uint64_t)"-[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]",  314LL,  0LL);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  id v34 = v33;
  if (a5)
  {
    id v34 = v33;
    v35 = 0LL;
    *a5 = v34;
  }

  else
  {
    v35 = 0LL;
  }

- (LSApplicationIdentity)initWithIdentityString:(id)a3
{
  id v5 = a3;
  v6 = (void *)MEMORY[0x1896078D8];
  [v5 dataUsingEncoding:4];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = 0LL;
  [v6 JSONObjectWithData:v7 options:0 error:&v15];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v15;

  if (!v8)
  {

LABEL_5:
    [MEMORY[0x1896077D8] currentHandler];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 handleFailureInMethod:a2, 0, @"LSApplicationIdentity.mm", 339, @"Bad input initializing with identity string: %@", v9 object file lineNumber description];

    uint64_t v10 = 0LL;
    goto LABEL_6;
  }

  id v14 = v9;
  uint64_t v10 = -[LSApplicationIdentity initWithIdentityString:parsedIdentityStringDictionary:error:]( self,  "initWithIdentityString:parsedIdentityStringDictionary:error:",  v5,  v8,  &v14);
  id v11 = v14;

  id v9 = v11;
  if (!v10) {
    goto LABEL_5;
  }
LABEL_6:

  return v10;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 allowPlaceholder:(BOOL)a4 personaUniqueString:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v10,  v8,  a6);
  BOOL v13 = v12;
  if (a6 && !v12)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationIdentity initWithBundleIdentifier:allowPlaceholder:personaUniqueString:error:]",  348LL,  0LL);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  computeIdentityBookmark(v13);
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (_LSPersonaWithAttributes *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  0LL,  v11);
  computeIdentityString(v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:]( self,  "initWithIdentityBookmark:identityString:personaUniqueString:personaType:",  v14,  v16,  v11,  0LL);

  return v17;
}

- (LSApplicationIdentity)initWithBundleIdentifier:(id)a3 URL:(id)a4 personaUniqueString:(id)a5 personaType:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (!v11)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 handleFailureInMethod:a2 object:self file:@"LSApplicationIdentity.mm" lineNumber:364 description:@"bundleIdentifier was nil when creating application identity"];
  }

  if (v13)
  {
    if (a6 == 4)
    {
      _LSDefaultLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:].cold.2( v14,  v15,  v16,  v17,  v18,  v19,  v20,  v21);
      }
    }

    id v22 = v11;
    uint64_t v24 = (NSURL *)-[_LSPersonaWithAttributes initWithPersonaType:personaUniqueString:]( objc_alloc(&OBJC_CLASS____LSPersonaWithAttributes),  a6,  v13);
  }

  else
  {
    if (a6 != 4)
    {
      _LSDefaultLog();
      v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[LSApplicationIdentity initWithBundleIdentifier:URL:personaUniqueString:personaType:].cold.1( v25,  v26,  v27,  v28,  v29,  v30,  v31,  v32);
      }
    }

    id v33 = v11;
    uint64_t v24 = 0LL;
  }

  computeIdentityString((NSString *)v11, v24, v23);
  id v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[LSApplicationIdentity initWithIdentityBookmark:identityString:personaUniqueString:personaType:]( self,  "initWithIdentityBookmark:identityString:personaUniqueString:personaType:",  v11,  v34,  v13,  a6);

  return v35;
}

- (LSApplicationIdentity)initWithCoder:(id)a3
{
  v19[1] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
  id v5 = -[LSBundleIdentity initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    uint64_t v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ls_decodeObjectOfClasses:forKey:", v8, @"identityBookmark");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v9) {
        id Property = objc_getProperty(v9, v10, 16LL, 1);
      }
      else {
        id Property = 0LL;
      }
      id v12 = (NSString *)Property;
    }

    else
    {
      id v12 = v9;
    }

    identityBookmark = v5->_identityBookmark;
    v5->_identityBookmark = v12;

    if (!v5->_identityBookmark)
    {

      uint64_t v18 = *MEMORY[0x189607490];
      v19[0] = @"could not decode identity (missing bundleID?)";
      [MEMORY[0x189603F68] dictionaryWithObjects:v19 forKeys:&v18 count:1];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      _LSMakeNSErrorImpl( @"LSApplicationWorkspaceErrorDomain",  118LL,  (uint64_t)"-[LSApplicationIdentity initWithCoder:]",  414LL,  v14);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 failWithError:v15];

      id v5 = 0LL;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
  return -[NSString hash](self->_identityBookmark, "hash") ^ __ROR8__(-[LSBundleIdentity hash](&v3, sel_hash), 56);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___LSApplicationIdentity;
    if (-[LSBundleIdentity isEqual:](&v8, sel_isEqual_, v5)) {
      char v6 = -[NSString isEqual:](self->_identityBookmark, "isEqual:", v5[4]);
    }
    else {
      char v6 = 0;
    }
  }

  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)findApplicationRecordWithError:(id *)a3
{
  return -[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:]( self,  "findApplicationRecordFetchingPlaceholder:error:",  1LL,  a3);
}

- (id)findApplicationRecordFetchingPlaceholder:(int64_t)a3 error:(id *)a4
{
  id v5 = -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:fetchingPlaceholder:error:",  self->_identityBookmark,  a3,  a4);
  char v6 = v5;
  if (a4 && !v5)
  {
    _LSMakeNSErrorImpl( (void *)*MEMORY[0x189607670],  -10814LL,  (uint64_t)"-[LSApplicationIdentity findApplicationRecordFetchingPlaceholder:error:]",  471LL,  0LL);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)needsMigration
{
  return [(id)objc_opt_class() classVersion] != 2;
}

+ (id)enumeratorWithOptions:(unint64_t)a3
{
  return  -[LSApplicationIdentityEnumerator initWithAppEnumerationOptions:]( objc_alloc(&OBJC_CLASS___LSApplicationIdentityEnumerator),  "initWithAppEnumerationOptions:",  a3);
}

+ (id)bundleIdentifierForIdentityString:(id)a3 error:(id *)a4
{
  id v5 = (void *)MEMORY[0x1896078D8];
  [a3 dataUsingEncoding:4];
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v13 = 0LL;
  [v5 JSONObjectWithData:v6 options:0 error:&v13];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v13;

  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = [v7 objectForKey:@"b"];
  id v11 = (void *)v10;
  if (v9 && v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_6:
    id v11 = 0LL;
  }

  if (a4 && !v11) {
    *a4 = v8;
  }

  return v11;
}

+ (id)identityStringsForApplicationWithBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v16 = 0LL;
  char v6 = -[LSApplicationRecord initWithBundleIdentifier:fetchingPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:fetchingPlaceholder:error:",  v5,  1LL,  &v16);
  id v15 = v16;
  if (!v6)
  {
    id v8 = 0LL;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }

  -[LSApplicationRecord identities](v6, "identities", v15);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0LL;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * v12) identityString];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 addObject:v13];

        ++v12;
      }

      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v10);
  }

  if (a4)
  {
LABEL_12:
    if (!v8) {
      *a4 = v15;
    }
  }

+ (BOOL)personaWithUniqueString:(id)a3 getPersonaType:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  [(id)getUMUserPersonaAttributesClass() personaAttributesForPersonaUniqueString:v7 withError:a5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v8;
  if (v8) {
    *a4 = LSPersonaTypeForPersonaAttributes(v8);
  }

  return v9 != 0LL;
}

- (void)initWithIdentityString:(uint64_t)a3 parsedIdentityStringDictionary:(uint64_t)a4 error:(uint64_t)a5 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)initWithBundleIdentifier:(uint64_t)a3 URL:(uint64_t)a4 personaUniqueString:(uint64_t)a5 personaType:(uint64_t)a6 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end
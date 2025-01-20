@interface CUKeychainItem
- (BOOL)_updateWithAttributesDictionary:(id)a3 flags:(unsigned int)a4 error:(id *)a5;
- (BOOL)invisible;
- (BOOL)isEqualToKeychainItem:(id)a3 flags:(unsigned int)a4;
- (BOOL)legacy;
- (NSArray)removedMetadata;
- (NSData)persistentRef;
- (NSDate)dateCreated;
- (NSDate)dateModified;
- (NSDictionary)metadata;
- (NSDictionary)secrets;
- (NSString)accessGroup;
- (NSString)identifier;
- (NSString)name;
- (NSString)type;
- (NSString)userDescription;
- (NSString)viewHint;
- (id)_attributesDictionaryWithFlags:(unsigned int)a3 error:(id *)a4;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (int)accessibleType;
- (int)syncType;
- (void)_mergeItem:(id)a3;
- (void)setAccessGroup:(id)a3;
- (void)setAccessibleType:(int)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvisible:(BOOL)a3;
- (void)setLegacy:(BOOL)a3;
- (void)setMetadata:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentRef:(id)a3;
- (void)setRemovedMetadata:(id)a3;
- (void)setSecrets:(id)a3;
- (void)setSyncType:(int)a3;
- (void)setType:(id)a3;
- (void)setUserDescription:(id)a3;
- (void)setViewHint:(id)a3;
@end

@implementation CUKeychainItem

- (id)description
{
  return -[CUKeychainItem descriptionWithLevel:](self, "descriptionWithLevel:", 50LL);
}

- (id)descriptionWithLevel:(int)a3
{
  if ((a3 & 0x8000000) != 0)
  {
    v5 = 0LL;
    if ((a3 & 0x800000) != 0) {
      goto LABEL_3;
    }
  }

  else
  {
    CFMutableStringRef v62 = 0LL;
    NSAppendPrintF(&v62);
    v5 = v62;
    if ((a3 & 0x800000) != 0)
    {
LABEL_3:
      v61 = v5;
      identifier = self->_identifier;
      v6 = (id *)&v61;
      v7 = &v61;
      goto LABEL_6;
    }
  }

  v60 = v5;
  identifier = self->_identifier;
  v6 = (id *)&v60;
  v7 = &v60;
LABEL_6:
  NSAppendPrintF(v7);
  v8 = (__CFString *)*v6;

  type = self->_type;
  if (type)
  {
    CFMutableStringRef v59 = v8;
    identifier = type;
    NSAppendPrintF(&v59);
    v10 = v59;

    v8 = v10;
  }

  v11 = self->_name;
  v12 = v11;
  if (v11)
  {
    if ((a3 & 0x800000) != 0)
    {
      v58 = v8;
      identifier = v11;
      v13 = (id *)&v58;
      v14 = &v58;
    }

    else
    {
      v57 = v8;
      identifier = v11;
      v13 = (id *)&v57;
      v14 = &v57;
    }

    NSAppendPrintF(v14);
    v15 = (__CFString *)*v13;

    v8 = v15;
  }

  unsigned int v16 = a3;
  if (a3 < 0x1Fu)
  {
    dateCreated = self->_dateCreated;
    if (dateCreated)
    {
      CFMutableStringRef v56 = v8;
      identifier = dateCreated;
      NSAppendPrintF(&v56);
      v18 = v56;

      v8 = v18;
    }

    dateModified = self->_dateModified;
    if (dateModified)
    {
      CFMutableStringRef v55 = v8;
      identifier = dateModified;
      NSAppendPrintF(&v55);
      v20 = v55;

      uint64_t v21 = 100LL;
      v8 = v20;
    }

    else
    {
      uint64_t v21 = 100LL;
    }

    goto LABEL_27;
  }

  if (a3 < 0x29u)
  {
    uint64_t v21 = 16LL;
LABEL_27:
    metadata = self->_metadata;
    if (metadata)
    {
      CFMutableStringRef v54 = v8;
      identifier = (NSString *)v21;
      v44 = metadata;
      NSAppendPrintF(&v54);
      v33 = v54;

      v8 = v33;
    }

    persistentRef = self->_persistentRef;
    if (persistentRef)
    {
      CFMutableStringRef v53 = v8;
      identifier = (NSString *)v21;
      v45 = persistentRef;
      NSAppendPrintF(&v53);
      v35 = v53;

      v8 = v35;
    }

    v36 = self->_secrets;
    v29 = v36;
    if (!v36) {
      goto LABEL_36;
    }
    if ((a3 & 0x800000) != 0)
    {
      v52 = v8;
      v30 = (id *)&v52;
      v31 = &v52;
    }

    else
    {
      v51 = v8;
      -[NSDictionary count](v36, "count", identifier);
      v30 = (id *)&v51;
      v31 = &v51;
    }

- (BOOL)isEqualToKeychainItem:(id)a3 flags:(unsigned int)a4
{
  char v4 = a4;
  id v6 = a3;
  identifier = self->_identifier;
  [v6 identifier];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = identifier;
  v10 = v8;
  if (v9 == v10)
  {
  }

  else
  {
    v11 = v10;
    if ((v9 == 0LL) == (v10 != 0LL)) {
      goto LABEL_32;
    }
    int v12 = -[NSDictionary isEqual:](v9, "isEqual:", v10);

    if (!v12) {
      goto LABEL_25;
    }
  }

  int invisible = self->_invisible;
  if (invisible == [v6 invisible])
  {
    type = self->_type;
    [v6 type];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = type;
    unsigned int v16 = v15;
    if (v9 == v16)
    {
    }

    else
    {
      v11 = v16;
      if ((v9 == 0LL) == (v16 != 0LL)) {
        goto LABEL_32;
      }
      int v17 = -[NSDictionary isEqual:](v9, "isEqual:", v16);

      if (!v17) {
        goto LABEL_25;
      }
    }

    name = self->_name;
    [v6 name];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = name;
    v20 = v19;
    if (v9 == v20)
    {
    }

    else
    {
      v11 = v20;
      if ((v9 == 0LL) == (v20 != 0LL)) {
        goto LABEL_32;
      }
      int v21 = -[NSDictionary isEqual:](v9, "isEqual:", v20);

      if (!v21) {
        goto LABEL_25;
      }
    }

    metadata = self->_metadata;
    [v6 metadata];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = metadata;
    v24 = v23;
    if (v9 == v24)
    {
    }

    else
    {
      v11 = v24;
      if ((v9 == 0LL) == (v24 != 0LL)) {
        goto LABEL_32;
      }
      int v25 = -[NSDictionary isEqual:](v9, "isEqual:", v24);

      if (!v25) {
        goto LABEL_25;
      }
    }

    userDescription = self->_userDescription;
    [v6 userDescription];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = userDescription;
    v28 = v27;
    if (v9 == v28)
    {
    }

    else
    {
      v11 = v28;
      if ((v9 == 0LL) == (v28 != 0LL)) {
        goto LABEL_32;
      }
      int v29 = -[NSDictionary isEqual:](v9, "isEqual:", v28);

      if (!v29) {
        goto LABEL_25;
      }
    }

    if ((v4 & 1) == 0)
    {
      char v30 = 1;
      goto LABEL_34;
    }

    secrets = self->_secrets;
    [v6 secrets];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = secrets;
    v33 = v32;
    if (v9 == v33)
    {
      char v30 = 1;
      v11 = v9;
      goto LABEL_33;
    }

    v11 = v33;
    if ((v9 == 0LL) != (v33 != 0LL))
    {
      char v30 = -[NSDictionary isEqual:](v9, "isEqual:", v33);
LABEL_33:

      goto LABEL_34;
    }

- (id)_attributesDictionaryWithFlags:(unsigned int)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(MEMORY[0x189603FC8]);
  v8 = v7;
  if ((a3 & 0x80000) == 0)
  {
    accessGroup = self->_accessGroup;
    if (accessGroup) {
      [v7 setObject:accessGroup forKeyedSubscript:*MEMORY[0x18960B820]];
    }
  }

  v10 = (void *)MEMORY[0x18960B860];
  switch(self->_accessibleType)
  {
    case 0:
      goto LABEL_14;
    case 1:
      goto LABEL_13;
    case 2:
      v10 = (void *)MEMORY[0x18960B830];
      goto LABEL_13;
    case 3:
      v10 = (void *)MEMORY[0x18960B840];
      goto LABEL_13;
    case 4:
      v10 = (void *)MEMORY[0x18960B858];
      goto LABEL_13;
    case 5:
      v10 = (void *)MEMORY[0x18960B868];
      goto LABEL_13;
    case 6:
      v10 = (void *)MEMORY[0x18960B838];
      goto LABEL_13;
    case 7:
      v10 = (void *)MEMORY[0x18960B848];
LABEL_13:
      [v8 setObject:*v10 forKeyedSubscript:*MEMORY[0x18960B828]];
LABEL_14:
      if ((a3 & 0x80000) == 0) {
        [v8 setObject:*MEMORY[0x18960BB48] forKeyedSubscript:*MEMORY[0x18960BB38]];
      }
      identifier = self->_identifier;
      if (identifier) {
        [v8 setObject:identifier forKeyedSubscript:*MEMORY[0x18960B870]];
      }
      if (self->_invisible) {
        [v8 setObject:MEMORY[0x189604A88] forKeyedSubscript:*MEMORY[0x18960B938]];
      }
      v13 = self->_metadata;
      v14 = v13;
      if (!v13) {
        goto LABEL_23;
      }
      CFMutableDataRef DataMutable = OPACKEncoderCreateDataMutable((const __CFString *)v13, 8, (int *)&v31);
      if (DataMutable)
      {
        CFMutableDataRef v16 = DataMutable;
        [v8 setObject:DataMutable forKeyedSubscript:*MEMORY[0x18960B928]];

LABEL_23:
        name = self->_name;
        if (name) {
          [v8 setObject:name forKeyedSubscript:*MEMORY[0x18960B9F8]];
        }
        persistentRef = self->_persistentRef;
        if (persistentRef) {
          [v8 setObject:persistentRef forKeyedSubscript:*MEMORY[0x18960BE80]];
        }
        v19 = self->_secrets;
        v20 = v19;
        if (v19)
        {
          CFMutableDataRef v21 = OPACKEncoderCreateDataMutable((const __CFString *)v19, 8, (int *)&v30);
          if (!v21)
          {
            if (a4)
            {
              if (v30) {
                uint64_t v25 = v30;
              }
              else {
                uint64_t v25 = 4294960596LL;
              }
              NSErrorWithOSStatusF((const char *)v25);
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }

- (void)_mergeItem:(id)a3
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 accessGroup];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5) {
    objc_storeStrong((id *)&self->_accessGroup, v5);
  }

  int v6 = [v4 accessibleType];
  if (v6) {
    self->_accessibleType = v6;
  }
  [v4 identifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7) {
    objc_storeStrong((id *)&self->_identifier, v7);
  }

  self->_int invisible = [v4 invisible];
  [v4 metadata];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)-[NSDictionary mutableCopy](self->_metadata, "mutableCopy");
    v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    int v12 = v11;

    [v12 addEntriesFromDictionary:v8];
    v13 = (NSDictionary *)[v12 copy];
    metadata = self->_metadata;
    self->_metadata = v13;
  }

  [v4 removedMetadata];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    CFMutableDataRef v16 = (void *)-[NSDictionary mutableCopy](self->_metadata, "mutableCopy");
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0LL; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v17);
          }
          objc_msgSend( v16,  "setObject:forKeyedSubscript:",  0,  *(void *)(*((void *)&v36 + 1) + 8 * i),  (void)v36);
        }

        uint64_t v19 = [v17 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }

      while (v19);
    }

    CFMutableDataRef v22 = (NSDictionary *)[v16 copy];
    v23 = self->_metadata;
    self->_metadata = v22;
  }

  [v4 name];
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24) {
    objc_storeStrong((id *)&self->_name, v24);
  }

  [v4 secrets];
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)-[NSDictionary mutableCopy](self->_secrets, "mutableCopy");
    v27 = v26;
    if (v26) {
      id v28 = v26;
    }
    else {
      id v28 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    int v29 = v28;

    [v29 addEntriesFromDictionary:v25];
    unsigned int v30 = (NSDictionary *)[v29 copy];
    secrets = self->_secrets;
    self->_secrets = v30;
  }

  int v32 = objc_msgSend(v4, "syncType", (void)v36);
  if (v32) {
    self->_syncType = v32;
  }
  [v4 type];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33) {
    objc_storeStrong((id *)&self->_type, v33);
  }

  [v4 userDescription];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34) {
    objc_storeStrong((id *)&self->_userDescription, v34);
  }

  [v4 viewHint];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35) {
    objc_storeStrong((id *)&self->_viewHint, v35);
  }
}

- (BOOL)_updateWithAttributesDictionary:(id)a3 flags:(unsigned int)a4 error:(id *)a5
{
  char v6 = a4;
  v72[1] = *MEMORY[0x1895F89C0];
  v8 = (const __CFDictionary *)a3;
  v9 = (const void *)*MEMORY[0x18960B820];
  CFTypeID TypeID = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v9, TypeID, 0LL);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11) {
    objc_storeStrong((id *)&self->_accessGroup, v11);
  }

  int v12 = (const void *)*MEMORY[0x18960B828];
  CFTypeID v13 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v12, v13, 0LL);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ([v14 isEqual:*MEMORY[0x18960B860]])
    {
      int v16 = 1;
    }

    else if ([v15 isEqual:*MEMORY[0x18960B830]])
    {
      int v16 = 2;
    }

    else if ([v15 isEqual:*MEMORY[0x18960B840]])
    {
      int v16 = 3;
    }

    else if ([v15 isEqual:*MEMORY[0x18960B858]])
    {
      int v16 = 4;
    }

    else if ([v15 isEqual:*MEMORY[0x18960B868]])
    {
      int v16 = 5;
    }

    else if ([v15 isEqual:*MEMORY[0x18960B838]])
    {
      int v16 = 6;
    }

    else
    {
      if (([v15 isEqual:*MEMORY[0x18960B848]] & 1) == 0)
      {
        if (a5)
        {
          NSErrorWithOSStatusF((const char *)0xFFFFE5B1LL);
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_66;
      }

      int v16 = 7;
    }

    self->_accessibleType = v16;
  }

  id v17 = (const void *)*MEMORY[0x18960B908];
  CFTypeID v18 = CFDateGetTypeID();
  CFDictionaryGetTypedValue(v8, v17, v18, 0LL);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19) {
    objc_storeStrong((id *)&self->_dateCreated, v19);
  }

  uint64_t v20 = (const void *)*MEMORY[0x18960BA00];
  CFTypeID v21 = CFDateGetTypeID();
  CFDictionaryGetTypedValue(v8, v20, v21, 0LL);
  CFMutableDataRef v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22) {
    objc_storeStrong((id *)&self->_dateModified, v22);
  }

  v23 = (const void *)*MEMORY[0x18960B870];
  CFTypeID v24 = CFStringGetTypeID();
  CFDictionaryGetTypedValue(v8, v23, v24, 0LL);
  uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25) {
    objc_storeStrong((id *)&self->_identifier, v25);
  }

  self->_int invisible = CFDictionaryGetInt64(v8, (const void *)*MEMORY[0x18960B938], 0LL) != 0;
  v26 = (const void *)*MEMORY[0x18960B928];
  CFTypeID v27 = CFDataGetTypeID();
  CFDictionaryGetTypedValue(v8, v26, v27, 0LL);
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v28;
  if (v28 && [v28 length])
  {
    int v29 = (NSDictionary *)OPACKDecodeData((const __CFData *)v15, 8, &v62);
    if (!v29)
    {
      if ((v6 & 4) == 0)
      {
        if (a5)
        {
          if (v62) {
            uint64_t v30 = v62;
          }
          else {
            uint64_t v30 = 4294960534LL;
          }
LABEL_52:
          NSErrorWithOSStatusF((const char *)v30);
          int v29 = 0LL;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_65;
        }

        goto LABEL_57;
      }

      v71 = @"_legacyData";
      v72[0] = v15;
      [MEMORY[0x189603F68] dictionaryWithObjects:v72 forKeys:&v71 count:1];
      int v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    }

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((v6 & 4) == 0)
      {
        if (!a5)
        {
LABEL_65:

LABEL_66:
          BOOL v49 = 0;
          goto LABEL_76;
        }

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (void)setAccessGroup:(id)a3
{
}

- (int)accessibleType
{
  return self->_accessibleType;
}

- (void)setAccessibleType:(int)a3
{
  self->_accessibleType = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateModified
{
  return self->_dateModified;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BOOL)invisible
{
  return self->_invisible;
}

- (void)setInvisible:(BOOL)a3
{
  self->_int invisible = a3;
}

- (BOOL)legacy
{
  return self->_legacy;
}

- (void)setLegacy:(BOOL)a3
{
  self->_legacy = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (NSArray)removedMetadata
{
  return self->_removedMetadata;
}

- (void)setRemovedMetadata:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSData)persistentRef
{
  return self->_persistentRef;
}

- (void)setPersistentRef:(id)a3
{
}

- (NSDictionary)secrets
{
  return self->_secrets;
}

- (void)setSecrets:(id)a3
{
}

- (int)syncType
{
  return self->_syncType;
}

- (void)setSyncType:(int)a3
{
  self->_syncType = a3;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)userDescription
{
  return self->_userDescription;
}

- (void)setUserDescription:(id)a3
{
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (void)setViewHint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
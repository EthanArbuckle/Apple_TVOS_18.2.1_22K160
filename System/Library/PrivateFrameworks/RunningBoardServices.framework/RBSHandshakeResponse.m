@interface RBSHandshakeResponse
+ (BOOL)supportsRBSXPCSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)assertionErrorsByOldIdentifier;
- (NSDictionary)assertionIdentifiersByOldIdentifier;
- (NSDictionary)managedEndpointByLaunchIdentifier;
- (RBSHandshakeResponse)initWithRBSXPCCoder:(id)a3;
- (RBSProcessHandle)handle;
- (void)encodeWithRBSXPCCoder:(id)a3;
- (void)setAssertionErrorsByOldIdentifier:(id)a3;
- (void)setAssertionIdentifiersByOldIdentifier:(id)a3;
- (void)setHandle:(id)a3;
- (void)setManagedEndpointByLaunchIdentifier:(id)a3;
@end

@implementation RBSHandshakeResponse

- (BOOL)isEqual:(id)a3
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  v4 = (RBSHandshakeResponse *)a3;
  if (self == v4) {
    goto LABEL_29;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class())
  {
LABEL_3:
    BOOL v6 = 0;
    goto LABEL_30;
  }

  handle = self->_handle;
  v8 = v4->_handle;
  if (handle != v8)
  {
    BOOL v6 = 0;
    if (!handle || !v8) {
      goto LABEL_30;
    }
    if (!-[RBSProcessHandle isEqual:](handle, "isEqual:")) {
      goto LABEL_3;
    }
  }

  assertionIdentifiersByOldIdentifier = self->_assertionIdentifiersByOldIdentifier;
  v10 = v4->_assertionIdentifiersByOldIdentifier;
  if (assertionIdentifiersByOldIdentifier != v10)
  {
    BOOL v6 = 0;
    if (!assertionIdentifiersByOldIdentifier || !v10) {
      goto LABEL_30;
    }
  }

  assertionErrorsByOldIdentifier = self->_assertionErrorsByOldIdentifier;
  v12 = v4->_assertionErrorsByOldIdentifier;
  if (assertionErrorsByOldIdentifier != v12)
  {
    BOOL v6 = 0;
    if (!assertionErrorsByOldIdentifier || !v12) {
      goto LABEL_30;
    }
  }

  managedEndpointByLaunchIdentifier = self->_managedEndpointByLaunchIdentifier;
  v14 = (const __CFDictionary *)v4->_managedEndpointByLaunchIdentifier;
  if (managedEndpointByLaunchIdentifier == (NSDictionary *)v14)
  {
LABEL_29:
    BOOL v6 = 1;
    goto LABEL_30;
  }

  BOOL v6 = 0;
  if (managedEndpointByLaunchIdentifier && v14)
  {
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)managedEndpointByLaunchIdentifier);
    if (Count != CFDictionaryGetCount(v14)) {
      goto LABEL_3;
    }
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v16 = managedEndpointByLaunchIdentifier;
    uint64_t v17 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0LL; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v22 = -[NSDictionary objectForKey:](v16, "objectForKey:", v21, (void)v26);
          v23 = -[__CFDictionary objectForKey:](v14, "objectForKey:", v21);
          int v24 = [v22 _isEquivalentToEndpoint:v23];

          if (!v24)
          {
            BOOL v6 = 0;
            goto LABEL_32;
          }
        }

        uint64_t v18 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v26,  v30,  16LL);
        if (v18) {
          continue;
        }
        break;
      }
    }

    BOOL v6 = 1;
LABEL_32:
  }

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  handle = self->_handle;
  id v9 = a3;
  -[RBSProcessHandle fullEncode:forKey:](handle, "fullEncode:forKey:", v9, @"_handle");
  -[NSDictionary allKeys](self->_assertionIdentifiersByOldIdentifier, "allKeys");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v5 forKey:@"success-keys"];

  -[NSDictionary allValues](self->_assertionIdentifiersByOldIdentifier, "allValues");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 encodeObject:v6 forKey:@"success-values"];
  v7 = -[NSDictionary allKeys](self->_assertionErrorsByOldIdentifier, "allKeys");
  [v9 encodeObject:v7 forKey:@"fail-keys"];
  v8 = -[NSDictionary allValues](self->_assertionErrorsByOldIdentifier, "allValues");
  [v9 encodeObject:v8 forKey:@"fail-values"];

  [v9 encodeDictionary:self->_managedEndpointByLaunchIdentifier forKey:@"_managedEndpointByLaunchIdentifier"];
}

- (RBSHandshakeResponse)initWithRBSXPCCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___RBSHandshakeResponse;
  uint64_t v5 = -[RBSHandshakeResponse init](&v25, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_handle"];
    handle = v5->_handle;
    v5->_handle = (RBSProcessHandle *)v6;

    if ([v4 containsValueForKey:@"success-values"])
    {
      v8 = (void *)MEMORY[0x189603F68];
      uint64_t v9 = objc_opt_class();
      [v4 decodeCollectionOfClass:v9 containingClass:objc_opt_class() forKey:@"success-values"];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = objc_opt_class();
      [v4 decodeCollectionOfClass:v11 containingClass:objc_opt_class() forKey:@"success-keys"];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = [v8 dictionaryWithObjects:v10 forKeys:v12];
      assertionIdentifiersByOldIdentifier = v5->_assertionIdentifiersByOldIdentifier;
      v5->_assertionIdentifiersByOldIdentifier = (NSDictionary *)v13;
    }

    if ([v4 containsValueForKey:@"fail-values"])
    {
      v15 = (void *)MEMORY[0x189603F68];
      uint64_t v16 = objc_opt_class();
      [v4 decodeCollectionOfClass:v16 containingClass:objc_opt_class() forKey:@"fail-values"];
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = objc_opt_class();
      [v4 decodeCollectionOfClass:v18 containingClass:objc_opt_class() forKey:@"fail-keys"];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v15 dictionaryWithObjects:v17 forKeys:v19];
      assertionErrorsByOldIdentifier = v5->_assertionErrorsByOldIdentifier;
      v5->_assertionErrorsByOldIdentifier = (NSDictionary *)v20;
    }

    uint64_t v22 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"_managedEndpointByLaunchIdentifier"];
    managedEndpointByLaunchIdentifier = v5->_managedEndpointByLaunchIdentifier;
    v5->_managedEndpointByLaunchIdentifier = (NSDictionary *)v22;
  }

  return v5;
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
}

- (NSDictionary)assertionIdentifiersByOldIdentifier
{
  return self->_assertionIdentifiersByOldIdentifier;
}

- (void)setAssertionIdentifiersByOldIdentifier:(id)a3
{
}

- (NSDictionary)assertionErrorsByOldIdentifier
{
  return self->_assertionErrorsByOldIdentifier;
}

- (void)setAssertionErrorsByOldIdentifier:(id)a3
{
}

- (NSDictionary)managedEndpointByLaunchIdentifier
{
  return self->_managedEndpointByLaunchIdentifier;
}

- (void)setManagedEndpointByLaunchIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface NSItemProvider
+ (BOOL)supportsSecureCoding;
- (BOOL)_hasRepresentationConformingToType:(id)a3;
- (BOOL)_hasRepresentationOfType:(id)a3;
- (BOOL)canLoadObjectOfClass:(id)aClass;
- (BOOL)hasItemConformingToTypeIdentifier:(NSString *)typeIdentifier;
- (BOOL)hasRepresentationConformingToTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions;
- (NSArray)_representations;
- (NSArray)registeredTypeIdentifiers;
- (NSArray)registeredTypeIdentifiersWithFileOptions:(NSItemProviderFileOptions)fileOptions;
- (NSDictionary)userInfo;
- (NSItemProvider)init;
- (NSItemProvider)initWithCoder:(id)a3;
- (NSItemProvider)initWithContentsOfURL:(NSURL *)fileURL;
- (NSItemProvider)initWithItem:(id)item typeIdentifier:(NSString *)typeIdentifier;
- (NSItemProvider)initWithObject:(id)object;
- (NSItemProviderDataTransferDelegate)dataTransferDelegate;
- (NSItemProviderLoadHandler)previewImageHandler;
- (NSMutableDictionary)_preferredRepresentationByType;
- (NSMutableDictionary)_representationByType;
- (NSMutableOrderedSet)_typeOrder;
- (NSProgress)loadDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadInPlaceFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler;
- (NSProgress)loadObjectOfClass:(id)aClass completionHandler:(void *)completionHandler;
- (NSString)_sanitizedSuggestedName;
- (NSString)suggestedName;
- (NSUUID)_UUID;
- (_NSItemProviderLoading)_loadOperator;
- (id)_availableTypes;
- (id)_availableTypesWithFilterBlock:(id)a3;
- (id)_loadObjectOfClass:(Class)a3 options:(id)a4 completionHandler:(id)a5;
- (id)_metadataValueForKey:(id)a3;
- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6;
- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3;
- (id)_representationConformingToType:(id)a3;
- (id)_representationForType:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)representations;
- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 visibility:(int64_t)a5 loader:(id)a6;
- (void)_addRepresentationType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5;
- (void)_commonInitGenerateUUID:(BOOL)a3;
- (void)_loadItemOfClass:(Class)a3 forTypeIdentifier:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7;
- (void)_loadItemOfClass:(Class)a3 withLoadHandler:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7;
- (void)_loadPreviewImageOfClass:(Class)a3 options:(id)a4 coerceForCoding:(BOOL)a5 completionHandler:(id)a6;
- (void)_setItemRepresentation:(id)a3;
- (void)_setMetadataValue:(id)a3 forKey:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadItemForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler;
- (void)loadPreviewImageWithOptions:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler;
- (void)registerDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)registerFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)registerItemForTypeIdentifier:(NSString *)typeIdentifier loadHandler:(NSItemProviderLoadHandler)loadHandler;
- (void)registerObject:(id)object visibility:(NSItemProviderRepresentationVisibility)visibility;
- (void)registerObjectOfClass:(id)aClass visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler;
- (void)setDataTransferDelegate:(id)a3;
- (void)setPreviewImageHandler:(NSItemProviderLoadHandler)previewImageHandler;
- (void)setSuggestedName:(NSString *)suggestedName;
- (void)setUserInfo:(id)a3;
- (void)set_loadOperator:(id)a3;
- (void)set_preferredRepresentationByType:(id)a3;
- (void)set_representationByType:(id)a3;
- (void)set_typeOrder:(id)a3;
@end

@implementation NSItemProvider

- (void)_commonInitGenerateUUID:(BOOL)a3
{
  BOOL v3 = a3;
  self->_typeOrder = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x189603FD0]);
  self->_representationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  self->_preferredRepresentationByType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  self->_metadata = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
  if (v3) {
    self->_UUID = objc_alloc_init(&OBJC_CLASS___NSUUID);
  }
}

- (NSItemProvider)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSItemProvider;
  v2 = -[NSItemProvider init](&v5, sel_init);
  BOOL v3 = v2;
  if (v2) {
    -[NSItemProvider _commonInitGenerateUUID:](v2, "_commonInitGenerateUUID:", 1LL);
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSItemProvider;
  -[NSItemProvider dealloc](&v3, sel_dealloc);
}

- (id)_availableTypes
{
  return (id)objc_msgSend((id)-[NSMutableOrderedSet array](self->_typeOrder, "array"), "copy");
}

- (BOOL)_hasRepresentationOfType:(id)a3
{
  return -[NSMutableOrderedSet containsObject:](-[NSItemProvider _typeOrder](self, "_typeOrder"), "containsObject:", a3);
}

- (BOOL)_hasRepresentationConformingToType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v4 = -[NSItemProvider _typeOrder](self, "_typeOrder");
  uint64_t v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (((uint64_t (*)(uint64_t, uint64_t))off_18C4917C0)( *(void *)(*((void *)&v11 + 1) + 8 * v8),  (uint64_t)a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return v5;
}

- (id)_availableTypesWithFilterBlock:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = -[NSItemProvider _availableTypes](self, "_availableTypes");
  uint64_t v6 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        id v12 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", v11);
      }

      uint64_t v8 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
    }

    while (v8);
  }

  return v6;
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 visibility:(int64_t)a5 loader:(id)a6
{
  uint64_t v8 = -[NSItemProviderRepresentation initWithType_v2:preferredRepresentation:loader:]( objc_alloc(&OBJC_CLASS___NSItemProviderRepresentation),  "initWithType_v2:preferredRepresentation:loader:",  a3,  a4,  a6);
  -[NSItemProviderRepresentation setVisibility:](v8, "setVisibility:", a5);
  -[NSItemProvider _setItemRepresentation:](self, "_setItemRepresentation:", v8);
}

- (void)_addRepresentationType_v2:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
}

- (void)_addRepresentationType:(id)a3 preferredRepresentation:(int64_t)a4 loader:(id)a5
{
  v5[5] = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke;
  v5[3] = &unk_189C9FFE0;
  v5[4] = a5;
  -[NSItemProvider _addRepresentationType_v2:preferredRepresentation:loader:]( self,  "_addRepresentationType_v2:preferredRepresentation:loader:",  a3,  a4,  v5);
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2;
  v8[3] = &unk_189C9FFB8;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, uint64_t, void *, uint64_t, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  v8,  a4,  a5,  a6);
}

uint64_t __72__NSItemProvider__addRepresentationType_preferredRepresentation_loader___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5)
{
  return (*(uint64_t (**)(void, NSItemRepresentationLoadResult *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  a2,  a3,  a5,  a4));
}

- (id)representations
{
  return (id)-[NSMutableDictionary allValues](self->_representationByType, "allValues");
}

- (id)_representationConformingToType:(id)a3
{
  id result = (id)_bestMatchType( (uint64_t)a3,  (void *)-[NSMutableOrderedSet array](-[NSItemProvider _typeOrder](self, "_typeOrder"), "array"),  (uint64_t)&__block_literal_global_285);
  if (result) {
    return -[NSItemProvider _representationForType:](self, "_representationForType:", result);
  }
  return result;
}

- (void)_setItemRepresentation:(id)a3
{
  uint64_t v5 = [a3 typeIdentifier];
  -[NSMutableOrderedSet addObject:](self->_typeOrder, "addObject:", v5);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_representationByType,  "setObject:forKeyedSubscript:",  a3,  v5);
  uint64_t v6 = (void *)-[NSMutableDictionary objectForKeyedSubscript:]( self->_preferredRepresentationByType,  "objectForKeyedSubscript:",  v5);
  if (v6) {
    objc_msgSend(a3, "setPreferredRepresentation:", objc_msgSend(v6, "unsignedIntegerValue"));
  }
  else {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_preferredRepresentationByType,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [a3 preferredRepresentation]),  v5);
  }
}

- (id)_representationForType:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:]( -[NSItemProvider _representationByType](self, "_representationByType"),  "objectForKeyedSubscript:",  a3);
}

- (id)_metadataValueForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", a3);
}

- (void)_setMetadataValue:(id)a3 forKey:(id)a4
{
  metadata = self->_metadata;
  if (a3) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](metadata, "setObject:forKeyedSubscript:", a3, a4);
  }
  else {
    -[NSMutableDictionary removeObjectForKey:](metadata, "removeObjectForKey:", a4);
  }
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setSuggestedName:(NSString *)suggestedName
{
  uint64_t v5 = self->_suggestedName;
  if (v5 != suggestedName)
  {
    self->_suggestedName = (NSString *)-[NSString copy](suggestedName, "copy");

    self->_sanitizedSuggestedName = 0LL;
  }

  objc_sync_exit(self);
}

- (NSString)_sanitizedSuggestedName
{
  sanitizedSuggestedName = self->_sanitizedSuggestedName;
  if (sanitizedSuggestedName)
  {
    uint64_t v4 = sanitizedSuggestedName;
  }

  else
  {
    suggestedName = self->_suggestedName;
    if (suggestedName)
    {
      uint64_t v4 = _NSIPSanitizedFilename(suggestedName);
      self->_sanitizedSuggestedName = v4;
    }

    else
    {
      uint64_t v4 = 0LL;
    }
  }

  objc_sync_exit(self);
  return v4;
}

- (NSArray)registeredTypeIdentifiersWithFileOptions:(NSItemProviderFileOptions)fileOptions
{
  if ((fileOptions & 1) != 0) {
    return (NSArray *)-[NSItemProvider _availableTypesWithFilterBlock:]( self,  "_availableTypesWithFilterBlock:",  &__block_literal_global_42);
  }
  else {
    return (NSArray *)-[NSItemProvider _availableTypes](self, "_availableTypes");
  }
}

BOOL __59__NSItemProvider_registeredTypeIdentifiersWithFileOptions___block_invoke(uint64_t a1, void *a2)
{
  return [a2 preferredRepresentation] == 2;
}

- (NSArray)registeredTypeIdentifiers
{
  return -[NSItemProvider registeredTypeIdentifiersWithFileOptions:]( self,  "registeredTypeIdentifiersWithFileOptions:",  0LL);
}

- (BOOL)hasRepresentationConformingToTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if ((fileOptions & 1) != 0)
  {
    id v7 = -[NSItemProvider _availableTypes](self, "_availableTypes");
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v6 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v8 = v6;
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        uint64_t v10 = 0LL;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = -[NSItemProvider _representationConformingToType:]( self,  "_representationConformingToType:",  *(void *)(*((void *)&v15 + 1) + 8 * v10));
          if ([v11 preferredRepresentation] == 2)
          {
            uint64_t v12 = [v11 typeIdentifier];
            if (((uint64_t (*)(uint64_t, uint64_t))off_18C4917C0)(v12, (uint64_t)typeIdentifier))
            {
              LOBYTE(v6) = 1;
              return v6;
            }
          }

          ++v10;
        }

        while (v8 != v10);
        uint64_t v6 = [v7 countByEnumeratingWithState:&v15 objects:v14 count:16];
        uint64_t v8 = v6;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }

  else
  {
    LOBYTE(v6) = -[NSItemProvider _hasRepresentationConformingToType:]( self,  "_hasRepresentationConformingToType:",  typeIdentifier);
  }

  return v6;
}

- (void)registerDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  v7[5] = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke;
  v7[3] = &unk_189C9FFE0;
  v7[4] = loadHandler;
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:]( self,  "_addRepresentationType:preferredRepresentation:visibility:loader:",  typeIdentifier,  0LL,  visibility,  v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_preferredRepresentationByType,  "setObject:forKeyedSubscript:",  &off_189D0E1F8,  typeIdentifier);
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2;
  v8[3] = &unk_189CA0048;
  v8[4] = a3;
  return (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))( v6,  v8,  a3,  a4,  a5,  a6);
}

uint64_t __85__NSItemProvider_registerDataRepresentationForTypeIdentifier_visibility_loadHandler___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void, NSItemRepresentationLoadResult *))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  a2,  0LL,  0LL,  a3));
}

- (void)registerFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier fileOptions:(NSItemProviderFileOptions)fileOptions visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  if ((fileOptions & 1) != 0) {
    uint64_t v8 = &off_189D0E210;
  }
  else {
    uint64_t v8 = &off_189D0E228;
  }
  LOBYTE(v9) = fileOptions & 1;
  BYTE1(v9) = fileOptions == 0;
  -[NSItemProvider _addRepresentationType:preferredRepresentation:visibility:loader:]( self,  "_addRepresentationType:preferredRepresentation:visibility:loader:",  MEMORY[0x1895F87A8],  3221225472LL,  __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke,  &unk_189CA00E8,  typeIdentifier,  loadHandler,  v9,  *MEMORY[0x1895F89C0]);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_preferredRepresentationByType,  "setObject:forKeyedSubscript:",  v8,  typeIdentifier);
}

uint64_t __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2;
  v5[3] = &unk_189CA00C0;
  __int16 v6 = *(_WORD *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  v5[5] = a3;
  return (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v5);
}

void __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2( uint64_t a1,  void *a2,  int a3,  NSError *a4)
{
  uint64_t v4 = a4;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  uint64_t v23 = 0LL;
  v24 = &v23;
  uint64_t v25 = 0x3052000000LL;
  v26 = __Block_byref_object_copy__13;
  v27 = __Block_byref_object_dispose__13;
  uint64_t v28 = 0LL;
  uint64_t v17 = 0LL;
  __int128 v18 = &v17;
  uint64_t v19 = 0x3052000000LL;
  v20 = __Block_byref_object_copy__32;
  v21 = __Block_byref_object_dispose__33;
  __int16 v6 = a4;
  uint64_t v22 = 0LL;
  if (!a2) {
    goto LABEL_10;
  }
  __int16 v6 = a4;
  if (a4) {
    goto LABEL_10;
  }
  if (![a2 isFileURL])
  {
    uint64_t v10 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = a2;
      _os_log_error_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_ERROR,  "URL %@ is not a file:// URL.",  (uint8_t *)&buf,  0xCu);
    }

    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0LL);
    goto LABEL_9;
  }

  if (*(_BYTE *)(a1 + 48))
  {
    uint64_t v9 = -[NSSecurityScopedURLWrapper initWithURL:readonly:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:readonly:",  a2,  *(unsigned __int8 *)(a1 + 49));
    __int16 v6 = 0LL;
    v24[5] = (uint64_t)v9;
    goto LABEL_10;
  }

  uint64_t v13 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = (uint64_t)__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35;
  v16[3] = (uint64_t)&unk_189CA0070;
  v16[4] = *(void *)(a1 + 32);
  v16[5] = (uint64_t)&v23;
  v16[6] = (uint64_t)&v17;
  if (!a3)
  {
    RepresentationError = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35( v16,  a2);
LABEL_9:
    __int16 v6 = RepresentationError;
    goto LABEL_10;
  }

  int v14 = [a2 startAccessingSecurityScopedResource];
  __int128 v15 = -[NSFileCoordinator initWithFilePresenter:]( objc_alloc(&OBJC_CLASS___NSFileCoordinator),  "initWithFilePresenter:",  0LL);
  uint64_t v33 = 0LL;
  v34 = &v33;
  uint64_t v35 = 0x3052000000LL;
  v36 = __Block_byref_object_copy__13;
  v37 = __Block_byref_object_dispose__13;
  uint64_t v38 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 0;
  *(void *)&__int128 buf = v13;
  *((void *)&buf + 1) = 3221225472LL;
  v40 = ___synchronousCoordinatedRead_block_invoke;
  v41 = &unk_189CA0778;
  v42 = v16;
  v43 = &v33;
  v44 = &v29;
  -[NSFileCoordinator coordinateReadingItemAtURL:options:error:byAccessor:]( v15,  "coordinateReadingItemAtURL:options:error:byAccessor:",  a2,  1LL,  &v38,  &buf);
  if (v14) {
    [a2 stopAccessingSecurityScopedResource];
  }

  __int16 v6 = (NSError *)v34[5];
  if (*((_BYTE *)v30 + 24)) {
    __int16 v6 = v6;
  }
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
LABEL_10:
  if (v6)
  {
    if (v4)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if (!-[NSString isEqualToString:]( -[NSError domain](v4, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain")) {
        uint64_t v4 = _NSIPCannotLoadRepresentationError(v12, (uint64_t)v4);
      }
    }
  }

  (*(void (**)(void, NSItemRepresentationLoadResult *))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  0LL,  v24[5],  v18[5],  v4));

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
}

NSError *__97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_35( uint64_t *a1,  void *a2)
{
  v7[1] = *(NSError **)MEMORY[0x1895F89C0];
  v7[0] = 0LL;
  __int16 v6 = 0LL;
  uint64_t v3 = _NSIPCloneURLToTemporaryFolder(a2, a1[4], 0LL, &v6, v7);
  if (!v3) {
    return _NSIPCannotLoadRepresentationError(a1[4], 0LL);
  }
  *(void *)(*(void *)(a1[5] + 8) + 40LL) = -[NSSecurityScopedURLWrapper initWithURL:readonly:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:readonly:",  v3,  1LL);
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_36;
  v5[3] = &unk_189C9A030;
  v5[4] = v6;
  *(void *)(*(void *)(a1[6] + 8) + 40) = [v5 copy];
  return v7[0];
}

BOOL __97__NSItemProvider_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler___block_invoke_2_36( uint64_t a1)
{
  return -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  *(void *)(a1 + 32),  0LL);
}

- (NSProgress)loadDataRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS____NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  id v8 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v8)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_189CA0160;
    v17[4] = typeIdentifier;
    v17[5] = v7;
    objc_copyWeak(&v18, &location);
    v17[6] = self;
    v17[7] = completionHandler;
    uint64_t v10 = (NSProgress *)objc_msgSend(v8, "loadDataWithOptions_v2:completionHandler:", 0, v17);
    objc_destroyWeak(&v18);
    if (v10) {
      goto LABEL_8;
    }
  }

  else
  {
    id v11 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "Cannot find representation conforming to type %@",  (uint8_t *)&buf,  0xCu);
    }

    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_46;
    block[3] = &unk_189CA0188;
    block[4] = v7;
    objc_copyWeak(&v16, &location);
    block[6] = typeIdentifier;
    block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v16);
  }

  uint64_t v10 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  -[NSProgress setCompletedUnitCount:]( v10,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v10, "totalUnitCount"));
LABEL_8:
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_48;
  v13[3] = &unk_189CA01B0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v13[5] = v10;
  if (v7)
  {
    *(void *)&__int128 buf = v9;
    *((void *)&buf + 1) = 3221225472LL;
    v21 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    uint64_t v22 = &unk_189C9FF78;
    uint64_t v23 = v7;
    v24 = v13;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  v9[1] = *(id *)MEMORY[0x1895F89C0];
  uint64_t v4 = (NSError *)[a2 error];
  RepresentationError = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!-[NSString isEqualToString:]( -[NSError domain](v4, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain")) {
      RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
    }
  }

  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3;
  block[3] = &unk_189CA0138;
  block[4] = *(void *)(a1 + 40);
  objc_copyWeak(v9, (id *)(a1 + 64));
  uint64_t v7 = *(void *)(a1 + 56);
  block[5] = *(void *)(a1 + 48);
  block[6] = a2;
  block[7] = RepresentationError;
  void block[8] = v7;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(v9);
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3( uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, void))(v4 + 16))( v4,  [*(id *)(a1 + 48) data],  *(void *)(a1 + 56));
  }
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_4( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_46( uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_47;
  v6[3] = &unk_189CA0110;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 48), 0LL);
    (*(void (**)(uint64_t, void, NSError *))(v4 + 16))(v4, 0LL, RepresentationError);
  }

  objc_destroyWeak(&v7);
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_2_47( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

uint64_t __76__NSItemProvider_loadDataRepresentationForTypeIdentifier_completionHandler___block_invoke_3_48( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) beganDataTransferTransactionUUID:v4 progress:*(void *)(a1 + 40)];
}

- (NSProgress)loadFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v7 = objc_alloc_init(&OBJC_CLASS____NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  id v8 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v8)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v17[3] = &unk_189CA03F8;
    v17[4] = typeIdentifier;
    v17[5] = v7;
    objc_copyWeak(&v18, &location);
    v17[7] = v8;
    void v17[8] = completionHandler;
    v17[6] = self;
    uint64_t v10 = (NSProgress *)objc_msgSend(v8, "loadFileCopyWithOptions_v2:completionHandler:", 0, v17);
    objc_destroyWeak(&v18);
    if (v10) {
      goto LABEL_8;
    }
  }

  else
  {
    id v11 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_ERROR,  "No appropriate representation found for type %@",  (uint8_t *)&buf,  0xCu);
    }

    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_51;
    block[3] = &unk_189CA0188;
    block[4] = v7;
    objc_copyWeak(&v16, &location);
    block[6] = typeIdentifier;
    void block[7] = completionHandler;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v16);
  }

  uint64_t v10 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  -[NSProgress setCompletedUnitCount:]( v10,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v10, "totalUnitCount"));
LABEL_8:
  v13[0] = v9;
  v13[1] = 3221225472LL;
  v13[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_53;
  v13[3] = &unk_189CA01B0;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  v13[5] = v10;
  if (v7)
  {
    *(void *)&__int128 buf = v9;
    *((void *)&buf + 1) = 3221225472LL;
    v21 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    uint64_t v22 = &unk_189C9FF78;
    uint64_t v23 = v7;
    v24 = v13;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v10;
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (NSError *)[a2 error];
  if (v4)
  {
    RepresentationError = v4;
    uint64_t v6 = *(void *)(a1 + 32);
    if (!-[NSString isEqualToString:]( -[NSError domain](v4, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain")) {
      RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
    }
    id v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(_DWORD *)__int128 buf = 138412546;
      *(void *)&buf[4] = v14;
      __int16 v21 = 2112;
      uint64_t v22 = RepresentationError;
      _os_log_error_impl(&dword_182EB1000, v7, OS_LOG_TYPE_ERROR, "Error copying file type %@. Error: %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_49;
    block[3] = &unk_189CA0188;
    block[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v19, (id *)(a1 + 72));
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 64);
    block[6] = RepresentationError;
    void block[7] = v9;
    block[5] = v8;
    _NSIPDispatchAsyncCallback(block);
    objc_destroyWeak(&v19);
  }

  else
  {
    *(void *)__int128 buf = 0LL;
    uint64_t v17 = 0LL;
    uint64_t v10 = _NSIPCloneURLToTemporaryFolder( (void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"),  objc_msgSend(*(id *)(a1 + 56), "typeIdentifier"),  (void *)objc_msgSend(*(id *)(a1 + 48), "_sanitizedSuggestedName"),  &v17,  (NSError **)buf);
    id v11 = *(NSError **)buf;
    if (*(void *)buf)
    {
      uint64_t v12 = *(void *)(a1 + 32);
      if ((objc_msgSend((id)objc_msgSend(*(id *)buf, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
        id v11 = _NSIPCannotLoadRepresentationError(v12, (uint64_t)v11);
      }
      *(void *)__int128 buf = v11;
    }

    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4;
    v15[3] = &unk_189CA0200;
    v15[4] = *(void *)(a1 + 40);
    objc_copyWeak(&v16, (id *)(a1 + 72));
    uint64_t v13 = *(void *)(a1 + 64);
    v15[5] = *(void *)(a1 + 48);
    v15[6] = v10;
    v15[7] = *(void *)buf;
    v15[8] = v17;
    v15[9] = v13;
    _NSIPDispatchAsyncCallback(v15);
    objc_destroyWeak(&v16);
  }

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_49( uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_50;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0LL, *(void *)(a1 + 48));
  }
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_50( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_4( uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 80));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 72);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  if (*(void *)(a1 + 64)) {
    -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  *(void *)(a1 + 64),  0LL);
  }
  objc_destroyWeak(&v6);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_5( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_51( uint64_t a1)
{
  block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_52;
  v6[3] = &unk_189CA0110;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 48), 0LL);
    (*(void (**)(uint64_t, void, NSError *))(v4 + 16))(v4, 0LL, RepresentationError);
  }

  objc_destroyWeak(&v7);
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_52( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

uint64_t __76__NSItemProvider_loadFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_53( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) beganDataTransferTransactionUUID:v4 progress:*(void *)(a1 + 40)];
}

- (NSProgress)loadInPlaceFileRepresentationForTypeIdentifier:(NSString *)typeIdentifier completionHandler:(void *)completionHandler
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v7 = objc_alloc_init(&OBJC_CLASS____NSIPCallbackSerialization);
  objc_initWeak(&location, v7);
  uint64_t v8 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  id v9 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", typeIdentifier);
  uint64_t v10 = MEMORY[0x1895F87A8];
  if (v9)
  {
    id v11 = +[NSProgress progressWithTotalUnitCount:](&OBJC_CLASS___NSProgress, "progressWithTotalUnitCount:", 100LL);
    v22[0] = v10;
    v22[1] = 3221225472LL;
    v22[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke;
    v22[3] = &unk_189CA0290;
    v22[4] = self;
    v22[5] = v9;
    v22[6] = typeIdentifier;
    v22[7] = v7;
    uint64_t v12 = &v23;
    objc_copyWeak(&v23, &location);
    v22[8] = v11;
    v22[9] = completionHandler;
    uint64_t v13 = objc_msgSend(v9, "loadOpenInPlaceWithOptions_v2:completionHandler:", 0, v22);
    if (v13) {
      -[NSProgress addChild:withPendingUnitCount:](v8, "addChild:withPendingUnitCount:", v13, 50LL);
    }
    else {
      -[NSProgress setCompletedUnitCount:](v8, "setCompletedUnitCount:", 50LL);
    }
    -[NSProgress addChild:withPendingUnitCount:](v8, "addChild:withPendingUnitCount:", v11, 50LL);
  }

  else
  {
    -[NSProgress setCompletedUnitCount:]( v8,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v8, "totalUnitCount"));
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)typeIdentifier, 0LL);
    __int128 v15 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = typeIdentifier;
      _os_log_error_impl( &dword_182EB1000,  v15,  OS_LOG_TYPE_ERROR,  "Could not find suitable representation of type %@.",  (uint8_t *)&buf,  0xCu);
    }

    v20[0] = v10;
    v20[1] = 3221225472LL;
    v20[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_59;
    v20[3] = &unk_189CA0110;
    uint64_t v12 = &v21;
    objc_copyWeak(&v21, &location);
    v20[4] = self;
    if (v7)
    {
      *(void *)&__int128 buf = v10;
      *((void *)&buf + 1) = 3221225472LL;
      v26 = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
      v27 = &unk_189C9FF78;
      uint64_t v28 = v7;
      uint64_t v29 = v20;
      _NSIPDispatchAsyncCallback(&buf);
    }

    if (completionHandler)
    {
      block[0] = v10;
      block[1] = 3221225472LL;
      block[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_60;
      block[3] = &unk_189C9E898;
      block[4] = RepresentationError;
      block[5] = completionHandler;
      _NSIPDispatchAsyncCallback(block);
    }
  }

  objc_destroyWeak(v12);
  v17[0] = v10;
  v17[1] = 3221225472LL;
  v17[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_61;
  v17[3] = &unk_189CA01B0;
  objc_copyWeak(&v18, &location);
  v17[4] = self;
  v17[5] = v8;
  if (v7)
  {
    *(void *)&__int128 buf = v10;
    *((void *)&buf + 1) = 3221225472LL;
    v26 = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v27 = &unk_189C9FF78;
    uint64_t v28 = v7;
    uint64_t v29 = v17;
    _NSIPDispatchAsyncCallback(&buf);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  return v8;
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  RepresentationError = (NSError *)[a2 error];
  __int128 v15 = 0LL;
  id v16 = RepresentationError;
  if (objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url") && !RepresentationError)
  {
    uint64_t v5 = (void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
    if (([a2 wasOpenedInPlace] & 1) == 0) {
      uint64_t v5 = _NSIPCloneURLToTemporaryFolder( (void *)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"),  objc_msgSend(*(id *)(a1 + 40), "typeIdentifier"),  (void *)objc_msgSend(*(id *)(a1 + 32), "_sanitizedSuggestedName"),  &v15,  &v16);
    }
    char v6 = [a2 wasOpenedInPlace];
    if (!v16) {
      goto LABEL_13;
    }
LABEL_11:
    uint64_t v8 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 48);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      v20 = v16;
      _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "Failed to open in place representation of type %@. Error: %@",  buf,  0x16u);
    }

    goto LABEL_13;
  }

  if (RepresentationError)
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (!-[NSString isEqualToString:]( -[NSError domain](RepresentationError, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain")) {
      RepresentationError = _NSIPCannotLoadRepresentationError(v7, (uint64_t)RepresentationError);
    }
  }

  uint64_t v5 = 0LL;
  char v6 = 0;
  id v16 = RepresentationError;
  if (RepresentationError) {
    goto LABEL_11;
  }
LABEL_13:
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55;
  block[3] = &unk_189CA0268;
  block[4] = *(void *)(a1 + 56);
  objc_copyWeak(&v13, (id *)(a1 + 80));
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  block[5] = *(void *)(a1 + 32);
  void block[6] = v9;
  char v14 = v6;
  void block[7] = v5;
  void block[8] = v16;
  void block[9] = v15;
  block[10] = v10;
  _NSIPDispatchAsyncCallback(block);
  objc_destroyWeak(&v13);
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_55( uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56;
  v6[3] = &unk_189CA0110;
  objc_copyWeak(&v7, (id *)(a1 + 88));
  v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }

  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "totalUnitCount"));
  uint64_t v4 = *(void *)(a1 + 80);
  if (v4) {
    (*(void (**)(uint64_t, void, void, void))(v4 + 16))( v4,  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 96),  *(void *)(a1 + 64));
  }
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5) {
    _NSIPCoordinatedDelete(v5, (uint64_t)&__block_literal_global_58);
  }
  objc_destroyWeak(&v7);
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_56( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  if (a2)
  {
    if (!a3) {
      -[NSFileManager removeItemAtURL:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "removeItemAtURL:error:",  a2,  0LL);
    }
  }

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_59( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_2_60( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __83__NSItemProvider_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler___block_invoke_3_61( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) beganDataTransferTransactionUUID:v4 progress:*(void *)(a1 + 40)];
}

- (NSItemProvider)initWithObject:(id)object
{
  uint64_t v4 = -[NSItemProvider init](self, "init");
  uint64_t v5 = v4;
  if (v4) {
    -[NSItemProvider registerObject:visibility:](v4, "registerObject:visibility:", object, 0LL);
  }
  return v5;
}

- (void)registerObject:(id)object visibility:(NSItemProviderRepresentationVisibility)visibility
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = object;
  if ((v7 & 1) == 0) {
    uint64_t v8 = (void *)objc_opt_class();
  }
  uint64_t v9 = (void *)[v8 writableTypeIdentifiersForItemProvider];
  char v23 = objc_opt_respondsToSelector();
  char v10 = objc_opt_respondsToSelector();
  objc_opt_class();
  char v22 = objc_opt_respondsToSelector();
  objc_opt_class();
  char v21 = objc_opt_respondsToSelector();
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15))
        {
          id v16 = object;
          if ((v23 & 1) != 0)
          {
LABEL_12:
            NSItemProviderRepresentationVisibility v18 = [v16 itemProviderVisibilityForRepresentationWithTypeIdentifier:v15];
            if (v18 <= visibility) {
              NSItemProviderRepresentationVisibility v17 = visibility;
            }
            else {
              NSItemProviderRepresentationVisibility v17 = v18;
            }
          }

          else
          {
            NSItemProviderRepresentationVisibility v17 = visibility;
            if ((v22 & 1) != 0)
            {
              id v16 = (void *)objc_opt_class();
              goto LABEL_12;
            }
          }

          __int16 v19 = object;
          if ((v10 & 1) != 0)
          {
LABEL_18:
            uint64_t v20 = [v19 _preferredRepresentationForItemProviderWritableTypeIdentifier:v15];
            if (v20)
            {
              v24[0] = MEMORY[0x1895F87A8];
              v24[1] = 3221225472LL;
              v24[2] = __44__NSItemProvider_registerObject_visibility___block_invoke_3;
              v24[3] = &unk_189CA02E0;
              v24[4] = object;
              v24[5] = v15;
              -[NSItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:]( self,  "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:",  v15,  v20 == 2,  v17,  v24);
              continue;
            }
          }

          else if ((v21 & 1) != 0)
          {
            __int16 v19 = (void *)objc_opt_class();
            goto LABEL_18;
          }

          v25[0] = MEMORY[0x1895F87A8];
          v25[1] = 3221225472LL;
          v25[2] = __44__NSItemProvider_registerObject_visibility___block_invoke;
          v25[3] = &unk_189CA02B8;
          v25[4] = object;
          v25[5] = v15;
          -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:]( self,  "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:",  v15,  v17,  v25);
          continue;
        }
      }

      uint64_t v12 = [v9 countByEnumeratingWithState:&v27 objects:v26 count:16];
    }

    while (v12);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0) {
    -[NSItemProvider _NSItemProviderDidRegisterObject:](self, "_NSItemProviderDidRegisterObject:", object);
  }
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = 3221225472LL;
  char v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_2;
  uint64_t v8 = &unk_189CA0308;
  uint64_t v9 = v2;
  uint64_t v10 = a2;
  return objc_msgSend(v3, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_2( uint64_t a1,  uint64_t a2,  NSError *RepresentationError)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), (uint64_t)RepresentationError);
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    uint64_t v5 = v3;
    a2 = 0LL;
  }

  else
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, NSError *))(v3 + 16);
    uint64_t v5 = *(void *)(a1 + 40);
  }

  return v4(v5, a2, RepresentationError);
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v5 = MEMORY[0x1895F87A8];
  uint64_t v6 = 3221225472LL;
  char v7 = __44__NSItemProvider_registerObject_visibility___block_invoke_4;
  uint64_t v8 = &unk_189CA0380;
  uint64_t v9 = v2;
  uint64_t v10 = a2;
  return objc_msgSend(v3, "_loadFileRepresentationOfTypeIdentifier:forItemProviderCompletionHandler:");
}

uint64_t __44__NSItemProvider_registerObject_visibility___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  NSError *RepresentationError)
{
  uint64_t v5 = *(void *)(a1 + 40);
  if (!a2 || RepresentationError)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), (uint64_t)RepresentationError);
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    uint64_t v7 = v5;
    a2 = 0LL;
  }

  else
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, NSError *))(v5 + 16);
    uint64_t v7 = *(void *)(a1 + 40);
  }

  return v6(v7, a2, a3, RepresentationError);
}

- (void)registerObjectOfClass:(id)aClass visibility:(NSItemProviderRepresentationVisibility)visibility loadHandler:(void *)loadHandler
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    uint64_t v8 = (void *)[aClass writableTypeIdentifiersForItemProvider];
    char v20 = objc_opt_respondsToSelector();
    id v9 = aClass;
    char v10 = objc_opt_respondsToSelector();
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          if (!-[NSItemProvider _hasRepresentationOfType:](self, "_hasRepresentationOfType:", v15))
          {
            NSItemProviderRepresentationVisibility v16 = visibility;
            if ((v20 & 1) != 0)
            {
              NSItemProviderRepresentationVisibility v17 = [v9 itemProviderVisibilityForRepresentationWithTypeIdentifier:v15];
              if (v17 <= visibility) {
                NSItemProviderRepresentationVisibility v16 = visibility;
              }
              else {
                NSItemProviderRepresentationVisibility v16 = v17;
              }
            }

            if ((v10 & 1) != 0
              && (uint64_t v18 = [v9 _preferredRepresentationForItemProviderWritableTypeIdentifier:v15]) != 0)
            {
              v22[0] = MEMORY[0x1895F87A8];
              v22[1] = 3221225472LL;
              v22[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4;
              v22[3] = &unk_189CA03D0;
              v22[4] = v15;
              v22[5] = loadHandler;
              -[NSItemProvider registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:]( self,  "registerFileRepresentationForTypeIdentifier:fileOptions:visibility:loadHandler:",  v15,  v18 == 2,  v16,  v22);
            }

            else
            {
              v23[0] = MEMORY[0x1895F87A8];
              v23[1] = 3221225472LL;
              v23[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke;
              v23[3] = &unk_189CA0358;
              v23[4] = v15;
              v23[5] = loadHandler;
              -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:]( self,  "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:",  v15,  v16,  v23);
            }
          }
        }

        uint64_t v12 = [v8 countByEnumeratingWithState:&v27 objects:v26 count:16];
      }

      while (v12);
    }
  }

  else
  {
    __int16 v19 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v25 = NSStringFromClass((Class)aClass);
      _os_log_error_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_ERROR,  "Ignoring registration of class %@ because it does not conform to the NSItemProviderWriting protocol.",  buf,  0xCu);
    }
  }

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v5 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  char v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2;
  uint64_t v15 = &unk_189CA0330;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  NSItemProviderRepresentationVisibility v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v4;
  uint64_t v19 = a2;
  uint64_t v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = v4;
  }

  else
  {
    char v10 = v4;
    uint64_t v9 = (uint64_t)v5;
  }

  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v9, 20LL);
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  v16[6] = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v7 = v6;
  if (!a2 || a3)
  {
    -[NSProgress setCompletedUnitCount:]( v6,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v6, "totalUnitCount"));
    uint64_t v13 = *(void *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 40), a3);
    (*(void (**)(uint64_t, void, NSError *))(v13 + 16))(v13, 0LL, RepresentationError);
    goto LABEL_6;
  }

  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3;
  v16[3] = &unk_189CA0308;
  uint64_t v9 = *(void *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  uint64_t v10 = [a2 loadDataWithTypeIdentifier:v8 forItemProviderCompletionHandler:v16];
  if (!v10)
  {
LABEL_6:
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v11 = (uint64_t)v7;
    return [v12 addChild:v11 withPendingUnitCount:80];
  }

  uint64_t v11 = v10;
  uint64_t v12 = *(void **)(a1 + 48);
  return [v12 addChild:v11 withPendingUnitCount:80];
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

NSProgress *__63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v4 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v5 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  uint64_t v13 = 3221225472LL;
  char v14 = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5;
  uint64_t v15 = &unk_189CA03A8;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  NSItemProviderRepresentationVisibility v16 = v5;
  uint64_t v17 = v7;
  uint64_t v18 = v4;
  uint64_t v19 = a2;
  uint64_t v8 = (*(uint64_t (**)(void))(v6 + 16))();
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = v4;
  }

  else
  {
    uint64_t v10 = v4;
    uint64_t v9 = (uint64_t)v5;
  }

  -[NSProgress addChild:withPendingUnitCount:](v10, "addChild:withPendingUnitCount:", v9, 20LL);
  return v4;
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_5( uint64_t a1,  void *a2,  uint64_t a3)
{
  v16[6] = *MEMORY[0x1895F89C0];
  objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "totalUnitCount"));
  uint64_t v6 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
  uint64_t v7 = v6;
  if (!a2 || a3)
  {
    -[NSProgress setCompletedUnitCount:]( v6,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v6, "totalUnitCount"));
    uint64_t v13 = *(void *)(a1 + 56);
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 40), a3);
    (*(void (**)(uint64_t, void, void, NSError *))(v13 + 16))(v13, 0LL, 0LL, RepresentationError);
    goto LABEL_6;
  }

  uint64_t v8 = *(void *)(a1 + 40);
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6;
  v16[3] = &unk_189CA0380;
  uint64_t v9 = *(void *)(a1 + 56);
  v16[4] = v6;
  v16[5] = v9;
  uint64_t v10 = [a2 _loadFileRepresentationOfTypeIdentifier:v8 forItemProviderCompletionHandler:v16];
  if (!v10)
  {
LABEL_6:
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v11 = (uint64_t)v7;
    return [v12 addChild:v11 withPendingUnitCount:80];
  }

  uint64_t v11 = v10;
  uint64_t v12 = *(void **)(a1 + 48);
  return [v12 addChild:v11 withPendingUnitCount:80];
}

uint64_t __63__NSItemProvider_registerObjectOfClass_visibility_loadHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)canLoadObjectOfClass:(id)aClass
{
  return _bestMatchConformingToTypes( -[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:]( self,  "_readableTypeIdentifiersForItemProviderForClass:",  aClass),  -[NSItemProvider _availableTypes](self, "_availableTypes")) != 0;
}

- (NSProgress)loadObjectOfClass:(id)aClass completionHandler:(void *)completionHandler
{
  return (NSProgress *)-[NSItemProvider _loadObjectOfClass:options:completionHandler:]( self,  "_loadObjectOfClass:options:completionHandler:",  aClass,  0LL,  completionHandler);
}

- (id)_objectOfClass:(Class)a3 data:(id)a4 typeIdentifier:(id)a5 error:(id *)a6
{
  return (id)-[objc_class objectWithItemProviderData:typeIdentifier:error:]( a3,  "objectWithItemProviderData:typeIdentifier:error:",  a4,  a5,  a6);
}

- (id)_readableTypeIdentifiersForItemProviderForClass:(Class)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0) {
    return (id)-[objc_class readableTypeIdentifiersForItemProvider](a3, "readableTypeIdentifiersForItemProvider");
  }
  else {
    return (id)MEMORY[0x189604A58];
  }
}

- (id)_loadObjectOfClass:(Class)a3 options:(id)a4 completionHandler:(id)a5
{
  v33[6] = *MEMORY[0x1895F89C0];
  uint64_t v9 = objc_alloc_init(&OBJC_CLASS____NSIPCallbackSerialization);
  objc_initWeak(&location, v9);
  id v10 = -[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:]( self,  "_readableTypeIdentifiersForItemProviderForClass:",  a3);
  uint64_t matched = _bestMatchConformingToTypes(v10, -[NSItemProvider _availableTypes](self, "_availableTypes"));
  uint64_t v12 = matched;
  uint64_t v13 = MEMORY[0x1895F87A8];
  if (!matched)
  {
    uint64_t v18 = _NSIPUnavailableCoercionError(0LL, a3, 0LL);
    block[0] = v13;
    block[1] = 3221225472LL;
    block[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7;
    block[3] = &unk_189CA0188;
    block[4] = v9;
    uint64_t v19 = &v25;
    objc_copyWeak(&v25, &location);
    void block[6] = v18;
    void block[7] = a5;
    block[5] = self;
    _NSIPDispatchAsyncCallback(block);
LABEL_11:
    objc_destroyWeak(v19);
LABEL_12:
    uint64_t v20 = +[NSProgress discreteProgressWithTotalUnitCount:]( &OBJC_CLASS___NSProgress,  "discreteProgressWithTotalUnitCount:",  100LL);
    -[NSProgress setCompletedUnitCount:]( v20,  "setCompletedUnitCount:",  -[NSProgress totalUnitCount](v20, "totalUnitCount"));
    goto LABEL_13;
  }

  uint64_t v14 = _bestMatchType(matched, v10, (uint64_t)&__block_literal_global_286);
  id v15 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", v12);
  if (!v15)
  {
    v26[0] = v13;
    v26[1] = 3221225472LL;
    v26[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_83;
    v26[3] = &unk_189CA0188;
    v26[4] = v9;
    uint64_t v19 = &v27;
    objc_copyWeak(&v27, &location);
    v26[6] = a3;
    v26[7] = a5;
    v26[5] = self;
    _NSIPDispatchAsyncCallback(v26);
    goto LABEL_11;
  }

  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[objc_class _preferredRepresentationForItemProviderReadableTypeIdentifier:]( a3,  "_preferredRepresentationForItemProviderReadableTypeIdentifier:",  v12))
  {
    v28[0] = v13;
    v28[1] = 3221225472LL;
    v28[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5;
    v28[3] = &unk_189CA03F8;
    v28[4] = a3;
    v28[5] = v14;
    v28[6] = v9;
    NSItemProviderRepresentationVisibility v16 = &v29;
    objc_copyWeak(&v29, &location);
    v28[7] = self;
    v28[8] = a5;
    uint64_t v17 = objc_msgSend(v15, "loadOpenInPlaceWithOptions_v2:completionHandler:", a4, v28);
  }

  else
  {
    v30[0] = v13;
    v30[1] = 3221225472LL;
    v30[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke;
    v30[3] = &unk_189CA03F8;
    v30[4] = self;
    v30[5] = a3;
    v30[6] = v14;
    v30[7] = v9;
    NSItemProviderRepresentationVisibility v16 = &v31;
    objc_copyWeak(&v31, &location);
    v30[8] = a5;
    uint64_t v17 = objc_msgSend(v15, "loadDataWithOptions_v2:completionHandler:", a4, v30);
  }

  uint64_t v20 = (NSProgress *)v17;
  objc_destroyWeak(v16);
  if (!v20) {
    goto LABEL_12;
  }
LABEL_13:
  v22[0] = v13;
  v22[1] = 3221225472LL;
  v22[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9;
  v22[3] = &unk_189CA01B0;
  objc_copyWeak(&v23, &location);
  v22[4] = self;
  v22[5] = v20;
  if (v9)
  {
    v33[0] = v13;
    v33[1] = 3221225472LL;
    v33[2] = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
    v33[3] = &unk_189C9FF78;
    v33[4] = v9;
    v33[5] = v22;
    _NSIPDispatchAsyncCallback(v33);
  }

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
  return v20;
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (NSError *)[a2 error];
  uint64_t v14 = v4;
  if (![a2 data] || v4)
  {
    if (!v4) {
      goto LABEL_13;
    }
    uint64_t v9 = *(objc_class **)(a1 + 40);
    if (-[NSString isEqualToString:]( -[NSError domain](v4, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain"))
    {
      goto LABEL_13;
    }

    uint64_t v8 = _NSIPUnavailableCoercionError(0LL, v9, (uint64_t)v4);
LABEL_12:
    uint64_t v4 = v8;
LABEL_13:
    uint64_t v5 = 0LL;
    uint64_t v14 = v4;
    goto LABEL_14;
  }

  uint64_t v5 = objc_msgSend( *(id *)(a1 + 32),  "_objectOfClass:data:typeIdentifier:error:",  *(void *)(a1 + 40),  objc_msgSend(a2, "data"),  *(void *)(a1 + 48),  &v14);
  if (!v5)
  {
    uint64_t v6 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = NSStringFromClass(*(Class *)(a1 + 40));
      *(_DWORD *)__int128 buf = 138412546;
      NSItemProviderRepresentationVisibility v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Could not instantiate class %@. Error: %@",  buf,  0x16u);
    }

    uint64_t v4 = v14;
    if (!v14) {
      goto LABEL_13;
    }
    uint64_t v7 = *(objc_class **)(a1 + 40);
    if (-[NSString isEqualToString:]( -[NSError domain](v14, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain"))
    {
      goto LABEL_13;
    }

    uint64_t v8 = _NSIPUnavailableCoercionError(0LL, v7, (uint64_t)v4);
    goto LABEL_12;
  }

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3(uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[a2 error];
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (v5 && ![a2 error])
  {
    uint64_t v7 = (Class *)(a1 + 32);
    uint64_t v11 = objc_msgSend( *(id *)(a1 + 32),  "_objectWithItemProviderFileURL:typeIdentifier:isInPlace:error:",  objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url"),  *(void *)(a1 + 40),  objc_msgSend(a2, "wasOpenedInPlace"),  0);
    if (v11)
    {
      uint64_t v9 = v11;
      goto LABEL_8;
    }

    uint64_t v12 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = NSStringFromClass(*v7);
      *(_DWORD *)__int128 buf = 138412546;
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      char v21 = v4;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Could not instantiate class %@. Error: %@",  buf,  0x16u);
    }

    v17[0] = v6;
    v17[1] = 3221225472LL;
    v17[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_79;
    v17[3] = &unk_189CA01D8;
    uint64_t v8 = v17;
  }

  else
  {
    v16[0] = v6;
    v16[1] = 3221225472LL;
    v16[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_80;
    v16[3] = &unk_189CA01D8;
    uint64_t v7 = (Class *)(a1 + 32);
    uint64_t v8 = v16;
  }

  v8[4] = *v7;
  v8[5] = v4;
  if (v4
    && (objc_msgSend((id)objc_msgSend(v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0)
  {
    uint64_t v4 = (void *)((uint64_t (*)(void *, void *))v8[2])(v8, v4);
  }

  uint64_t v9 = 0LL;
LABEL_8:
  v14[0] = v6;
  v14[1] = 3221225472LL;
  v14[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_81;
  v14[3] = &unk_189CA0138;
  v14[4] = *(void *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  uint64_t v10 = *(void *)(a1 + 64);
  v14[5] = *(void *)(a1 + 56);
  v14[6] = v9;
  v14[7] = v4;
  v14[8] = v10;
  _NSIPDispatchAsyncCallback(v14);
  objc_destroyWeak(&v15);
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_79(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0LL, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

NSError *__63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_2_80(uint64_t a1)
{
  return _NSIPUnavailableCoercionError(0LL, *(objc_class **)(a1 + 32), *(void *)(a1 + 40));
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_3_81(uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_82;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 72));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_4_82(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_5_83(uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6;
  v6[3] = &unk_189CA0110;
  objc_copyWeak(&v7, (id *)(a1 + 64));
  v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4)
  {
    uint64_t v5 = _NSIPUnavailableCoercionError(0LL, *(objc_class **)(a1 + 48), 0LL);
    (*(void (**)(uint64_t, void, NSError *))(v4 + 16))(v4, 0LL, v5);
  }

  objc_destroyWeak(&v7);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_6(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

void __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_7(uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8;
  v5[3] = &unk_189CA0110;
  objc_copyWeak(&v6, (id *)(a1 + 64));
  v5[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v5;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, 0LL, *(void *)(a1 + 48));
  }
  objc_destroyWeak(&v6);
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_8(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

uint64_t __63__NSItemProvider__loadObjectOfClass_options_completionHandler___block_invoke_9(uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) beganDataTransferTransactionUUID:v4 progress:*(void *)(a1 + 40)];
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSItemProvider;
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ {types = %@}",  -[NSItemProvider description](&v3, sel_description),  -[NSItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers"));
}

- (BOOL)hasItemConformingToTypeIdentifier:(NSString *)typeIdentifier
{
  return -[NSItemProvider hasRepresentationConformingToTypeIdentifier:fileOptions:]( self,  "hasRepresentationConformingToTypeIdentifier:fileOptions:",  typeIdentifier,  0LL);
}

- (NSItemProvider)initWithItem:(id)item typeIdentifier:(NSString *)typeIdentifier
{
  v9[5] = *MEMORY[0x1895F89C0];
  id v6 = -[NSItemProvider init](self, "init");
  id v7 = v6;
  if (item && v6)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    id v9[2] = __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke;
    v9[3] = &unk_189CA0420;
    v9[4] = item;
    -[NSItemProvider registerItemForTypeIdentifier:loadHandler:]( v6,  "registerItemForTypeIdentifier:loadHandler:",  typeIdentifier,  v9);
  }

  return v7;
}

uint64_t __46__NSItemProvider_initWithItem_typeIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, *(void *)(a1 + 32), 0LL);
}

- (NSItemProvider)initWithContentsOfURL:(NSURL *)fileURL
{
  v9[5] = *MEMORY[0x1895F89C0];
  uint64_t v4 = -[NSItemProvider init](self, "init");
  if (v4)
  {
    if (-[NSURL isFileURL](fileURL, "isFileURL"))
    {
      uint64_t v5 = -[NSURL pathExtension](fileURL, "pathExtension");
      uint64_t v6 = _MergedGlobals_84[0]();
      id v7 = (id)((uint64_t (*)(uint64_t, uint64_t, uint64_t))off_18C4917C8[0])( v6,  (uint64_t)v5,  0LL);
      if (!v7) {
        id v7 = (id)off_18C4917B0[0]();
      }
      v9[0] = MEMORY[0x1895F87A8];
      v9[1] = 3221225472LL;
      id v9[2] = __40__NSItemProvider_initWithContentsOfURL___block_invoke;
      v9[3] = &unk_189CA0448;
      v9[4] = fileURL;
      -[NSItemProvider registerDataRepresentationForTypeIdentifier:visibility:loadHandler:]( v4,  "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:",  v7,  0LL,  v9);
    }

    -[NSItemProvider registerObject:visibility:](v4, "registerObject:visibility:", fileURL, 0LL);
  }

  return v4;
}

uint64_t __40__NSItemProvider_initWithContentsOfURL___block_invoke(uint64_t a1, uint64_t a2)
{
  v5[1] = *MEMORY[0x1895F89C0];
  v5[0] = 0LL;
  uint64_t v3 = [MEMORY[0x189603F48] dataWithContentsOfURL:*(void *)(a1 + 32) options:1 error:v5];
  (*(void (**)(uint64_t, uint64_t, void))(a2 + 16))(a2, v3, v5[0]);
  return 0LL;
}

- (void)registerItemForTypeIdentifier:(NSString *)typeIdentifier loadHandler:(NSItemProviderLoadHandler)loadHandler
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke;
  v4[3] = &unk_189CA0498;
  v4[4] = typeIdentifier;
  v4[5] = loadHandler;
  -[NSItemProvider _addRepresentationType_v2:preferredRepresentation:loader:]( self,  "_addRepresentationType_v2:preferredRepresentation:loader:",  typeIdentifier,  0LL,  v4);
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 objectForKeyedSubscript:@"com.apple.Foundation.NSItemProviderExpectedClass"];
  if (v4)
  {
    uint64_t v5 = (NSString *)v4;
    uint64_t v6 = (void *)[a2 mutableCopy];
    [v6 removeObjectForKey:@"com.apple.Foundation.NSItemProviderExpectedClass"];
    v6;
    NSClassFromString(v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  return 0LL;
}

id __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_2( uint64_t a1,  void *a2,  NSError *RepresentationError)
{
  v14[5] = *MEMORY[0x1895F89C0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = off_18C4917B8[0]();
    if (((uint64_t (*)(uint64_t, uint64_t))off_18C4917C0)(v6, v7))
    {
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3;
      v14[3] = &unk_189CA0048;
      uint64_t v8 = *(void *)(a1 + 32);
      v14[4] = *(void *)(a1 + 40);
      return (id)[a2 loadDataWithTypeIdentifier:v8 forItemProviderCompletionHandler:v14];
    }

    uint64_t v11 =  -[NSSecurityScopedURLWrapper initWithURL:readonly:]( objc_alloc(&OBJC_CLASS___NSSecurityScopedURLWrapper),  "initWithURL:readonly:",  a2,  0LL);
    uint64_t v10 = 0LL;
  }

  else
  {
    if (!_NSIsNSData())
    {
      uint64_t v12 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  a2,  1LL,  0LL);
      if (!v12)
      {
        RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0LL);
        uint64_t v12 = 0LL;
      }

      -[NSItemRepresentationLoadResult setArchivedObjectClass:]( +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  v12,  0,  0,  RepresentationError),  "setArchivedObjectClass:",  [a2 classForCoder]);
      id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
      return (id)v13();
    }

    uint64_t v10 = a2;
    uint64_t v11 = 0LL;
  }

  +[NSItemRepresentationLoadResult resultWithData:urlWrapper:cleanupHandler:error:]( &OBJC_CLASS___NSItemRepresentationLoadResult,  "resultWithData:urlWrapper:cleanupHandler:error:",  v10,  v11,  0LL,  0LL);
  id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
  return (id)v13();
}

uint64_t __60__NSItemProvider_registerItemForTypeIdentifier_loadHandler___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)loadItemForTypeIdentifier:(NSString *)typeIdentifier options:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  Class aClass = 0LL;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &aClass, 0LL))
  {
    uint64_t v9 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "Cannot figure out the expected value class in an NSItemProvider completion handler. Falling back to returning th e default class.",  buf,  2u);
    }
  }

  uint64_t v10 = options;
  Class v11 = aClass;
  if (aClass)
  {
    if (options) {
      uint64_t v12 = (NSDictionary *)-[NSDictionary mutableCopy](options, "mutableCopy");
    }
    else {
      uint64_t v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
    id v13 = v12;
    -[NSDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  NSStringFromClass(aClass),  @"com.apple.Foundation.NSItemProviderExpectedClass");

    Class v11 = aClass;
    uint64_t v10 = v13;
  }

  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke;
  v14[3] = &unk_189CA04C0;
  v14[4] = self;
  v14[5] = v11;
  void v14[6] = typeIdentifier;
  v14[7] = v10;
  v14[8] = completionHandler;
  _asyncDispatchBlockWithOptions(options, v14);
}

void __70__NSItemProvider_loadItemForTypeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
}

- (void)_loadItemOfClass:(Class)a3 forTypeIdentifier:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  void block[6] = *MEMORY[0x1895F89C0];
  if (-[NSItemProvider hasItemConformingToTypeIdentifier:](self, "hasItemConformingToTypeIdentifier:", a4))
  {
    uint64_t v12 = objc_opt_class();
    if (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v12))
    {
      uint64_t v13 = off_18C4917B8[0]();
      if (((uint64_t (*)(uint64_t, uint64_t))off_18C4917C0)((uint64_t)a4, v13))
      {
        uint64_t v14 = objc_opt_class();
        v31[0] = MEMORY[0x1895F87A8];
        v31[1] = 3221225472LL;
        v31[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke;
        v31[3] = &unk_189CA0510;
        v31[4] = a4;
        v31[5] = a7;
        -[NSItemProvider _loadObjectOfClass:options:completionHandler:]( self,  "_loadObjectOfClass:options:completionHandler:",  v14,  a5,  v31);
      }

      else
      {
        id v22 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", a4);
        if (v22)
        {
          v30[0] = MEMORY[0x1895F87A8];
          v30[1] = 3221225472LL;
          v30[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4;
          v30[3] = &unk_189CA0538;
          v30[5] = a3;
          v30[6] = a7;
          v30[4] = v12;
          objc_msgSend(v22, "loadWithOptions_v2:completionHandler:", a5, v30);
        }

        else if (a7)
        {
          v29[0] = MEMORY[0x1895F87A8];
          v29[1] = 3221225472LL;
          v29[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7;
          v29[3] = &unk_189C9E898;
          v29[4] = a3;
          v29[5] = a7;
          _NSIPDispatchAsyncCallback(v29);
        }
      }
    }

    else
    {
      id v16 = -[NSItemProvider _representationConformingToType:](self, "_representationConformingToType:", a4);
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = objc_alloc_init(&OBJC_CLASS____NSIPCallbackSerialization);
        objc_initWeak(&location, v18);
        id v19 = -[NSItemProvider _readableTypeIdentifiersForItemProviderForClass:]( self,  "_readableTypeIdentifiersForItemProviderForClass:",  a3);
        uint64_t v20 = MEMORY[0x1895F87A8];
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        v26[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8;
        v26[3] = &unk_189CA05D0;
        v26[4] = a4;
        v26[5] = a3;
        v26[6] = v19;
        v26[7] = v17;
        void v26[8] = v18;
        objc_copyWeak(&v27, &location);
        v26[9] = self;
        v26[10] = a7;
        uint64_t v21 = objc_msgSend(v17, "loadWithOptions_v2:completionHandler:", a5, v26);
        v24[0] = v20;
        v24[1] = 3221225472LL;
        v24[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14;
        v24[3] = &unk_189CA01B0;
        objc_copyWeak(&v25, &location);
        v24[4] = self;
        v24[5] = v21;
        if (v18)
        {
          block[0] = v20;
          block[1] = 3221225472LL;
          block[2] = __45___NSIPCallbackSerialization_sendBeginBlock___block_invoke;
          block[3] = &unk_189C9FF78;
          block[4] = v18;
          block[5] = v24;
          _NSIPDispatchAsyncCallback(block);
        }

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);
      }

      else
      {
        v23[0] = MEMORY[0x1895F87A8];
        v23[1] = 3221225472LL;
        v23[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15;
        v23[3] = &unk_189C9E898;
        v23[4] = a4;
        v23[5] = a7;
        _NSIPDispatchAsyncCallback(v23);
      }
    }
  }

  else
  {
    RepresentationError = _NSIPCannotLoadRepresentationError((uint64_t)a4, 0LL);
    if (a7) {
      (*((void (**)(id, void, NSError *))a7 + 2))(a7, 0LL, RepresentationError);
    }
  }

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  NSError *a3)
{
  RepresentationError = a3;
  v8[7] = *MEMORY[0x1895F89C0];
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!-[NSString isEqualToString:]( -[NSError domain](a3, "domain"),  "isEqualToString:",  @"NSItemProviderErrorDomain")) {
      RepresentationError = _NSIPCannotLoadRepresentationError(v6, (uint64_t)RepresentationError);
    }
  }

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3;
    v8[3] = &unk_189CA04E8;
    v8[5] = RepresentationError;
    void v8[6] = v7;
    v8[4] = a2;
    _NSIPDispatchAsyncCallback(v8);
  }

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_3( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_4( void *a1,  void *a2)
{
  v11[1] = *MEMORY[0x1895F89C0];
  v11[0] = 0LL;
  if ([a2 urlWrapper])
  {
    id v4 = (id)objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }

  else
  {
    uint64_t v5 = (void *)[a2 archivedObjectClass];
    if (![v5 isSubclassOfClass:a1[4]])
    {
      uint64_t v6 = a1[6];
      if (!v6) {
        return;
      }
      uint64_t v8 = 0LL;
      goto LABEL_11;
    }

    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v5,  [a2 data],  v11);
  }

  uint64_t v6 = a1[6];
  if (!v6) {
    return;
  }
  if (!v4)
  {
    uint64_t v8 = v11[0];
LABEL_11:
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6;
    block[3] = &unk_189CA04E8;
    block[5] = v8;
    void block[6] = v6;
    block[4] = a1[5];
    uint64_t v7 = block;
    goto LABEL_12;
  }

  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5;
  v10[3] = &unk_189C9E898;
  v10[4] = v4;
  v10[5] = v6;
  uint64_t v7 = v10;
LABEL_12:
  _NSIPDispatchAsyncCallback(v7);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_5( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_6( uint64_t *a1)
{
  uint64_t v1 = a1[6];
  uint64_t v2 = _NSIPUnexpectedValueClassError(a1[4], a1[5]);
  return (*(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16))(v1, 0LL, v2);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_7( uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = _NSIPUnexpectedValueClassError(*(void *)(a1 + 32), 0LL);
  return (*(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16))(v1, 0LL, v2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_8( uint64_t a1,  void *a2)
{
  v28[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = [a2 error];
  v28[0] = v4;
  uint64_t v5 = [a2 cleanupHandler];
  uint64_t v6 = MEMORY[0x1895F87A8];
  if (v4)
  {
    uint64_t v7 = 0LL;
LABEL_3:
    v19[0] = v6;
    v19[1] = 3221225472LL;
    uint64_t v20 = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11;
    uint64_t v21 = &unk_189CA0098;
    uint64_t v22 = *(void *)(a1 + 32);
    if ((objc_msgSend((id)objc_msgSend((id)v4, "domain"), "isEqualToString:", @"NSItemProviderErrorDomain") & 1) == 0) {
      uint64_t v4 = (uint64_t)v20((uint64_t)v19, v4);
    }
    v28[0] = v4;
    goto LABEL_6;
  }

  if ([a2 data])
  {
    uint64_t v9 = [a2 archivedObjectClass];
    if (v9)
    {
      uint64_t v10 = v9;
      Class v11 = -[NSKeyedUnarchiver initForReadingFromData:error:]( [NSKeyedUnarchiver alloc],  "initForReadingFromData:error:",  [a2 data],  0);
      -[NSKeyedUnarchiver setRequiresSecureCoding:](v11, "setRequiresSecureCoding:", 0LL);
      uint64_t v7 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:](v11, "decodeObjectOfClass:forKey:", v10, @"root");

      if (v7) {
        goto LABEL_15;
      }
      uint64_t v7 = objc_msgSend( MEMORY[0x189604030],  "objectWithItemProviderData:typeIdentifier:error:",  objc_msgSend(a2, "data"),  *(void *)(a1 + 32),  0);
      if (v7) {
        goto LABEL_15;
      }
    }

    uint64_t v12 = [a2 data];
  }

  else
  {
    if (![a2 urlWrapper])
    {
      RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), 0LL);
LABEL_22:
      uint64_t v4 = (uint64_t)RepresentationError;
      uint64_t v7 = 0LL;
      v28[0] = RepresentationError;
      goto LABEL_35;
    }

    uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "urlWrapper"), "url");
  }

  uint64_t v7 = v12;
  if (!v12)
  {
    uint64_t v4 = 0LL;
    goto LABEL_35;
  }

Class __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_9()
{
  _MergedGlobals_7_0 = (uint64_t)objc_getClass("UIImage");
  Class result = objc_getClass("NSImage");
  qword_18C4963F0 = (uint64_t)result;
  return result;
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_10( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t v6 = [*(id *)(a1 + 32) typeIdentifier];
  uint64_t result = off_18C4917C0(v6);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

NSError *__95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_11( uint64_t a1,  uint64_t a2)
{
  return _NSIPCannotLoadRepresentationError(*(void *)(a1 + 32), a2);
}

void __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_12( uint64_t a1)
{
  void block[6] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = MEMORY[0x1895F87A8];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13;
  v6[3] = &unk_189CA0110;
  objc_copyWeak(&v7, (id *)(a1 + 80));
  v6[4] = *(void *)(a1 + 40);
  if (v2)
  {
    block[0] = v3;
    block[1] = 3221225472LL;
    block[2] = __43___NSIPCallbackSerialization_sendEndBlock___block_invoke;
    block[3] = &unk_189C9FF78;
    block[4] = v2;
    block[5] = v6;
    _NSIPDispatchAsyncCallback(block);
  }

  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
  uint64_t v5 = *(void *)(a1 + 72);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  objc_destroyWeak(&v7);
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_13( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) finishedDataTransferTransactionUUID:v4];
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_14( uint64_t a1)
{
  Weak = objc_loadWeak((id *)(a1 + 48));
  uint64_t v3 = (void *)[*(id *)(a1 + 32) dataTransferDelegate];
  if (Weak) {
    uint64_t v4 = Weak[3];
  }
  else {
    uint64_t v4 = 0LL;
  }
  return [v3 itemProvider:*(void *)(a1 + 32) beganDataTransferTransactionUUID:v4 progress:*(void *)(a1 + 40)];
}

uint64_t __95__NSItemProvider__loadItemOfClass_forTypeIdentifier_options_coerceForCoding_completionHandler___block_invoke_15( uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (v1)
  {
    RepresentationError = _NSIPCannotLoadRepresentationError(*(void *)(result + 32), 0LL);
    return (*(uint64_t (**)(uint64_t, void, NSError *))(v1 + 16))(v1, 0LL, RepresentationError);
  }

  return result;
}

- (void)_loadPreviewImageOfClass:(Class)a3 options:(id)a4 coerceForCoding:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke;
  v6[3] = &unk_189CA05F8;
  v6[4] = self;
  void v6[5] = a3;
  v6[6] = a4;
  v6[7] = a6;
  BOOL v7 = a5;
  _asyncDispatchBlockWithOptions(a4, v6);
}

uint64_t __85__NSItemProvider__loadPreviewImageOfClass_options_coerceForCoding_completionHandler___block_invoke( uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[1];
  if (v3) {
    return [v2 _loadItemOfClass:*(void *)(a1 + 40) withLoadHandler:v3 options:*(void *)(a1 + 48) coerceForCoding:*(unsigned __int8 *)(a1 + 64) completionHandler:*(void *)(a1 + 56)];
  }
  _NSIPCannotLoadPreviewError(0LL);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_loadItemOfClass:(Class)a3 withLoadHandler:(id)a4 options:(id)a5 coerceForCoding:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke;
  v7[3] = &unk_189CA0620;
  v7[4] = a3;
  v7[5] = a7;
  BOOL v8 = a6;
  (*((void (**)(id, void *, Class, id))a4 + 2))(a4, v7, a3, a5);
}

uint64_t __93__NSItemProvider__loadItemOfClass_withLoadHandler_options_coerceForCoding_completionHandler___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v8[1] = *MEMORY[0x1895F89C0];
  if (a3) {
    return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))(*(void *)(a1 + 40), 0LL);
  }
  v8[0] = 0LL;
  if (a2)
  {
    if (*(void *)(a1 + 32))
    {
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v6 = +[_NSItemProviderTypeCoercion typeCoercionForValue:targetClass:]( &OBJC_CLASS____NSItemProviderTypeCoercion,  "typeCoercionForValue:targetClass:",  a2,  *(void *)(a1 + 32));
        BOOL v7 = v6;
        if ((!*(_BYTE *)(a1 + 48) || [v6 shouldCoerceForCoding])
          && ![v7 coerceValueError:v8]
          && !v8[0])
        {
          v8[0] = _NSIPUnexpectedValueClassError(*(void *)(a1 + 32), 0LL);
        }
      }
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setUserInfo:", (id)-[NSDictionary copy](self->_userInfo, "copy"));
  objc_msgSend(v4, "setPreviewImageHandler:", (id)objc_msgSend(self->_previewImageHandler, "copy"));
  objc_msgSend(v4, "set_loadOperator:", self->_loadOperator);
  objc_msgSend( v4,  "set_representationByType:",  (id)-[NSMutableDictionary mutableCopy]( -[NSItemProvider _representationByType](self, "_representationByType"),  "mutableCopy"));
  objc_msgSend( v4,  "set_typeOrder:",  (id)-[NSMutableOrderedSet mutableCopy]( -[NSItemProvider _typeOrder](self, "_typeOrder"),  "mutableCopy"));
  objc_msgSend( v4,  "set_preferredRepresentationByType:",  (id)-[NSMutableDictionary mutableCopy]( -[NSItemProvider _preferredRepresentationByType](self, "_preferredRepresentationByType"),  "mutableCopy"));

  v4[2] = (id)-[NSMutableDictionary mutableCopy](self->_metadata, "mutableCopy");
  v4[9] = (id)-[NSString copy](self->_suggestedName, "copy");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSItemProvider)initWithCoder:(id)a3
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"This object may only be decoded by an NSXPCCoder." userInfo:0]);
  }

  uint64_t v5 = -[NSItemProvider init](self, "init");
  if (v5)
  {
    if (_os_feature_enabled_impl())
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
      __int128 v26 = 0u;
      __int128 v27 = 0u;
      __int128 v28 = 0u;
      __int128 v29 = 0u;
      uint64_t v7 = [&unk_189D1D388 countByEnumeratingWithState:&v26 objects:v25 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v27;
        do
        {
          uint64_t v10 = 0LL;
          do
          {
            if (*(void *)v27 != v9) {
              objc_enumerationMutation(&unk_189D1D388);
            }
            Class v11 = NSClassFromString(*(NSString **)(*((void *)&v26 + 1) + 8 * v10));
            if (v11) {
              [v6 addObject:v11];
            }
            ++v10;
          }

          while (v8 != v10);
          uint64_t v8 = [&unk_189D1D388 countByEnumeratingWithState:&v26 objects:v25 count:16];
        }

        while (v8);
      }

      uint64_t v12 = [a3 decodeObjectOfClasses:v6 forKey:@"loadOperator"];
    }

    else
    {
      uint64_t v12 = [a3 decodeObjectForKey:@"loadOperator"];
    }

    id v13 = (void *)v12;
    uint64_t v14 = (void *)[a3 decodePropertyListForKey:@"typeIdentifiers"];
    if (v13)
    {
      uint64_t v15 = MEMORY[0x1895F87A8];
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __32__NSItemProvider_initWithCoder___block_invoke;
      v22[3] = &unk_189CA0670;
      v22[4] = v5;
      v22[5] = v13;
      [v14 enumerateObjectsUsingBlock:v22];
      v21[0] = v15;
      v21[1] = 3221225472LL;
      v21[2] = __32__NSItemProvider_initWithCoder___block_invoke_3;
      v21[3] = &unk_189CA0420;
      v21[4] = v13;
      v5->_previewImageHandler = (id)[v21 copy];
    }

    else
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __32__NSItemProvider_initWithCoder___block_invoke_4;
      v20[3] = &unk_189CA06D8;
      v20[4] = v5;
      [v14 enumerateObjectsUsingBlock:v20];
    }

    v5->_loadOperator = (_NSItemProviderLoading *)v13;
    uint64_t v16 = [a3 decodePropertyListForKey:@"metadata"];
    if (v16) {
      -[NSMutableDictionary setDictionary:](v5->_metadata, "setDictionary:", v16);
    }
    -[NSItemProvider setUserInfo:](v5, "setUserInfo:", [a3 decodePropertyListForKey:@"userInfo"]);
    uint64_t v17 = (void *)[a3 decodeObjectOfClass:objc_opt_self() forKey:@"suggestedName"];
    if (v17 && (objc_opt_self(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      id v18 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unexpected class '%@' for key '%@'",  objc_opt_class(),  @"suggestedName");
      id v23 = @"NSLocalizedDescription";
      uint64_t v24 = v18;
      objc_msgSend( a3,  "failWithError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  4864,  objc_msgSend(MEMORY[0x189603F68], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1)));
      return 0LL;
    }

    else
    {
      v5->_suggestedName = (NSString *)[v17 copy];
    }
  }

  return v5;
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __32__NSItemProvider_initWithCoder___block_invoke_2;
  v4[3] = &unk_189CA0648;
  uint64_t v2 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = a2;
  return [v2 registerItemForTypeIdentifier:a2 loadHandler:v4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) loadItemForTypeIdentifier:*(void *)(a1 + 40) completionHandler:a2 expectedValueClass:a3 options:a4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) loadPreviewImageWithCompletionHandler:a2 expectedValueClass:a3 options:a4];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) registerItemForTypeIdentifier:a2 loadHandler:&__block_literal_global_113];
}

uint64_t __32__NSItemProvider_initWithCoder___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = -[NSItemProvider registeredTypeIdentifiers](self, "registeredTypeIdentifiers");
    if (v5) {
      [a3 encodeObject:v5 forKey:@"typeIdentifiers"];
    }
    userInfo = self->_userInfo;
    if (userInfo) {
      [a3 encodeObject:userInfo forKey:@"userInfo"];
    }
    loadOperator = self->_loadOperator;
    if (loadOperator) {
      [a3 encodeObject:loadOperator forKey:@"loadOperator"];
    }
    metadata = self->_metadata;
    if (metadata) {
      [a3 encodeObject:metadata forKey:@"metadata"];
    }
    suggestedName = self->_suggestedName;
    if (suggestedName) {
      [a3 encodeObject:suggestedName forKey:@"suggestedName"];
    }
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"This object may only be encoded by an NSXPCCoder." userInfo:0]);
    -[NSItemProvider _loadOperator](v10, v11);
  }

- (_NSItemProviderLoading)_loadOperator
{
  return (_NSItemProviderLoading *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)set_loadOperator:(id)a3
{
}

- (NSMutableDictionary)_representationByType
{
  return self->_representationByType;
}

- (void)set_representationByType:(id)a3
{
}

- (NSMutableOrderedSet)_typeOrder
{
  return self->_typeOrder;
}

- (void)set_typeOrder:(id)a3
{
}

- (NSArray)_representations
{
  return (NSArray *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSMutableDictionary)_preferredRepresentationByType
{
  return self->_preferredRepresentationByType;
}

- (void)set_preferredRepresentationByType:(id)a3
{
}

- (NSUUID)_UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64LL, 1);
}

- (NSDictionary)userInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 88LL, 1);
}

- (void)setUserInfo:(id)a3
{
}

- (NSItemProviderDataTransferDelegate)dataTransferDelegate
{
  return (NSItemProviderDataTransferDelegate *)objc_loadWeak((id *)&self->_dataTransferDelegate);
}

- (void)setDataTransferDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (NSItemProviderLoadHandler)previewImageHandler
{
  return self->_previewImageHandler;
}

- (void)setPreviewImageHandler:(NSItemProviderLoadHandler)previewImageHandler
{
  id v3 = self->_previewImageHandler;
  if (v3 != previewImageHandler)
  {

    self->_previewImageHandler = (id)[previewImageHandler copy];
  }

- (void)loadPreviewImageWithOptions:(NSDictionary *)options completionHandler:(NSItemProviderCompletionHandler)completionHandler
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  if (!_NSIPGetExpectedClassFromCompletionBlock(completionHandler, &v8, 0LL))
  {
    uint64_t v7 = (os_log_s *)_NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "Cannot derive expected value class from a NSItemProvider preview completion handler.",  buf,  2u);
    }
  }

  -[NSItemProvider _loadPreviewImageOfClass:options:coerceForCoding:completionHandler:]( self,  "_loadPreviewImageOfClass:options:coerceForCoding:completionHandler:",  v8,  options,  0LL,  completionHandler);
}

@end
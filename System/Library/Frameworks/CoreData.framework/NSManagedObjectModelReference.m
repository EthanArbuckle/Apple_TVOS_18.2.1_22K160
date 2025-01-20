@interface NSManagedObjectModelReference
- (BOOL)resolve:(id *)a3;
- (NSBundle)bundle;
- (NSDictionary)entityVersionHashes;
- (NSManagedObjectModel)model;
- (NSManagedObjectModel)resolvedModel;
- (NSManagedObjectModelReference)initWithEntityVersionHashes:(NSDictionary *)versionHash inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithFileURL:(NSURL *)fileURL versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithModel:(NSManagedObjectModel *)model versionChecksum:(NSString *)versionChecksum;
- (NSManagedObjectModelReference)initWithName:(NSString *)modelName inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum;
- (NSString)modelName;
- (NSString)versionChecksum;
- (NSURL)fileURL;
- (void)dealloc;
- (void)setBundle:(id)a3;
- (void)setEntityVersionHashes:(id)a3;
- (void)setFileURL:(id)a3;
- (void)setModel:(id)a3;
- (void)setModelName:(id)a3;
- (void)unresolve;
@end

@implementation NSManagedObjectModelReference

- (NSManagedObjectModelReference)initWithFileURL:(NSURL *)fileURL versionChecksum:(NSString *)versionChecksum
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelReference;
  v6 = -[NSManagedObjectModelReference init](&v8, sel_init);
  if (v6)
  {
    v6->_fileURL = (NSURL *)-[NSURL copy](fileURL, "copy");
    v6->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }

  return v6;
}

- (NSManagedObjectModelReference)initWithEntityVersionHashes:(NSDictionary *)versionHash inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelReference;
  objc_super v8 = -[NSManagedObjectModelReference init](&v11, sel_init);
  if (v8)
  {
    v8->_entityVersionHashes = (NSDictionary *)-[NSDictionary copy](versionHash, "copy");
    if (bundle) {
      v9 = bundle;
    }
    else {
      v9 = (NSBundle *)(id)[MEMORY[0x1896077F8] mainBundle];
    }
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }

  return v8;
}

- (NSManagedObjectModelReference)initWithName:(NSString *)modelName inBundle:(NSBundle *)bundle versionChecksum:(NSString *)versionChecksum
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelReference;
  objc_super v8 = -[NSManagedObjectModelReference init](&v11, sel_init);
  if (v8)
  {
    v8->_modelName = (NSString *)-[NSString copy](modelName, "copy");
    if (bundle) {
      v9 = bundle;
    }
    else {
      v9 = (NSBundle *)(id)[MEMORY[0x1896077F8] mainBundle];
    }
    v8->_bundle = v9;
    v8->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }

  return v8;
}

- (NSManagedObjectModelReference)initWithModel:(NSManagedObjectModel *)model versionChecksum:(NSString *)versionChecksum
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelReference;
  v6 = -[NSManagedObjectModelReference init](&v8, sel_init);
  if (v6)
  {
    v6->_model = (NSManagedObjectModel *)-[NSManagedObjectModel copy](model, "copy");
    v6->_versionChecksum = (NSString *)-[NSString copy](versionChecksum, "copy");
  }

  return v6;
}

- (void)dealloc
{
  self->_fileURL = 0LL;
  self->_versionChecksum = 0LL;

  self->_bundle = 0LL;
  self->_modelName = 0LL;

  self->_entityVersionHashes = 0LL;
  self->_model = 0LL;

  self->_resolvedModel = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSManagedObjectModelReference;
  -[NSManagedObjectModelReference dealloc](&v3, sel_dealloc);
}

- (BOOL)resolve:(id *)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  if (self->_resolvedModel) {
    return 1;
  }
  id v41 = 0LL;
  model = self->_model;
  if (model)
  {
    bundle = model;
LABEL_7:
    self->_resolvedModel = bundle;
    goto LABEL_8;
  }

  if (self->_fileURL)
  {
    bundle = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  self->_fileURL);
    goto LABEL_7;
  }

  bundle = (NSManagedObjectModel *)self->_bundle;
  if (!bundle)
  {
LABEL_8:
    -[NSManagedObjectModel _setIsEditable:](bundle, "_setIsEditable:", 0LL);
    if (!-[NSString isEqualToString:]( -[NSManagedObjectModel versionChecksum](self->_resolvedModel, "versionChecksum"),  "isEqualToString:",  self->_versionChecksum))
    {
      id v41 = (id)objc_msgSend( MEMORY[0x189607870],  "errorWithDomain:code:userInfo:",  *MEMORY[0x189607460],  134100,  objc_msgSend( MEMORY[0x189603F68],  "dictionaryWithObjectsAndKeys:",  @"The version hash (and associated hashes) are incompatible with the current Core Data version.",  @"reason",  -[NSManagedObjectModel versionHash](self->_resolvedModel, "versionHash"),  @"versionHash",  self->_versionChecksum,  @"checksum",  0));

      self->_resolvedModel = 0LL;
    }

    goto LABEL_10;
  }

  modelName = self->_modelName;
  if (!modelName)
  {
    if (!self->_entityVersionHashes)
    {
      bundle = 0LL;
      goto LABEL_8;
    }

    v45 = bundle;
    v19 = +[NSManagedObjectModel _modelPathsFromBundles:]( (uint64_t)NSManagedObjectModel,  (void *)[MEMORY[0x189603F18] arrayWithObjects:&v45 count:1]);
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v33;
LABEL_30:
      uint64_t v23 = 0LL;
      while (1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [MEMORY[0x189604030] fileURLWithPath:*(void *)(*((void *)&v32 + 1) + 8 * v23)];
        id v25 = +[NSManagedObjectModel versionsHashesForModelAtURL:error:]( &OBJC_CLASS___NSManagedObjectModel,  "versionsHashesForModelAtURL:error:",  v24,  &v41);
        if (v41) {
          break;
        }
        if ([v25 isEqualToDictionary:self->_entityVersionHashes])
        {
          resolvedModel = -[NSManagedObjectModel initWithContentsOfURL:]( objc_alloc(&OBJC_CLASS___NSManagedObjectModel),  "initWithContentsOfURL:",  v24);
          self->_resolvedModel = resolvedModel;
          goto LABEL_44;
        }

        if (v21 == ++v23)
        {
          uint64_t v21 = [v19 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v21) {
            goto LABEL_30;
          }
          break;
        }
      }
    }

    resolvedModel = self->_resolvedModel;
LABEL_44:
    if (resolvedModel)
    {
      id v12 = v41;
      goto LABEL_49;
    }

    v27 = (void *)MEMORY[0x189607870];
    uint64_t v28 = *MEMORY[0x189607460];
    uint64_t v42 = *MEMORY[0x1896075E0];
    uint64_t v43 = [NSString stringWithFormat:@"A model with version hashes %@ could not be found in the bundle at %@.", self->_entityVersionHashes, -[NSBundle bundlePath](self->_bundle, "bundlePath")];
    v29 = (void *)MEMORY[0x189603F68];
    v30 = &v43;
    v31 = &v42;
    goto LABEL_47;
  }

  v10 = (void *)-[NSManagedObjectModel URLForResource:withExtension:]( bundle,  "URLForResource:withExtension:",  modelName,  @"momd");
  v40 = 0LL;
  objc_super v11 = +[NSManagedObjectModel checksumsForVersionedModelAtURL:error:]( &OBJC_CLASS___NSManagedObjectModel,  "checksumsForVersionedModelAtURL:error:",  v10,  &v40);
  id v12 = v40;
  if (!v40)
  {
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v36 = 0u;
    __int128 v37 = 0u;
    uint64_t v13 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v37;
      while (2)
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend( -[NSDictionary objectForKey:](v11, "objectForKey:", v17),  "isEqualToString:",  self->_versionChecksum))
          {
            v18 = -[NSManagedObjectModel initWithContentsOfURL:]( [NSManagedObjectModel alloc],  "initWithContentsOfURL:",  objc_msgSend( (id)objc_msgSend(v10, "URLByAppendingPathComponent:", v17),  "URLByAppendingPathExtension:",  @"mom"));
            self->_resolvedModel = v18;
            goto LABEL_39;
          }
        }

        uint64_t v14 = -[NSDictionary countByEnumeratingWithState:objects:count:]( v11,  "countByEnumeratingWithState:objects:count:",  &v36,  v48,  16LL);
        if (v14) {
          continue;
        }
        break;
      }
    }

    v18 = self->_resolvedModel;
LABEL_39:
    if (v18)
    {
      id v12 = 0LL;
      goto LABEL_49;
    }

    v27 = (void *)MEMORY[0x189607870];
    uint64_t v28 = *MEMORY[0x189607460];
    uint64_t v46 = *MEMORY[0x1896075E0];
    uint64_t v47 = [NSString stringWithFormat:@"A model with version checksum %@ could not be found in the bundle at %@.", self->_versionChecksum, -[NSBundle bundlePath](self->_bundle, "bundlePath")];
    v29 = (void *)MEMORY[0x189603F68];
    v30 = &v47;
    v31 = &v46;
LABEL_47:
    id v12 = (id)objc_msgSend( v27,  "errorWithDomain:code:userInfo:",  v28,  134504,  objc_msgSend(v29, "dictionaryWithObjects:forKeys:count:", v30, v31, 1));
  }

  id v41 = v12;
LABEL_49:
  if (!v12)
  {
    bundle = self->_resolvedModel;
    goto LABEL_8;
  }

- (void)unresolve
{
  self->_resolvedModel = 0LL;
}

- (NSURL)fileURL
{
  return (NSURL *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setFileURL:(id)a3
{
}

- (NSString)versionChecksum
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (NSBundle)bundle
{
  return (NSBundle *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBundle:(id)a3
{
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setModelName:(id)a3
{
}

- (NSDictionary)entityVersionHashes
{
  return (NSDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setEntityVersionHashes:(id)a3
{
}

- (NSManagedObjectModel)model
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setModel:(id)a3
{
}

- (NSManagedObjectModel)resolvedModel
{
  return (NSManagedObjectModel *)objc_getProperty(self, a2, 56LL, 1);
}

@end
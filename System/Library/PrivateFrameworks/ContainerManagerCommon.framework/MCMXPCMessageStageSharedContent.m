@interface MCMXPCMessageStageSharedContent
- (MCMXPCMessageStageSharedContent)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (NSString)destinationRelativePath;
- (NSString)sourceRelativePath;
- (unsigned)disposition;
@end

@implementation MCMXPCMessageStageSharedContent

- (MCMXPCMessageStageSharedContent)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___MCMXPCMessageStageSharedContent;
  v9 = -[MCMXPCMessageWithIdentifierBase initWithXPCObject:context:error:]( &v16,  sel_initWithXPCObject_context_error_,  v8,  a4,  a5);
  v10 = v9;
  if (v9)
  {
    uint64_t v11 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v9, "nsStringValueFromXPCObject:key:", v8, "SourcePath");
    sourceRelativePath = v10->_sourceRelativePath;
    v10->_sourceRelativePath = (NSString *)v11;

    uint64_t v13 = -[MCMXPCMessageBase nsStringValueFromXPCObject:key:](v10, "nsStringValueFromXPCObject:key:", v8, "DestPath");
    destinationRelativePath = v10->_destinationRelativePath;
    v10->_destinationRelativePath = (NSString *)v13;
  }

  return v10;
}

- (unsigned)disposition
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MCMXPCMessageStageSharedContent;
  unsigned int v2 = -[MCMXPCMessageBase disposition](&v5, sel_disposition);
  if (v2 == 1)
  {
    id v3 = containermanager_copy_global_configuration();
    unsigned int v2 = [v3 dispositionForContainerClass:13];
  }

  return v2;
}

- (NSString)sourceRelativePath
{
  return self->_sourceRelativePath;
}

- (NSString)destinationRelativePath
{
  return self->_destinationRelativePath;
}

- (void).cxx_destruct
{
}

@end
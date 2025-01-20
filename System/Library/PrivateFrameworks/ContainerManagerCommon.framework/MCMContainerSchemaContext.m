@interface MCMContainerSchemaContext
+ (MCMContainerSchemaContext)contextWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11;
- (MCMContainerPath)containerPath;
- (MCMContainerPath)finalContainerPath;
- (MCMContainerSchemaContext)initWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11;
- (MCMLibraryRepairForUser)libraryRepair;
- (MCMPOSIXUser)posixOwner;
- (NSString)identifier;
- (NSURL)homeDirectoryURL;
- (int)dataProtectionClass;
- (unint64_t)containerClass;
- (unsigned)posixMode;
@end

@implementation MCMContainerSchemaContext

- (MCMContainerSchemaContext)initWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v16 = a3;
  id v17 = a4;
  id v26 = a5;
  id v25 = a7;
  id v24 = a10;
  id v18 = a11;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___MCMContainerSchemaContext;
  v19 = -[MCMContainerSchemaContext init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_homeDirectoryURL, a3);
    objc_storeStrong((id *)&v20->_containerPath, a4);
    objc_storeStrong((id *)&v20->_finalContainerPath, a5);
    v20->_posixMode = a6;
    objc_storeStrong((id *)&v20->_posixOwner, a7);
    v20->_containerClass = a8;
    v20->_dataProtectionClass = a9;
    objc_storeStrong((id *)&v20->_libraryRepair, a10);
    objc_storeStrong((id *)&v20->_identifier, a11);
  }

  return v20;
}

- (NSURL)homeDirectoryURL
{
  return self->_homeDirectoryURL;
}

- (MCMContainerPath)containerPath
{
  return self->_containerPath;
}

- (MCMContainerPath)finalContainerPath
{
  return self->_finalContainerPath;
}

- (unsigned)posixMode
{
  return self->_posixMode;
}

- (MCMPOSIXUser)posixOwner
{
  return self->_posixOwner;
}

- (unint64_t)containerClass
{
  return self->_containerClass;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (MCMLibraryRepairForUser)libraryRepair
{
  return self->_libraryRepair;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
}

+ (MCMContainerSchemaContext)contextWithHomeDirectoryURL:(id)a3 containerPath:(id)a4 finalContainerPath:(id)a5 POSIXMode:(unsigned __int16)a6 POSIXOwner:(id)a7 containerClass:(unint64_t)a8 dataProtectionClass:(int)a9 libraryRepair:(id)a10 identifier:(id)a11
{
  uint64_t v13 = a6;
  id v18 = a11;
  id v19 = a10;
  id v20 = a7;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LODWORD(v26) = a9;
  id v24 = (void *)[objc_alloc((Class)a1) initWithHomeDirectoryURL:v23 containerPath:v22 finalContainerPath:v21 POSIXMode:v13 POSIXOwner:v20 containerClass:a8 dataProt ectionClass:v26 libraryRepair:v19 identifier:v18];

  return (MCMContainerSchemaContext *)v24;
}

@end
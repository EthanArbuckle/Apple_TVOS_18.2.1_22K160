@interface MSDContentFilesContext
+ (NSMutableSet)processedContainers;
+ (id)defaultContextForBackupItem:(id)a3;
+ (id)defaultContextForContainerizedAppDataItem:(id)a3;
+ (id)defaultContextForNonContainerizedAppDataItem:(id)a3;
+ (void)initialize;
- (BOOL)containerized;
- (BOOL)verifyFileHash;
- (MSDManifest)deviceManifest;
- (MSDManifest)masterManifest;
- (NSMutableArray)alreadyHaveList;
- (NSMutableArray)cloneFailedList;
- (NSMutableArray)creationList;
- (NSString)appIdentifier;
- (NSString)containerType;
- (NSString)contentRootPath;
- (NSString)originServer;
- (NSString)pseudoContentRootPath;
- (NSString)rootFileSystemPath;
- (_NSRange)contentBeingInstalled;
- (id)secondaryStagingRootPath;
- (id)stashedStagingRootPath;
- (id)uniqueName;
- (void)setAlreadyHaveList:(id)a3;
- (void)setAppIdentifier:(id)a3;
- (void)setCloneFailedList:(id)a3;
- (void)setContainerType:(id)a3;
- (void)setContainerized:(BOOL)a3;
- (void)setContentBeingInstalled:(_NSRange)a3;
- (void)setContentRootPath:(id)a3;
- (void)setCreationList:(id)a3;
- (void)setDeviceManifest:(id)a3;
- (void)setMasterManifest:(id)a3;
- (void)setOriginServer:(id)a3;
- (void)setPseudoContentRootPath:(id)a3;
- (void)setRootFileSystemPath:(id)a3;
- (void)setVerifyFileHash:(BOOL)a3;
@end

@implementation MSDContentFilesContext

+ (void)initialize
{
  uint64_t v3 = objc_opt_self(&OBJC_CLASS___MSDContentFilesContext, a2);
  id v4 = (id)objc_claimAutoreleasedReturnValue(v3);

  if (v4 == a1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    v6 = (void *)qword_1001253C0;
    qword_1001253C0 = v5;
  }

+ (NSMutableSet)processedContainers
{
  return (NSMutableSet *)(id)qword_1001253C0;
}

+ (id)defaultContextForBackupItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", @"/");
  -[MSDContentFilesContext setContainerType:](v4, "setContainerType:", @"BackupData");
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 0LL);
  return v4;
}

+ (id)defaultContextForContainerizedAppDataItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", 0LL);
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 1LL);
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
  return v4;
}

+ (id)defaultContextForNonContainerizedAppDataItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___MSDContentFilesContext);
  -[MSDOperationContext setIdentifier:](v4, "setIdentifier:", v3);

  -[MSDContentFilesContext setContentRootPath:](v4, "setContentRootPath:", @"/");
  -[MSDContentFilesContext setContainerized:](v4, "setContainerized:", 0LL);
  -[MSDContentFilesContext setContentBeingInstalled:](v4, "setContentBeingInstalled:", 0x7FFFFFFFFFFFFFFFLL, 0LL);
  return v4;
}

- (id)uniqueName
{
  uniqueName = self->_uniqueName;
  if (!uniqueName)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext containerType](self, "containerType"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationContext identifier](self, "identifier"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v4,  v5));
    v7 = self->_uniqueName;
    self->_uniqueName = v6;

    uniqueName = self->_uniqueName;
  }

  return uniqueName;
}

- (id)secondaryStagingRootPath
{
  if (!self->_secondaryStagingRootPath)
  {
    if (+[MSDOperationContext downloadOnly](&OBJC_CLASS___MSDOperationContext, "downloadOnly"))
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext uniqueName](self, "uniqueName"));
      id v4 = @"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_secondary_staging";
    }

    else
    {
      id v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext appIdentifier](self, "appIdentifier"));
      id v4 = @"/var/MSDWorkContainer/MSD_secondary_staging";
    }

    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v4, "stringByAppendingPathComponent:", v3));
    secondaryStagingRootPath = self->_secondaryStagingRootPath;
    self->_secondaryStagingRootPath = v5;
  }

  return self->_secondaryStagingRootPath;
}

- (id)stashedStagingRootPath
{
  stashedStagingRootPath = self->_stashedStagingRootPath;
  if (!stashedStagingRootPath)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentFilesContext uniqueName](self, "uniqueName"));
    uint64_t v5 = (NSString *)objc_claimAutoreleasedReturnValue( [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer/MSD_stashed_staging" stringByAppendingPathComponent:v4]);
    v6 = self->_stashedStagingRootPath;
    self->_stashedStagingRootPath = v5;

    stashedStagingRootPath = self->_stashedStagingRootPath;
  }

  return stashedStagingRootPath;
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
}

- (MSDManifest)masterManifest
{
  return self->_masterManifest;
}

- (void)setMasterManifest:(id)a3
{
}

- (MSDManifest)deviceManifest
{
  return self->_deviceManifest;
}

- (void)setDeviceManifest:(id)a3
{
}

- (NSString)originServer
{
  return self->_originServer;
}

- (void)setOriginServer:(id)a3
{
}

- (NSString)rootFileSystemPath
{
  return self->_rootFileSystemPath;
}

- (void)setRootFileSystemPath:(id)a3
{
}

- (NSString)contentRootPath
{
  return self->_contentRootPath;
}

- (void)setContentRootPath:(id)a3
{
}

- (NSString)pseudoContentRootPath
{
  return self->_pseudoContentRootPath;
}

- (void)setPseudoContentRootPath:(id)a3
{
}

- (NSString)containerType
{
  return self->_containerType;
}

- (void)setContainerType:(id)a3
{
}

- (BOOL)containerized
{
  return self->_containerized;
}

- (void)setContainerized:(BOOL)a3
{
  self->_containerized = a3;
}

- (NSMutableArray)alreadyHaveList
{
  return self->_alreadyHaveList;
}

- (void)setAlreadyHaveList:(id)a3
{
}

- (NSMutableArray)cloneFailedList
{
  return self->_cloneFailedList;
}

- (void)setCloneFailedList:(id)a3
{
}

- (NSMutableArray)creationList
{
  return self->_creationList;
}

- (void)setCreationList:(id)a3
{
}

- (BOOL)verifyFileHash
{
  return self->_verifyFileHash;
}

- (void)setVerifyFileHash:(BOOL)a3
{
  self->_verifyFileHash = a3;
}

- (_NSRange)contentBeingInstalled
{
  p_contentBeingInstalled = &self->_contentBeingInstalled;
  NSUInteger location = self->_contentBeingInstalled.location;
  NSUInteger length = p_contentBeingInstalled->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setContentBeingInstalled:(_NSRange)a3
{
  self->_contentBeingInstalled = a3;
}

- (void).cxx_destruct
{
}

@end
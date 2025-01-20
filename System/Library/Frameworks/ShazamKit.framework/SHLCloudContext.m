@interface SHLCloudContext
+ (SHLCloudContext)sharedContext;
- (CKContainer)debugContainer;
- (CKContainer)defaultContainer;
- (CKContainer)manateeContainer;
- (CKRecordZone)shazamLibraryZone;
- (id)containerWithScope:(int64_t)a3;
@end

@implementation SHLCloudContext

+ (SHLCloudContext)sharedContext
{
  if (qword_1000889C0 != -1) {
    dispatch_once(&qword_1000889C0, &stru_10006D8E0);
  }
  return (SHLCloudContext *)(id)qword_1000889B8;
}

- (CKContainer)defaultContainer
{
  defaultContainer = self->_defaultContainer;
  if (!defaultContainer)
  {
    v4 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.shazam"));
    v5 = self->_defaultContainer;
    self->_defaultContainer = v4;

    defaultContainer = self->_defaultContainer;
  }

  return defaultContainer;
}

- (CKContainer)manateeContainer
{
  manateeContainer = self->_manateeContainer;
  if (!manateeContainer)
  {
    v4 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"com.apple.shazam.secure"));
    v5 = self->_manateeContainer;
    self->_manateeContainer = v4;

    manateeContainer = self->_manateeContainer;
  }

  return manateeContainer;
}

- (CKContainer)debugContainer
{
  debugContainer = self->_debugContainer;
  if (!debugContainer)
  {
    v4 = (CKContainer *)objc_claimAutoreleasedReturnValue( +[CKContainer containerWithIdentifier:]( &OBJC_CLASS___CKContainer,  "containerWithIdentifier:",  @"iCloud.com.shazam.Shazam"));
    v5 = self->_debugContainer;
    self->_debugContainer = v4;

    debugContainer = self->_debugContainer;
  }

  return debugContainer;
}

- (CKRecordZone)shazamLibraryZone
{
  shazamLibraryZone = self->_shazamLibraryZone;
  if (!shazamLibraryZone)
  {
    v4 = -[CKRecordZoneID initWithZoneName:ownerName:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithZoneName:ownerName:",  @"shazam-library",  CKCurrentUserDefaultName);
    v5 = -[CKRecordZone initWithZoneID:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneID:", v4);
    v6 = self->_shazamLibraryZone;
    self->_shazamLibraryZone = v5;

    shazamLibraryZone = self->_shazamLibraryZone;
  }

  return shazamLibraryZone;
}

- (id)containerWithScope:(int64_t)a3
{
  switch(a3)
  {
    case 2LL:
      v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SHLCloudContext debugContainer](self, "debugContainer"));
      goto LABEL_7;
    case 1LL:
      v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SHLCloudContext manateeContainer](self, "manateeContainer"));
      goto LABEL_7;
    case 0LL:
      v3 = (const char *)objc_claimAutoreleasedReturnValue(-[SHLCloudContext defaultContainer](self, "defaultContainer"));
LABEL_7:
      a2 = v3;
      break;
  }

  return (id)(id)a2;
}

- (void).cxx_destruct
{
}

@end
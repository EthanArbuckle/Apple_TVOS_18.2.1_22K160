@interface NSDictionary(NSFileAttributes)
- (uint64_t)fileCreationDate;
- (uint64_t)fileExtensionHidden;
- (uint64_t)fileGroupOwnerAccountID;
- (uint64_t)fileGroupOwnerAccountName;
- (uint64_t)fileGroupOwnerAccountNumber;
- (uint64_t)fileHFSCreatorCode;
- (uint64_t)fileHFSTypeCode;
- (uint64_t)fileIsAppendOnly;
- (uint64_t)fileIsImmutable;
- (uint64_t)fileModificationDate;
- (uint64_t)fileOwnerAccountID;
- (uint64_t)fileOwnerAccountName;
- (uint64_t)fileOwnerAccountNumber;
- (uint64_t)filePosixPermissions;
- (uint64_t)fileSize;
- (uint64_t)fileSystemFileNumber;
- (uint64_t)fileSystemNumber;
- (uint64_t)fileType;
@end

@implementation NSDictionary(NSFileAttributes)

- (uint64_t)fileSize
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileSize"), "longLongValue");
}

- (uint64_t)fileModificationDate
{
  return [a1 objectForKey:@"NSFileModificationDate"];
}

- (uint64_t)fileType
{
  return [a1 objectForKey:@"NSFileType"];
}

- (uint64_t)filePosixPermissions
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFilePosixPermissions"), "unsignedIntegerValue") & 0xFFF;
}

- (uint64_t)fileOwnerAccountName
{
  return [a1 objectForKey:@"NSFileOwnerAccountName"];
}

- (uint64_t)fileOwnerAccountNumber
{
  return 0LL;
}

- (uint64_t)fileGroupOwnerAccountName
{
  return [a1 objectForKey:@"NSFileGroupOwnerAccountName"];
}

- (uint64_t)fileGroupOwnerAccountNumber
{
  return 0LL;
}

- (uint64_t)fileSystemNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileSystemNumber"), "integerValue");
}

- (uint64_t)fileSystemFileNumber
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileSystemFileNumber"), "unsignedIntegerValue");
}

- (uint64_t)fileExtensionHidden
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileExtensionHidden"), "BOOLValue");
}

- (uint64_t)fileHFSCreatorCode
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileHFSCreatorCode"), "unsignedLongValue");
}

- (uint64_t)fileHFSTypeCode
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileHFSTypeCode"), "unsignedLongValue");
}

- (uint64_t)fileIsImmutable
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileImmutable"), "BOOLValue");
}

- (uint64_t)fileIsAppendOnly
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", @"NSFileAppendOnly"), "BOOLValue");
}

- (uint64_t)fileCreationDate
{
  return [a1 objectForKey:@"NSFileCreationDate"];
}

- (uint64_t)fileOwnerAccountID
{
  return [a1 objectForKey:@"NSFileOwnerAccountID"];
}

- (uint64_t)fileGroupOwnerAccountID
{
  return [a1 objectForKey:@"NSFileGroupOwnerAccountID"];
}

@end
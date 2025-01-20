@interface SKMediaKit
+ (id)getFilesystem:(id)a3;
+ (id)getMediaKitFilesystemInfo:(id)a3;
+ (id)getMediaKitFilesystemType:(id)a3;
+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SKMediaKit

+ (id)getMediaKitFilesystemType:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemInfo:](&OBJC_CLASS___SKMediaKit, "getMediaKitFilesystemInfo:", a3));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([v3 fsType]);
    if (v5) {
      v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fsType]);
    }
    else {
      v6 = 0LL;
    }
  }

  else
  {
    v6 = 0LL;
  }

  return v6;
}

+ (id)getMediaKitFilesystemInfo:(id)a3
{
  uint64_t v3 = MKMediaCreateWithPath(kCFAllocatorDefault, [a3 UTF8String], 0, v8);
  v4 = (SKMediaKitFSInfo *)v3;
  if (v3)
  {
    v5 = (void *)MKCFCreateFSInfo(v3, &off_100047A88, v7);
    CFRelease(v4);
    if (v5) {
      v4 = -[SKMediaKitFSInfo initWithFSInfo:](objc_alloc(&OBJC_CLASS___SKMediaKitFSInfo), "initWithFSInfo:", v5);
    }
    else {
      v4 = 0LL;
    }
  }

  return v4;
}

+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  unsigned int v13 = 0;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue([a3 diskIdentifier]);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/r%@", v8));

  id v10 = v9;
  v11 = (void *)MKMediaCreateWithPath(kCFAllocatorDefault, [v10 UTF8String], v7, &v13);

  if (!v11) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", v13, a5));
  }

  return v11;
}

+ (id)getFilesystem:(id)a3
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKMediaKit getMediaKitFilesystemInfo:](&OBJC_CLASS___SKMediaKit, "getMediaKitFilesystemInfo:", v3));

  if (v4)
  {
    v20[0] = @"HFS Unknown variant";
    v20[1] = @"HFS";
    v21[0] = @"hfs";
    v21[1] = @"hfs";
    v20[2] = @"HFS+";
    v20[3] = @"HFS+ Embedded";
    v21[2] = @"hfs";
    v21[3] = @"hfs";
    v20[4] = @"HFS+ Extended";
    v20[5] = @"APFS";
    v21[4] = @"hfs";
    v21[5] = @"apfs";
    v20[6] = @"FAT";
    v20[7] = @"FAT12";
    v21[6] = @"msdos";
    v21[7] = @"msdos";
    v20[8] = @"FAT16";
    v20[9] = @"FAT32";
    v21[8] = @"msdos";
    v21[9] = @"msdos";
    v20[10] = @"NTFS";
    v20[11] = @"ExFAT";
    v21[10] = @"ntfs";
    v21[11] = @"exfat";
    v20[12] = @"UFS";
    v20[13] = @"ISO9660";
    v21[12] = @"ufs";
    v21[13] = @"cd9660";
    v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v21,  v20,  14LL));
    v6 = (void *)objc_claimAutoreleasedReturnValue([v4 fsInfo]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"Filesystem"]);
    v8 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v7]);

    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 fsInfo]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"Attributes"]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"Case sensitive"]);
    id v12 = [v11 BOOLValue];

    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue( +[SKFilesystem filesystemFor:caseSensitive:]( &OBJC_CLASS___SKFilesystem,  "filesystemFor:caseSensitive:",  v8,  v12));
    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v4 fsInfo]);
      v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKey:@"Attributes"]);
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"Journaled"]);
      id v17 = [v16 BOOLValue];

      [v13 setIsJournaled:v17];
      id v18 = v13;
    }
  }

  else
  {
    unsigned int v13 = 0LL;
  }

  return v13;
}

@end
@interface SKMediaKit
+ (id)getFilesystem:(id)a3;
+ (id)getMediaKitFilesystemInfo:(id)a3;
+ (id)getMediaKitFilesystemType:(id)a3;
+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5;
@end

@implementation SKMediaKit

+ (id)getMediaKitFilesystemType:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    [v3 fsType];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      [v4 fsType];
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
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
  v3 = (SKMediaKitFSInfo *)MKMediaCreateWithPath();
  if (v3)
  {
    v4 = (void *)MKCFCreateFSInfo();
    CFRelease(v3);
    if (v4) {
      v3 = -[SKMediaKitFSInfo initWithFSInfo:](objc_alloc(&OBJC_CLASS___SKMediaKitFSInfo), "initWithFSInfo:", v4);
    }
    else {
      v3 = 0LL;
    }
  }

  return v3;
}

+ (id)newMediaRefForDisk:(id)a3 options:(id)a4 error:(id *)a5
{
  v7 = (void *)NSString;
  id v8 = a4;
  [a3 diskIdentifier];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 stringWithFormat:@"/dev/r%@", v9];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  id v11 = v10;
  [v11 UTF8String];
  v12 = (void *)MKMediaCreateWithPath();

  if (!v12)
  {
    v12 = +[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 0LL, a5);
  }

  return v12;
}

+ (id)getFilesystem:(id)a3
{
  v21[14] = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"/dev/%@", a3];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[SKMediaKit getMediaKitFilesystemInfo:](&OBJC_CLASS___SKMediaKit, "getMediaKitFilesystemInfo:", v3);
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
    [MEMORY[0x189603F68] dictionaryWithObjects:v21 forKeys:v20 count:14];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 fsInfo];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:@"Filesystem"];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v4 fsInfo];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 objectForKey:@"Attributes"];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKey:@"Case sensitive"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 BOOLValue];
    v13 = +[SKFilesystem filesystemFor:caseSensitive:](&OBJC_CLASS___SKFilesystem, "filesystemFor:caseSensitive:", v8, v12);
    if (v13)
    {
      [v4 fsInfo];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 objectForKey:@"Attributes"];
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 objectForKey:@"Journaled"];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 BOOLValue];

      [v13 setIsJournaled:v17];
      id v18 = v13;
    }
  }

  else
  {
    v13 = 0LL;
  }

  return v13;
}

@end
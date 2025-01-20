id sub_100003EFC()
{
  void *v0;
  uint64_t v1;
  NSSet *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSSet *v12;
  void *v13;
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKDaemonConnectionProtocol));
  v1 = objc_opt_class(&OBJC_CLASS___SKEraseVolume);
  v2 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  objc_opt_class(&OBJC_CLASS___SKEraseDisk),  0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  [v0 setClasses:v3 forSelector:"eraseWithEraser:reply:" argumentIndex:0 ofReply:0];

  v4 = objc_opt_class(&OBJC_CLASS___NSDate);
  v5 = objc_opt_class(&OBJC_CLASS___NSArray);
  v6 = objc_opt_class(&OBJC_CLASS___NSString);
  v7 = objc_opt_class(&OBJC_CLASS___NSNull);
  v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  v9 = objc_opt_class(&OBJC_CLASS___NSData);
  v10 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  v11 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v12 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  v11,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  [v0 setClasses:v13 forSelector:"eraseWithEraser:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

id sub_100004094()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___SKHelperClientProtocol));
  uint64_t v1 = objc_opt_class(&OBJC_CLASS___NSDate);
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSNull);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSNumber);
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSData);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSOrderedSet);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  v9 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  v5,  v6,  v7,  v8,  objc_opt_class(&OBJC_CLASS___NSError),  0LL);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v0 setClasses:v10 forSelector:"requestWithUUID:didCompleteWithResult:" argumentIndex:1 ofReply:0];

  return v0;
}

uint64_t sub_100004240(void *a1)
{
  id v1 = a1;
  id v2 = [v1 copyPropertyWithClass:objc_opt_class(NSString) key:@"Sealed"];

  if (v2)
  {
    if ([v2 isEqualToString:@"Broken"])
    {
      uint64_t v3 = 2LL;
    }

    else if ([v2 isEqualToString:@"Yes"])
    {
      uint64_t v3 = 3LL;
    }

    else
    {
      uint64_t v3 = [v2 isEqualToString:@"No"];
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  return v3;
}

LABEL_25:
LABEL_45:
        v21 = 0LL;
LABEL_46:
        v23 = 1;
LABEL_47:

        goto LABEL_48;
      }

      v11 = v8;
      if (statfs((const char *)[v11 fileSystemRepresentation], &v75) == -1)
      {
        v42 = sub_10000E2BC();
        v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          v44 = *__error();
          *(_DWORD *)buf = 136315650;
          v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          v71 = 2112;
          v72 = v11;
          v73 = 1024;
          LODWORD(v74) = v44;
          _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_ERROR,  "%s: statfs failed for %@, errno %d",  buf,  0x1Cu);
        }

        goto LABEL_45;
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  v75.f_mntfromname));
      v13 = (void *)objc_claimAutoreleasedReturnValue([v12 componentsSeparatedByString:@"@/dev/"]);
      if ([v13 count] != (id)2
        || (v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:1]),
            v15 = [v14 hasPrefix:@"disk"],
            v14,
            (v15 & 1) == 0))
      {
        v40 = sub_10000E2BC();
        v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          v71 = 2112;
          v72 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s: Unexpected mntFromName for root disk: %@",  buf,  0x16u);
        }

        goto LABEL_45;
      }

      v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
      -[SKAPFSSnapshotDisk setSnapshotName:](v2, "setSnapshotName:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:1]);
      v18 = (void *)objc_claimAutoreleasedReturnValue([v17 stringByAppendingString:@":root_snapshot"]);
      -[SKAPFSSnapshotDisk setDiskIdentifier:](v2, "setDiskIdentifier:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
      session = (__DASession *)[v19 diskArbSession];
      v20 = v17;
      v21 = DADiskCreateFromBSDName(0, session, (const char *)[v20 UTF8String]);

LABEL_18:
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk diskIdentifier](v2, "diskIdentifier"));
      v30 = v29 == 0LL;

      if (v30)
      {
        v46 = sub_10000E2BC();
        v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          v75.f_bsize = 136315138;
          *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
          _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_ERROR,  "%s: No disk identifier for snapshot",  (uint8_t *)&v75,  0xCu);
        }

        goto LABEL_46;
      }

      if (v21)
      {
        v68.receiver = v2;
        v68.super_class = (Class)&OBJC_CLASS___SKAPFSSnapshotDisk;
        if ((-[SKAPFSSnapshotDisk _cacheInfoForDADisk:](&v68, "_cacheInfoForDADisk:", v21) & 1) == 0)
        {
          v52 = sub_10000E2BC();
          v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
          {
            v75.f_bsize = 136315138;
            *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: Failed to cache livefs data",  (uint8_t *)&v75,  0xCu);
          }

          goto LABEL_70;
        }

        if ((v10 & 1) != 0)
        {
          v31 = 0LL;
        }

        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mediaUUID](v2, "mediaUUID"));
          -[SKAPFSSnapshotDisk setApfsUUID:](v2, "setApfsUUID:", v54);

          v31 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v7,  "objectForKeyedSubscript:",  kDADiskDescriptionMediaUUIDKey));
          if (v31) {
            v55 = (__CFString *)CFUUIDCreateString(0LL, (CFUUIDRef)v31);
          }
          else {
            v55 = 0LL;
          }
          -[SKAPFSSnapshotDisk setMediaUUID:](v2, "setMediaUUID:", v55);
          if (v31) {

          }
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mediaUUID](v2, "mediaUUID"));
          v57 = v56 == 0LL;

          if (v57)
          {
            v64 = sub_10000E2BC();
            v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v64);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
            {
              v65 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk diskIdentifier](v2, "diskIdentifier"));
              v75.f_bsize = 136315650;
              *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
              WORD2(v75.f_blocks) = 2114;
              *(uint64_t *)((char *)&v75.f_blocks + 6) = (uint64_t)v65;
              HIWORD(v75.f_bfree) = 2080;
              v75.f_bavail = (uint64_t)"AppleAPFSSnapshot";
              _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: IOMedia for %{public}@ doesn't conform to %s. It's missing a UUID.",  (uint8_t *)&v75,  0x20u);
            }

            goto LABEL_70;
          }
        }

        if (v8)
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue([v8 path]);
          -[SKAPFSSnapshotDisk setMountPoint:](v2, "setMountPoint:", v58);

          if ((-[SKAPFSSnapshotDisk isIOSRootSnapshot](v2, "isIOSRootSnapshot") & 1) == 0)
          {
            memset(&v75.f_bavail, 0, 264);
            *(void *)&v75.f_bsize = 2LL;
            *(CFUUIDBytes *)&v75.f_blocks = CFUUIDGetUUIDBytes((CFUUIDRef)v31);
            if (fsctl( (const char *)[v8 fileSystemRepresentation], 0xC1204A43uLL, &v75, 0))
            {
              v59 = sub_10000E2BC();
              v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                v60 = objc_claimAutoreleasedReturnValue(-[SKAPFSSnapshotDisk mountPoint](v2, "mountPoint"));
                v61 = [v60 fileSystemRepresentation];
                v62 = __error();
                v63 = strerror(*v62);
                *(_DWORD *)buf = 136315650;
                v70 = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
                v71 = 2080;
                v72 = v61;
                v73 = 2080;
                v74 = v63;
                _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: Failed to fsctl(%s). %s",  buf,  0x20u);
              }

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
      v25 = [v16 isEqualToString:v24];

      if (!v25) {
        goto LABEL_29;
      }
      goto LABEL_28;
    }

    v16 = 0LL;
  }

  else
  {
    v22 = (unsigned __int16)-[SKDiskPrivateCache schemeID](self, "schemeID");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
    v16 = (void *)MKTypeToHuman(v22, v23, 0LL);

    if (v16) {
      goto LABEL_25;
    }
  }
}

LABEL_70:
              goto LABEL_46;
            }

            v66 = -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  &v75.f_files,  strnlen((const char *)&v75.f_files, 0xFFuLL),  4LL);
            -[SKAPFSSnapshotDisk setSnapshotName:](v2, "setSnapshotName:", v66);
          }
        }

        else
        {
          -[SKAPFSSnapshotDisk setMountPoint:](v2, "setMountPoint:", 0LL);
          -[SKAPFSSnapshotDisk setUsedSpace:](v2, "setUsedSpace:", 0LL);
        }

        -[SKAPFSSnapshotDisk setReserveSpace:](v2, "setReserveSpace:", 0LL);
        -[SKAPFSSnapshotDisk setQuotaSpace:](v2, "setQuotaSpace:", 0LL);
        -[SKAPFSSnapshotDisk _cacheSpacesWithPurgeable:](v2, "_cacheSpacesWithPurgeable:", 1LL);
        -[SKAPFSSnapshotDisk setRole:](v2, "setRole:", kSKDiskRoleSnapshot);
        v23 = 0;
        goto LABEL_47;
      }

      v51 = sub_10000E2BC();
      v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315138;
        *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s: Failed to create DADiskRef for snapshot's parent",  (uint8_t *)&v75,  0xCu);
      }

      goto LABEL_25;
    }

    v24 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v3);
    v25 = v24;
    if (v24)
    {
      if (IOObjectConformsTo(-[SKIOObject ioObj](v24, "ioObj"), "AppleAPFSSnapshot"))
      {
        -[SKAPFSSnapshotDisk setSealStatus:](v2, "setSealStatus:", sub_100004240(v25));
        if ((-[SKAPFSSnapshotDisk isValid](v2, "isValid") & 1) == 0)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue( -[__CFDictionary objectForKeyedSubscript:]( v7,  "objectForKeyedSubscript:",  kDADiskDescriptionMediaBSDNameKey));
          -[SKAPFSSnapshotDisk setDiskIdentifier:](v2, "setDiskIdentifier:", v26);
        }

        v27 = -[SKIOObject copyParent](v25, "copyParent");
        v28 = v27;
        if (v27)
        {
          if (IOObjectConformsTo((io_object_t)[v27 ioObj], "AppleAPFSVolume"))
          {
            v21 = DADiskCreateFromIOMedia(kCFAllocatorDefault, v5, (io_service_t)[v28 ioObj]);

            goto LABEL_18;
          }

          v48 = sub_10000E2BC();
          v49 = (os_log_s *)objc_claimAutoreleasedReturnValue(v48);
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v75.f_bsize = 136315138;
            *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
            _os_log_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_ERROR,  "%s: Snapshot IOMedia's parent is not an APFS volume",  (uint8_t *)&v75,  0xCu);
          }
        }

        goto LABEL_45;
      }

      v45 = sub_10000E2BC();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315394;
        *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        WORD2(v75.f_blocks) = 2080;
        *(uint64_t *)((char *)&v75.f_blocks + 6) = (uint64_t)"AppleAPFSSnapshot";
        v37 = "%s: IOMedia doesn't conform to %s";
        v38 = v36;
        v39 = 22;
        goto LABEL_36;
      }
    }

    else
    {
      v35 = sub_10000E2BC();
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v75.f_bsize = 136315138;
        *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
        v37 = "%s: Failed to copy IOMedia for diskRef";
        v38 = v36;
        v39 = 12;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v75, v39);
      }
    }

    goto LABEL_45;
  }

  v22 = sub_10000E2BC();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
  {
    v75.f_bsize = 136315138;
    *(void *)&v75.f_iosize = "-[SKAPFSSnapshotDisk(Daemon) _cacheInfo]";
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_ERROR,  "%s: DADiskCopyDescription failed for snapshot",  (uint8_t *)&v75,  0xCu);
  }

  v23 = 1;
LABEL_48:

  objc_sync_exit(v2);
  return v23 == 0;
}

void sub_100004D8C(_Unwind_Exception *a1)
{
}

NSDictionary *__cdecl sub_100004E18(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKAPFSSnapshotDisk+Daemon.m", 76LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

LABEL_53:
    v41 = 0LL;
    goto LABEL_54;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v4 volumeName]);
  if (v14) {
    v15 = (const __CFString *)objc_claimAutoreleasedReturnValue([v4 volumeName]);
  }
  else {
    v15 = @"untitled";
  }

  v44 = (__CFString *)v15;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  @"/private/var/mnt",  v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v16 fileExistsAtPath:v5])
  {
    v17 = 2LL;
    while ((_DWORD)v17 != 100)
    {
      v18 = sub_10000E2BC();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v50 = (uint64_t)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Mountpoint %@ already exists, trying a different mountpoint",  buf,  0xCu);
      }

      v20 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@_%d",  @"/private/var/mnt",  v44,  v17));
      v17 = (v17 + 1);
      uint64_t v5 = (void *)v20;
    }

    v36 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v36 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100044B28];

    v37 = sub_10000E2BC();
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v50 = (uint64_t)v4;
      _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_FAULT,  "Failed to find a free mountpoint for %@",  buf,  0xCu);
    }

    goto LABEL_53;
  }

  v20 = (uint64_t)v5;
LABEL_27:
  v21 = sub_10000E2BC();
  v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v4 diskIdentifier]);
    *(_DWORD *)buf = 138412546;
    v50 = (uint64_t)v23;
    v51 = 2112;
    v52 = v20;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Mounting %@ to %@", buf, 0x16u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue([v4 diskIdentifier]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"/dev/%@", v24));

  v46 = 0LL;
  v26 = (void *)objc_claimAutoreleasedReturnValue([v16 attributesOfItemAtPath:v25 error:&v46]);
  v27 = v46;
  if (v26)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue([v26 objectForKeyedSubscript:NSFileOwnerAccountID]);
    v43 = v25;
    if (sub_1000122D8(v28) && [v28 unsignedLongValue])
    {
      v29 = sub_10000E2BC();
      v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v50 = (uint64_t)v28;
        v51 = 2112;
        v52 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Setting owner %@ to mount point %@",  buf,  0x16u);
      }

      v47 = NSFileOwnerAccountID;
      v48 = v28;
      v31 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v48,  &v47,  1LL));
    }

    else
    {
      v31 = 0LL;
    }

    v45 = v27;
    v32 = [v16 createDirectoryAtPath:v20 withIntermediateDirectories:1 attributes:v31 error:&v45];
    v33 = v45;

    if ((v32 & 1) != 0)
    {
      v34 = 0;
    }

    else
    {
      v39 = sub_10000E2BC();
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v50 = v20;
        v51 = 2112;
        v52 = (uint64_t)v33;
        _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_ERROR,  "Failed creating mount point %@: %@",  buf,  0x16u);
      }

      v34 = 1;
    }

    v25 = v43;
  }

  else
  {
    v35 = sub_10000E2BC();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v50 = (uint64_t)v25;
      v51 = 2112;
      v52 = (uint64_t)v27;
      _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_ERROR,  "Failed getting attributes for device path %@: %@",  buf,  0x16u);
    }

    v34 = 1;
    v33 = v27;
  }

  if (!v34)
  {
    uint64_t v5 = (void *)v20;
    goto LABEL_51;
  }

  v41 = 0LL;
  uint64_t v5 = (void *)v20;
LABEL_54:

  return v41;
}

NSDictionary *__cdecl sub_100005FC8(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKMountOperation.m", 190LL);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  uint64_t v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

LABEL_34:
      v15 = (char *)v15 + 1;
    }

    while (v15 != v11);
    v39 = [obj countByEnumeratingWithState:&v66 objects:v102 count:16];
    v11 = v39;
  }

  while (v39);
LABEL_41:
  v54 = v12;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v40 = v57;
  v41 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v62,  v70,  16LL);
  if (v41)
  {
    v42 = v41;
    v43 = *(void *)v63;
    do
    {
      for (k = 0LL; k != v42; k = (char *)k + 1)
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(v40);
        }
        v45 = *(void *)(*((void *)&v62 + 1) + 8LL * (void)k);
        global_queue = dispatch_get_global_queue(0LL, 0LL);
        v47 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100006D88;
        block[3] = &unk_100044B50;
        block[4] = v45;
        dispatch_group_async(group, v47, block);
      }

      v42 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v40,  "countByEnumeratingWithState:objects:count:",  &v62,  v70,  16LL);
    }

    while (v42);
  }

  dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  v48 = -[SKBaseDiskArbOperation recursive](self, "recursive");
  v49 = v54;
  if (v48)
  {
    if (-[NSMutableArray count](v40, "count")) {
      v49 = 0LL;
    }
    else {
      v49 = v54;
    }
  }

  v50 = v49;

  return v50;
}

void sub_100006D88(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v2 = [v3 _recacheSyncDisk:*(void *)(a1 + 32)];
}

void sub_100006FC4(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) installedFilesystemsMapping]);
  id v3 = (void *)qword_100051B10;
  qword_100051B10 = v2;

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) extensionFilesystemsMapping]);
  [v4 count];
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8LL * (void)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v10, (void)v18));
        v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithBlock:]( &OBJC_CLASS___NSPredicate,  "predicateWithBlock:",  &stru_100044B90));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v11 filteredArrayUsingPredicate:v12]);

        if ([v13 count]
          || (v15 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100051B10 valueForKey:v10]),
              v15,
              !v15))
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v10]);
          [(id)qword_100051B10 setObject:v14 forKeyedSubscript:v10];
        }
      }

      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v7);
  }

  uint64_t v16 = objc_claimAutoreleasedReturnValue( +[SKFilesystem collectFilesystemsWithPersonalityMapping:]( &OBJC_CLASS___SKFilesystem,  "collectFilesystemsWithPersonalityMapping:",  qword_100051B10));
  v17 = (void *)qword_100051B08;
  qword_100051B08 = v16;
}

BOOL sub_1000071C4(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return -[SKFilesystem shouldShow](a2, "shouldShow", a3);
}

LABEL_28:
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  v27 = objc_claimAutoreleasedReturnValue([&off_100047A60 objectForKey:v26]);

  uint64_t v16 = (void *)v27;
LABEL_29:
  if (sub_10001232C(v16)) {
    v28 = v16;
  }
  else {
    v28 = (id)objc_claimAutoreleasedReturnValue(-[SKDiskPrivateCache rawIOContent](self, "rawIOContent"));
  }
  v9 = v28;

  return v9;
}

      uint64_t v16 = 0;
LABEL_40:

      goto LABEL_41;
    }

    id v6 = -[SKDisk isWholeDisk](self, "isWholeDisk");
    id v7 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKDisk daDisk](self, "daDisk"));
    uint64_t v8 = v7;
    v9 = v7;
    if ((v6 & 1) == 0) {
      v9 = DADiskCopyWholeDisk(v7);
    }
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    [v10 setWholeDADisk:v9];

    if ((v6 & 1) == 0) {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 wholeDADisk]);

    if (v12)
    {
      v13 = -[SKIOMedia initWithDADisk:](objc_alloc(&OBJC_CLASS___SKIOMedia), "initWithDADisk:", v4);
      if (v13)
      {
        v14 = (os_log_s *)v13;
        if (!-[SKDisk _cacheInfoWithIOMedia:](self, "_cacheInfoWithIOMedia:", v13)) {
          goto LABEL_28;
        }
        goto LABEL_16;
      }

      v23 = sub_10000E2BC();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        v34 = 136315394;
        v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        v36 = 2114;
        v37 = v21;
        v22 = "%s: Failed to find IO media of %{public}@";
        goto LABEL_26;
      }
    }

    else
    {
      __int128 v19 = sub_10000E2BC();
      __int128 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __int128 v21 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk diskIdentifier](self, "diskIdentifier"));
        v34 = 136315394;
        v35 = "-[SKDisk(DaemonAdditions) _cacheInfoForDADisk:]";
        v36 = 2114;
        v37 = v21;
        v22 = "%s: Failed to find whole disk for %{public}@";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v22, (uint8_t *)&v34, 0x16u);
      }
    }

    v14 = 0LL;
    goto LABEL_28;
  }

  uint64_t v16 = 0;
LABEL_41:

  return v16;
}

    v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    v70 = v30;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v70, 1LL));
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v55,  0LL));
    __int128 v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v56, a2));

LABEL_34:
    goto LABEL_35;
  }

  __int128 v21 = sub_10000E2BC();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke_3";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to sync disk from Daemon", buf, 0xCu);
  }

  __int128 v20 = 0LL;
LABEL_35:

  return v20;
}

void sub_100007918(_Unwind_Exception *a1)
{
}

_UNKNOWN **sub_1000086C4(void *a1, _BYTE *a2)
{
  id v3 = a1;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Base"]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKeyedSubscript:@"Partition ID"]);

  int v6 = sub_1000122D8(v4);
  if (v6) {
    int v6 = sub_1000122D8(v5);
  }
  if (a2) {
    *a2 = v6;
  }
  if (v6) {
    id v7 = (_UNKNOWN **)v4;
  }
  else {
    id v7 = &off_100047C20;
  }
  uint64_t v8 = v7;

  return v8;
}

LABEL_5:
  if (!sub_10001232C(v4)
    || (v9 = objc_claimAutoreleasedReturnValue(-[SKDisk filesystemWithType:](self, "filesystemWithType:", v4))) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
    v12 = sub_10001232C(v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v14 = [v13 isEqualToString:@"EFI"];

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
      uint64_t v16 = v15;
      if (v14)
      {
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 _filesystemForDMFilesystemType:@"MS-DOS FAT32" isEncrypted:0]);
        v17 = v16;
LABEL_15:

        goto LABEL_16;
      }

      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v17 = (id)objc_claimAutoreleasedReturnValue([v16 _filesystemForIOContent:v20]);

      if (v17)
      {
        v17 = v17;
        uint64_t v10 = v17;
        goto LABEL_15;
      }

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk ioContent](self, "ioContent"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
      v28 = (void *)objc_claimAutoreleasedReturnValue([v27 rawIOContent]);
      v29 = [v26 isEqual:v28];

      if ((v29 & 1) == 0)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk privateCache](self, "privateCache"));
        v32 = (void *)objc_claimAutoreleasedReturnValue([v31 rawIOContent]);
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v30 _filesystemForIOContent:v32]);

        if (!v10) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
    }

LABEL_12:
    uint64_t v10 = 0LL;
    goto LABEL_16;
  }

  uint64_t v10 = (void *)v9;
LABEL_16:

  return v10;
}

void sub_10000985C(_Unwind_Exception *a1)
{
}

int64_t sub_100009ECC(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a2 objectAtIndexedSubscript:1]);
  int v6 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:1]);

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_10000A220(_Unwind_Exception *a1)
{
}

void sub_10000A390(_Unwind_Exception *a1)
{
}
}

id sub_10000B238(uint64_t a1, uint64_t a2)
{
  id v4 = objc_alloc(&OBJC_CLASS___SKPartitionTable);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  int v6 = -[SKPartitionTable initWithDisk:error:](v4, "initWithDisk:error:", v5, a2);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_10000B494;
    v22[3] = &unk_100044C18;
    uint64_t v8 = v6;
    v23 = (os_log_s *)v8;
    [v7 enumerateObjectsUsingBlock:v22];

    v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v21 = 0LL;
    unsigned __int8 v10 = [v9 cleanupWithError:&v21];
    id v11 = v21;

    if ((v10 & 1) == 0 && v11)
    {
      id v12 = sub_10000E2BC();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
        *(_DWORD *)buf = 138412546;
        v25 = v14;
        __int16 v26 = 2112;
        id v27 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
      }
    }

    unsigned int v15 = -[SKPartitionTable writePartitionScheme:error:](v8, "writePartitionScheme:error:", 0LL, a2);
    id v16 = 0LL;
    if (v15) {
      id v16 = *(id *)(a1 + 40);
    }

    v17 = v23;
  }

  else
  {
    id v18 = sub_10000E2BC();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      *(_DWORD *)buf = 136315394;
      v25 = "-[SKEraseDisk(Daemon) createStateMachineWithError:]_block_invoke";
      __int16 v26 = 2112;
      id v27 = v19;
      _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "%s: Failed to create partition table for %@",  buf,  0x16u);
    }

    id v16 = 0LL;
  }

  return v16;
}

void sub_10000B494(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 partitions]);
  id v4 = [v3 newPartition];

  [v5 addObject:v4];
}

id sub_10000B4F4(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 children]);

  if (v5 && [v5 count])
  {
    uint64_t v27 = a2;
    id v7 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v6);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
    id v9 = [v8 count];

    if (v9)
    {
      unint64_t v11 = 0LL;
      while (1)
      {
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472LL;
        v28[2] = sub_10000B83C;
        v28[3] = &unk_100044C60;
        int v29 = v11;
        id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](&OBJC_CLASS___NSPredicate, "predicateWithBlock:", v28, v27));
        v13 = (void *)objc_claimAutoreleasedReturnValue([v5 filteredArrayUsingPredicate:v12]);

        if ([v13 count] != (id)1) {
          break;
        }
        v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v11]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 innerDescriptor]);

        v17 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:0]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 toVolumeWithDisk:v17]);

        [v7 addObject:v18];
        ++v11;
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
        id v20 = [v19 count];
      }

      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  300LL,  v13,  0LL));
      id v23 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v26, v27));
    }

    else
    {
LABEL_7:
      v13 = (void *)objc_opt_new(&OBJC_CLASS___SKFilesystemCreator, v10);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v13 progress]);
      objc_msgSend( v21,  "chainChildProgress:withPendingUnitCount:",  v22,  (uint64_t)((double)(0x64 / (unint64_t)objc_msgSend(v5, "count")) * 0.5));

      else {
        id v23 = 0LL;
      }
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    v30 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  300LL,  v13,  0LL));
    id v23 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v24, a2));
  }

  return v23;
}

BOOL sub_10000B83C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKPartitionTable partitionIDFromDisk:](&OBJC_CLASS___SKPartitionTable, "partitionIDFromDisk:", a2));
  BOOL v4 = [v3 unsignedLongValue] == (id)(*(int *)(a1 + 32) + 1);

  return v4;
}

id sub_10000B88C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 children]);

  if (v5
    && [v5 count]
    && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]),
        id v7 = [v6 count],
        id v8 = [v5 count],
        v6,
        v7 == v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
    id v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0LL;
      do
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v11]);
        v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectAtIndexedSubscript:v11]);
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 filesystem]);
        +[SKEraseVolume reProbeWithDisk:isEncrypted:]( SKEraseVolume,  "reProbeWithDisk:isEncrypted:",  v12,  [v15 isEncrypted]);

        ++v11;
        id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
        id v17 = [v16 count];
      }

      while ((unint64_t)v17 > v11);
    }

    id v18 = *(id *)(a1 + 40);
  }

  else
  {
    __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v23 = v19;
    id v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v23, 1LL));
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  105LL,  v20,  0LL));
    id v18 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v21, a2));
  }

  return v18;
}

id sub_10000BAA8(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 children]);

  if (v5
    && [v5 count]
    && (uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]),
        id v7 = [v6 count],
        id v8 = [v5 count],
        v6,
        v7 == v8))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
    id v10 = [v9 count];

    if (v10)
    {
      unint64_t v12 = 0LL;
      uint64_t v37 = kSKDiskMountOptionRecursive;
      uint64_t v13 = kSKDiskUnmountOptionForce;
      *(void *)&__int128 v11 = 138412546LL;
      __int128 v36 = v11;
      do
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "descriptors", v36));
        unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectAtIndexedSubscript:v12]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 innerDescriptor]);

        id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 filesystem]);
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 majorType]);
        unsigned __int8 v19 = [v18 isEqualToString:@"apfs"];

        if ((v19 & 1) == 0)
        {
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:v12]);
          v43[0] = v37;
          v43[1] = v13;
          v44[0] = &__kCFBooleanTrue;
          v44[1] = &__kCFBooleanTrue;
          id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v44,  v43,  2LL));
          id v38 = 0LL;
          unsigned __int8 v22 = +[SKUnmountOperation unmountWithDisk:options:error:]( &OBJC_CLASS___SKUnmountOperation,  "unmountWithDisk:options:error:",  v20,  v21,  &v38);
          id v23 = v38;

          if ((v22 & 1) == 0 && v23)
          {
            id v24 = sub_10000E2BC();
            v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              __int16 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
              uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 children]);
              v28 = (void *)objc_claimAutoreleasedReturnValue([v27 objectAtIndexedSubscript:v12]);
              *(_DWORD *)buf = v36;
              v40 = v28;
              __int16 v41 = 2112;
              id v42 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_ERROR,  "Failed to unmount after reprobe %@, %@",  buf,  0x16u);
            }
          }
        }

        ++v12;
        int v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptors]);
        id v30 = [v29 count];
      }

      while ((unint64_t)v30 > v12);
    }

    id v31 = *(id *)(a1 + 40);
  }

  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    v45 = v32;
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v45, 1LL));
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  105LL,  v33,  0LL));
    id v31 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v34, a2));
  }

  return v31;
}

SKStateTransitionEntry *sub_10000C9EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:action:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:action:nextState:",  a1,  a2,  a3,  a4);
}

SKStateTransitionEntry *sub_10000CA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:nextState:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:nextState:",  a1,  a2,  a3,  a4);
}

id sub_10000CA24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SKStateTransitionEntry entryWithState:event:selector:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:selector:",  a1,  a2,  a3);
}

id sub_10000CA3C(uint64_t a1, uint64_t a2)
{
  return +[SKStateTransitionEntry entryWithState:event:]( &OBJC_CLASS___SKStateTransitionEntry,  "entryWithState:event:",  a1,  a2);
}

void sub_10000CA94(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"\n" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_100051B18;
  qword_100051B18 = v1;
}

void sub_10000CDF0(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"<plist" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_100051B28;
  qword_100051B28 = v1;
}

void sub_10000CE60(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue([@"</plist>" dataUsingEncoding:4]);
  uint64_t v2 = (void *)qword_100051B38;
  qword_100051B38 = v1;
}

void sub_10000DA6C(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  [v4 launch];
}

BOOL sub_10000DA9C(id a1, SKTask *a2, NSDictionary *a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_10000DAD4(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v12 = a2;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readDataUpToLength:4096 error:0]);
    [v5 parseData:v7];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 readDataUpToLength:4096 error:0]);
    [v9 parseData:v11];
  }
}

BOOL sub_10000DBCC(id a1, SKTask *a2, NSDictionary *a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3));
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_10000DC04(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[SKTask task](a2, "task", a3, a4));
  [v4 waitUntilExit];
}

void sub_10000DC34(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v12 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutParser](v12, "stdoutParser"));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stdoutHandle](v12, "stdoutHandle"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 readDataToEndOfFile]);
    [v5 parseData:v7];
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrParser](v12, "stderrParser"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SKTask stderrHandle](v12, "stderrHandle"));
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 readDataToEndOfFile]);
    [v9 parseData:v11];
  }
}

BOOL sub_10000DD1C(id a1, SKTask *a2, NSDictionary *a3)
{
  return !-[SKTask endedSuccessfully](a2, "endedSuccessfully", a3);
}

id sub_10000E244(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%s:%d", a1, a2));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 dataUsingEncoding:4]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 base64EncodedStringWithOptions:0]);

  return v4;
}

id sub_10000E2BC()
{
  if (qword_100051B48 != -1) {
    dispatch_once(&qword_100051B48, &stru_100044E20);
  }
  if (byte_100051B50) {
    v0 = (id *)&off_100051888;
  }
  else {
    v0 = (id *)&off_100051880;
  }
  return *v0;
}

void sub_10000E318(id a1)
{
  os_log_t v1 = os_log_create("com.apple.storagekit", "general");
  uint64_t v2 = off_100051880;
  off_100051880 = v1;

  os_log_t v3 = os_log_create("com.apple.storagekit", "storagekit-install");
  id v4 = off_100051888;
  off_100051888 = v3;
}

void SKLogSetLogsToConsole()
{
  id v0 = sub_10000E2BC();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToConsole/Std is deprecated. Please remove this call",  v2,  2u);
  }
}

void SKLogSetLogsToStd()
{
  id v0 = sub_10000E2BC();
  os_log_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "SKLogSetLogsToStd is deprecated. Please remove this call",  v2,  2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  byte_100051B50 = result;
  return result;
}

void sub_10000E448(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = sub_10000E2BC();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v22 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, a1, "%s", buf, 0xCu);
  }

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)i);
        id v14 = sub_10000E2BC();
        unsigned int v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v22 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, a1, "%@", buf, 0xCu);
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v10);
  }
}

void sub_10000E86C(_Unwind_Exception *a1)
{
}

BOOL sub_10000EEF8(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([a2 valueForEntitlement:a1]);
  BOOL v4 = 0;
  if (v2)
  {
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
  }

  return v4;
}

void sub_10000F190(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = sub_10000E2BC();
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Progress handler failed:%@",  (uint8_t *)&v5,  0xCu);
  }
}

LABEL_16:
    uint64_t v22 = 0;
    goto LABEL_17;
  }

  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_10000F4D0;
  v24[3] = &unk_100044E88;
  __int16 v26 = a6;
  v25 = (os_log_s *)v11;
  [v21 logEvent:@"com.apple.StorageKit.storagekitd.usage" eventPayloadBuilder:v24];

  uint64_t v22 = 1;
  unsigned int v15 = v25;
LABEL_17:

  return v22;
}

  objc_sync_exit(v4);

  return (char)v8;
}

      id v21 = sub_10000E2BC();
      uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKAPFSDisk apfsVolumeGroupUUID](self, "apfsVolumeGroupUUID"));
        buf = 136315394;
        uint64_t v37 = "-[SKAPFSDisk(Daemon) getDataVolumeBSD]";
        id v38 = 2114;
        v39 = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Failed to find data volume in APFS group %{public}@",  (uint8_t *)&buf,  0x16u);
      }

      uint64_t v13 = 0LL;
LABEL_24:
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  return v13;
}

id sub_10000F4D0(uint64_t a1)
{
  v16[0] = @"api";
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  *(void *)(a1 + 40),  4LL));
  v17[0] = v2;
  v16[1] = @"diskType";
  id v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) type]);
  v17[1] = v3;
  v16[2] = @"isDiskImage";
  else {
    BOOL v4 = &__kCFBooleanFalse;
  }
  v17[2] = v4;
  v16[3] = @"isWritable";
  else {
    int v5 = &__kCFBooleanFalse;
  }
  v17[3] = v5;
  v16[4] = @"isLocked";
  else {
    id v6 = &__kCFBooleanFalse;
  }
  v17[4] = v6;
  v16[5] = @"isExternal";
  else {
    id v7 = &__kCFBooleanFalse;
  }
  v17[5] = v7;
  v16[6] = @"isInternalDisk";
  else {
    id v8 = &__kCFBooleanFalse;
  }
  v17[6] = v8;
  v16[7] = @"isJournaled";
  else {
    id v9 = &__kCFBooleanFalse;
  }
  v17[7] = v9;
  v16[8] = @"isWholeDisk";
  else {
    id v10 = &__kCFBooleanFalse;
  }
  v17[8] = v10;
  v16[9] = @"isOSInternal";
  else {
    uint64_t v11 = &__kCFBooleanFalse;
  }
  v17[9] = v11;
  v16[10] = @"isPhysicalDisk";
  else {
    unint64_t v12 = &__kCFBooleanFalse;
  }
  v17[10] = v12;
  v16[11] = @"role";
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) role]);
  v17[11] = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v17,  v16,  12LL));

  return v14;
}

id sub_10000FED8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&off_100047C08];
}

void sub_100010068( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

void sub_100010088(void *a1, int a2)
{
  uint64_t v2 = a1[5];
  id v3 = *(void **)(a1[4] + 8LL);
  if (a2) {
    BOOL v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8LL) + 24LL) != 0;
  }
  else {
    BOOL v4 = 0LL;
  }
  int v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", v4));
  id v7 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v6];
}

void sub_100010294(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a2 minimalDictionaryRepresentation]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_safe_object:", v4));

  id v7 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v6];
}

void sub_1000104CC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([a2 minimalDictionaryRepresentation]);
  int v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_safe_object:", v4));

  id v7 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));
  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v6];
}

void sub_100010704(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v15 + 1) + 8 * (void)v9),  "minimalDictionaryRepresentation",  (void)v15));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }

    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void **)(v11 + 8);
  __int128 v19 = v4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v19, 1LL));
  [v13 requestWithUUID:v12 didCompleteWithResult:v14];
}

void sub_1000109A4(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a2));
  id v5 = v3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v5, 1LL));

  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v4];
}

id sub_100010BD8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&__NSArray0__struct];
}

void sub_100010D18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_100010F3C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)v9),  "minimalDictionaryRepresentation",  (void)v16));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v7);
  }

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (void *)v11[1];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_safe_object:", v4));
  id v20 = v14;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  [v13 requestWithUUID:v12 didCompleteWithResult:v15];
}

void sub_100011240(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v3 count]));
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( *(id *)(*((void *)&v16 + 1) + 8 * (void)v9),  "minimalDictionaryRepresentation",  (void)v16));
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }

    while (v7);
  }

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (void *)v11[1];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "_safe_object:", v4));
  id v20 = v14;
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v20, 1LL));
  [v13 requestWithUUID:v12 didCompleteWithResult:v15];
}

NSArray *__cdecl sub_1000114BC(id a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
  BOOL v4 = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));

  return (NSArray *)v2;
}

void sub_10001154C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

NSArray *__cdecl sub_1000116E8(id a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
  BOOL v4 = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));

  return (NSArray *)v2;
}

void sub_100011778(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_1000119FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

NSArray *__cdecl sub_100011B7C(id a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKError errorWithCode:userInfo:](&OBJC_CLASS___SKError, "errorWithCode:userInfo:", 112LL, 0LL));
  BOOL v4 = v1;
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v4, 1LL));

  return (NSArray *)v2;
}

void sub_100011C0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8LL);
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", a2));
  id v6 = v4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_100011ED4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (!a2 || v5)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v13[0] = v9;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_safe_object:", v6));
    v13[1] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
  }

  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([a2 minimalDictionaryRepresentation]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_safe_object:", v9));
    v14[0] = v10;
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
    v14[1] = v11;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v14, 2LL));
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v12);
  }
}

uint64_t sub_100012144(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_100012214(void *a1, const void *a2)
{
  queue = a1;
  id v3 = calloc(8uLL, 1uLL);
  *id v3 = 1LL;
  dispatch_queue_set_specific(queue, a2, v3, (dispatch_function_t)&_free);
}

void *sub_100012270()
{
  if (qword_100051B58 != -1) {
    dispatch_once(&qword_100051B58, &stru_100045068);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0LL);
  }
  return result;
}

void sub_1000122C4(id a1)
{
}

uint64_t sub_1000122D8(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

BOOL sub_10001232C(void *a1)
{
  id v1 = a1;
  BOOL v3 = v1
    && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)
    && [v1 length] != 0;

  return v3;
}

uint64_t sub_10001238C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t sub_1000123E0(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

uint64_t sub_100012434(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

id sub_100012488(void *a1)
{
  id v1 = a1;
  else {
    id v2 = 0LL;
  }

  return v2;
}

id sub_1000124CC(void *a1)
{
  id v1 = a1;
  else {
    id v2 = 0LL;
  }

  return v2;
}

__CFString *sub_100012510(void *a1)
{
  id v1 = a1;
  if (sub_10001232C(v1)) {
    id v2 = v1;
  }
  else {
    id v2 = &stru_100046600;
  }
  BOOL v3 = v2;

  return v3;
}

BOOL sub_100012554(void *a1)
{
  id v1 = a1;
  if (sub_10001232C(v1))
  {
    id v2 = -[NSUUID initWithUUIDString:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDString:", v1);
    BOOL v3 = v2 != 0LL;
  }

  else
  {
    BOOL v3 = 0LL;
  }

  return v3;
}

uint64_t sub_1000125AC(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSString);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t sub_100012600(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSArray);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t sub_100012654(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t sub_1000126A8(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSData);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t sub_1000126FC(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber);
    char isKindOfClass = objc_opt_isKindOfClass(v1, v2);
  }

  else
  {
    char isKindOfClass = 1;
  }

  return isKindOfClass & 1;
}

uint64_t sub_100012750(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return (uint64_t)[(id)a1 isEqual:a2];
  }
  else {
    return 1LL;
  }
}

void sub_100012FC4(_Unwind_Exception *a1)
{
}

void sub_100012FF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = &APFSCancelContainerResize_ptr;
    uint64_t v8 = &kSKDiskFileSystemAPFS;
    do
    {
      id v9 = 0LL;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = [objc_alloc((Class)v7[126]) initWithDictionaryRepresentation:*(void *)(*((void *)&v24 + 1) + 8 * (void)v9)];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 type]);
        if ([v11 isEqualToString:*v8]
          && (unsigned int v12 = [v10 isEncrypted],
              v12 == [*(id *)(a1 + 32) isEncrypted]))
        {
          unsigned int v23 = [v10 isCaseSensitive];
          unsigned int v13 = [*(id *)(a1 + 32) isCaseSensitive];
          id v14 = v5;
          uint64_t v15 = v6;
          uint64_t v16 = a1;
          __int128 v17 = v8;
          __int128 v18 = v7;
          id v19 = v3;
          unsigned int v20 = v13;

          BOOL v21 = v23 == v20;
          id v3 = v19;
          uint64_t v7 = v18;
          uint64_t v8 = v17;
          a1 = v16;
          uint64_t v6 = v15;
          id v5 = v14;
          if (v21) {
            [*(id *)(a1 + 32) setFilesystem:v10];
          }
        }

        else
        {
        }

        id v9 = (char *)v9 + 1;
      }

      while (v5 != v9);
      id v22 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v5 = v22;
    }

    while (v22);
  }
}

void sub_1000136D4(_Unwind_Exception *a1)
{
}

LABEL_14:
}

    objc_sync_exit(v5);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

    objc_sync_exit(v5);
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  return v7;
}

void sub_100014334(_Unwind_Exception *a1)
{
}

void sub_100014424(_Unwind_Exception *a1)
{
}

void sub_100014468(id a1)
{
  unsigned int v5 = 0;
  size_t v4 = 4LL;
  sysctlbyname("hw.logicalcpu", &v5, &v4, 0LL, 0LL);
  id v1 = sub_10000E2BC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "# CPUs: %u", buf, 8u);
  }

  int v3 = v5;
  if (v5 <= 1) {
    int v3 = 1;
  }
  dword_100051B68 = v3;
}

void sub_100014584(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SKDaemon);
  uint64_t v2 = (void *)qword_100051B78;
  qword_100051B78 = (uint64_t)v1;
}

void sub_100014610(id a1)
{
  id v1 = sub_10000E2BC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "SIGTERM received", v4, 2u);
  }

  int v3 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  [v3 _scheduleGenericOperationWithCompletionBlock:&stru_100045110];
}

void sub_100014698(id a1)
{
  id v1 = sub_10000E2BC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "SIGTERM handling complete, quitting now",  v3,  2u);
  }

  exit(0);
}

id sub_100014B64(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleWithMatchingEvent:a2];
}

void sub_100014D80(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___SKDaemonConnection);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
  {
    size_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    [v4 removeListener:*(void *)(a1 + 32)];
  }

  objc_msgSend( *(id *)(a1 + 40),  "setNumConnectedClients:",  objc_msgSend(*(id *)(a1 + 40), "numConnectedClients") - 1);
  id v5 = sub_10000E2BC();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    unsigned int v8 = [*(id *)(a1 + 40) numConnectedClients];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 1024;
    unsigned int v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%@ removed. There are now %u client(s) connected to storagetkid",  (uint8_t *)&v9,  0x12u);
  }
}

id sub_1000153BC(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a2 diskIdentifier]);
  size_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskIdentifier]);
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_1000158F0(_Unwind_Exception *a1)
{
}

id sub_100016378(uint64_t a1, uint64_t a2)
{
  size_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 disk]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v4 syncDiskFromDaemon:v5 error:a2]);
  [*(id *)(a1 + 32) setDisk:v6];

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  if (v7)
  {
    unsigned int v8 = (void *)objc_opt_class(*(void *)(a1 + 32));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 filesystem]);
    objc_msgSend(v8, "reProbeWithDisk:isEncrypted:", v9, objc_msgSend(v11, "isEncrypted"));

    return *(id *)(a1 + 40);
  }

  else
  {
    id v13 = sub_10000E2BC();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "%s: Failed to sync disk from Daemon",  (uint8_t *)&v15,  0xCu);
    }

    return 0LL;
  }

id sub_1000164F4(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  v17[0] = kSKDiskMountOptionRecursive;
  v17[1] = kSKDiskUnmountOptionForce;
  v18[0] = &__kCFBooleanTrue;
  v18[1] = &__kCFBooleanTrue;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  id v12 = 0LL;
  unsigned __int8 v4 = +[SKUnmountOperation unmountWithDisk:options:error:]( &OBJC_CLASS___SKUnmountOperation,  "unmountWithDisk:options:error:",  v2,  v3,  &v12);
  id v5 = v12;

  if ((v4 & 1) == 0 && v5)
  {
    id v6 = sub_10000E2BC();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "Failed to unmount after repbore %@, %@",  buf,  0x16u);
    }
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
  [v9 setCompletedUnitCount:100];

  id v10 = *(id *)(a1 + 40);
  return v10;
}

id sub_10001668C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  id v24 = 0LL;
  unsigned __int8 v5 = [v4 cleanupWithError:&v24];
  id v6 = v24;

  if ((v5 & 1) == 0 && v6)
  {
    id v7 = sub_10000E2BC();
    unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      *(_DWORD *)buf = 138412546;
      v28 = v9;
      __int16 v29 = 2112;
      id v30 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
    }
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
  char isKindOfClass = objc_opt_isKindOfClass(v10, v11);

  if ((isKindOfClass & 1) != 0)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 container]);

    if (!v14)
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      __int128 v26 = v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v19,  0LL));
      id v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v20, a2));

      goto LABEL_13;
    }

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 designatedPhysicalStore]);
    if (!v15)
    {
      __int128 v25 = v14;
      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
      id v22 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  117LL,  v21,  0LL));
      id v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v22, a2));

      goto LABEL_13;
    }

    id v16 = (void *)v15;
    [*(id *)(a1 + 32) setDisk:v15];
  }

  id v17 = *(id *)(a1 + 40);
LABEL_13:

  return v17;
}

id sub_100016914(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unsigned __int8 v4 = (void *)objc_opt_new(&OBJC_CLASS___SKFilesystemCreator, a2);
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 progress]);
  [v5 chainChildProgress:v6 withPendingUnitCount:50];

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 toVolumeWithDisk:v8]);
  id v13 = v9;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v13, 1LL));
  LODWORD(v2) = [v4 createWithVolumes:v10 error:v2];

  if ((_DWORD)v2) {
    id v11 = *(id *)(a1 + 40);
  }
  else {
    id v11 = 0LL;
  }

  return v11;
}

id sub_100016A60(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  unsigned int v5 = [v4 isWholeDisk];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    unsigned int v7 = [v6 wipeDiskWithError:a2];

    if (v7) {
      return *(id *)(a1 + 40);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    int v9 = objc_alloc(&OBJC_CLASS___SKPartitionTable);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v11 = -[SKPartitionTable initWithDisk:error:](v9, "initWithDisk:error:", v10, a2);

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[SKPartitionTable partitionIDFromDisk:]( &OBJC_CLASS___SKPartitionTable,  "partitionIDFromDisk:",  v12));

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 filesystem]);
      unsigned int v16 = -[SKPartitionTable overwritePartitionAt:filesystem:error:]( v11,  "overwritePartitionAt:filesystem:error:",  v13,  v15,  a2);

      if (v16) {
        id v17 = *(id *)(a1 + 40);
      }
      else {
        id v17 = 0LL;
      }
    }

    else
    {
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      BOOL v21 = v18;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( +[SKError errorWithCode:disks:userInfo:]( &OBJC_CLASS___SKError,  "errorWithCode:disks:userInfo:",  300LL,  v19,  0LL));
      id v17 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithError:error:](&OBJC_CLASS___SKError, "nilWithError:error:", v20, a2));
    }

    return v17;
  }

id sub_100016C6C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = *(void **)(a1 + 32);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue([v4 disk]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 syncDiskFromDaemon:v5 error:a2]);
  [*(id *)(a1 + 32) setDisk:v6];

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
  if (v7)
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    id v67 = 0LL;
    unsigned __int8 v9 = [v8 cleanupWithError:&v67];
    id v10 = (os_log_s *)v67;

    if ((v9 & 1) == 0 && v10)
    {
      id v11 = sub_10000E2BC();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
        *(_DWORD *)buf = 138412546;
        v72 = v13;
        __int16 v73 = 2112;
        v74 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
      }
    }

    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 container]);
      unsigned int v18 = [v17 isLiveFSAPFSDisk];

      if (v18)
      {
        uint64_t v19 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
        id v20 = (id)objc_claimAutoreleasedReturnValue(v19);
        goto LABEL_35;
      }
    }

    else
    {
    }

    id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", 0LL));
    unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
    char isKindOfClass = objc_opt_isKindOfClass(v23, v24);

    __int128 v26 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
    __int128 v27 = v26;
    if ((isKindOfClass & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue([v26 diskIdentifier]);
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue([v28 substringFromIndex:4]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 componentsSeparatedByString:@"s"]);

      if ((unint64_t)[v30 count] <= 1)
      {
        id v57 = sub_10000E2BC();
        v58 = (os_log_s *)objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
          v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 diskIdentifier]);
          *(_DWORD *)buf = 136315394;
          v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          __int16 v73 = 2114;
          v74 = v60;
          _os_log_impl( (void *)&_mh_execute_header,  v58,  OS_LOG_TYPE_ERROR,  "%s: Invalid BSD name for APFS volume: %{public}@",  buf,  0x16u);
        }

        id v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithPOSIXCode:error:](&OBJC_CLASS___SKError, "nilWithPOSIXCode:error:", 22LL, a2));
        goto LABEL_34;
      }

      id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 objectAtIndexedSubscript:1]);
      uint64_t v32 = objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  (char *)[v31 integerValue] - 1));

      v33 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      uint64_t v34 = objc_claimAutoreleasedReturnValue([v33 container]);

      v35 = v30;
      id v30 = (void *)v34;
      id v22 = (void *)v32;
    }

    else
    {
      uint64_t v36 = objc_opt_class(&OBJC_CLASS___SKAPFSStoreDisk);
      char v37 = objc_opt_isKindOfClass(v27, v36);

      if ((v37 & 1) == 0) {
        goto LABEL_28;
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v35 container]);
    }

    if (v30)
    {
      v68[0] = kAPFSVolumeNameKey;
      id v38 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
      v39 = (void *)objc_claimAutoreleasedReturnValue([v38 name]);
      v69[0] = v39;
      v69[1] = v22;
      v66 = v22;
      v68[1] = kAPFSVolumeFSIndexKey;
      v68[2] = kAPFSVolumeCaseSensitiveKey;
      v40 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
      __int16 v41 = (void *)objc_claimAutoreleasedReturnValue([v40 filesystem]);
      unsigned int v42 = [v41 isCaseSensitive];
      v43 = &__kCFBooleanFalse;
      if (v42) {
        v43 = &__kCFBooleanTrue;
      }
      v68[3] = kAPFSVolumeCreateSynchronousKey;
      v69[2] = v43;
      v69[3] = &__kCFBooleanTrue;
      v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  4LL));
      v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v44));

      v46 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v46 password]);

      if (v47)
      {
        v48 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) descriptor]);
        v49 = (void *)objc_claimAutoreleasedReturnValue([v48 password]);
        [v45 setObject:v49 forKeyedSubscript:kAPFSVolumeEncryptedKey];
      }

      id v50 = objc_claimAutoreleasedReturnValue([v30 diskIdentifier]);
      uint64_t v51 = APFSVolumeCreate([v50 UTF8String], v45);

      if ((_DWORD)v51)
      {
        id v52 = sub_10000E2BC();
        v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
        id v22 = v66;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          v54 = (os_log_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) disk]);
          *(_DWORD *)buf = 136315394;
          v72 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          __int16 v73 = 2112;
          v74 = v54;
          _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_ERROR,  "%s: Failed to create volume %@",  buf,  0x16u);
        }

        id v20 = (id)objc_claimAutoreleasedReturnValue(+[SKError nilWithOSStatus:error:](&OBJC_CLASS___SKError, "nilWithOSStatus:error:", v51, a2));
      }

      else
      {
        v61 = objc_alloc(&OBJC_CLASS___SKIOMedia);
        v62 = (void *)objc_claimAutoreleasedReturnValue([v30 diskIdentifier]);
        v63 = -[SKIOMedia initWithDevName:](v61, "initWithDevName:", v62);

        -[SKIOObject waitIOKitQuiet](v63, "waitIOKitQuiet");
        v64 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) progress]);
        [v64 setCompletedUnitCount:100];

        id v20 = *(id *)(a1 + 40);
        id v22 = v66;
      }

      goto LABEL_34;
    }

NSDictionary *__cdecl sub_1000184F4(id a1)
{
  unsigned int v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKBaseDiskArbOperation.m", 118LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

id sub_1000196D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = sub_10000E2BC();
  unsigned int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "void _diskArbOperationCallback(DADiskRef, DADissenterRef, void *)";
    __int16 v11 = 2112;
    uint64_t v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: diskRef = %@", (uint8_t *)&v9, 0x16u);
  }

  return [a3 diskArbCallbackWithDissenter:a2];
}

void sub_100019A40( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, char a17)
{
}

uint64_t sub_100019A70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100019A80(uint64_t a1)
{
}

void sub_100019A88(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[10] finished])
    {
      uint64_t v4 = objc_claimAutoreleasedReturnValue([v3[9] disk]);
      id v5 = v3[7];
      v3[7] = (id)v4;

LABEL_10:
      [v3 finished];
      goto LABEL_11;
    }

    id v9 = v3[10];
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id obj = *(id *)(v10 + 40);
    unsigned __int8 v11 = [v9 nextWithError:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    if ((v11 & 1) == 0)
    {
      objc_storeStrong(v3 + 6, *(id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL));
      goto LABEL_10;
    }

    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
    id v12 = objc_loadWeakRetained(v3 + 12);
    [v8 syncAllDisksWithCompletionBlock:v12];
  }

  else
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager"));
    [v6 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100045278];

    id v7 = sub_10000E2BC();
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SKEraseOperation run]_block_invoke";
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v8,  OS_LOG_TYPE_FAULT,  "%s: Failed to get strongref from weakself",  buf,  0xCu);
    }
  }

LABEL_11:
}

NSDictionary *__cdecl sub_100019C4C(id a1)
{
  id v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKEraseOperation.m", 95LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

uint64_t start()
{
  id v0 = objc_autoreleasePoolPush();
  id v1 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemon sharedDaemon](&OBJC_CLASS___SKDaemon, "sharedDaemon"));
  [v1 startServer];

  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  [v2 run];

  objc_autoreleasePoolPop(v0);
  return 0LL;
}

void sub_10001AEA0(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v2 = [v3 _recacheSyncDisk:*(void *)(a1 + 32)];
}

void sub_10001AFDC(id a1)
{
  if (sub_100012270())
  {
    id v1 = objc_alloc_init(&OBJC_CLASS___SKDaemonManager);
    id v2 = (void *)qword_100051B80;
    qword_100051B80 = (uint64_t)v1;
  }

  else
  {
    dispatch_sync(&_dispatch_main_q, &stru_1000452E0);
  }

void sub_10001B024(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___SKDaemonManager);
  id v2 = (void *)qword_100051B80;
  qword_100051B80 = (uint64_t)v1;
}

void sub_10001B8D0(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10001B974;
  v6[3] = &unk_100045308;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_semaphore_t v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 dispatchToWorkThread:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

uint64_t sub_10001B974(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_10001BA34(uint64_t a1, void *a2)
{
  id v4 = sub_10000E2BC();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "void DiskDisappearedCallback(DADiskRef, void *)";
    __int16 v9 = 2112;
    uint64_t v10 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Received DA disappear notification for %@",  (uint8_t *)&v7,  0x16u);
  }

  return [a2 _handleDANotificationWithDisk:a1 operation:off_100051AD8];
}

id sub_10001BB0C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = sub_10000E2BC();
  int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    uint64_t v10 = "void DiskDescriptionChangedCallback(DADiskRef, CFArrayRef, void *)";
    __int16 v11 = 2112;
    uint64_t v12 = a1;
    __int16 v13 = 2114;
    uint64_t v14 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: Received DA changed notification for %@. Changed keys: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  return [a3 _handleDANotificationWithDisk:a1 operation:off_100051AD0];
}

id sub_10001BBF4(void *a1)
{
  id v2 = sub_10000E2BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "void DiskListCompleteCallback(void *)";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Received DA list complete callback",  (uint8_t *)&v5,  0xCu);
  }

  return [a1 setDiskListCompleteReceived:1];
}

id sub_10001BCA8(uint64_t a1, void *a2)
{
  id v4 = sub_10000E2BC();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "void DiskAppearedCallback(DADiskRef, void *)";
    __int16 v9 = 2112;
    uint64_t v10 = a1;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Received DA appear notification for %@",  (uint8_t *)&v7,  0x16u);
  }

  return [a2 _handleDANotificationWithDisk:a1 operation:off_100051AC8];
}

void sub_10001BE24(_Unwind_Exception *a1)
{
}

void sub_10001BEA0(_Unwind_Exception *a1)
{
}

void sub_10001BF0C(_Unwind_Exception *a1)
{
}

LABEL_11:
  objc_sync_exit(v3);
  if (v5 && (__int16 v11 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk), (objc_opt_isKindOfClass(v5, v11) & 1) != 0))
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v5 container]);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 designatedPhysicalStore]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[SKDaemonManager wholeDiskForDisk:](self, "wholeDiskForDisk:", v13));
    if (!v14)
    {
      uint64_t v15 = sub_10000E2BC();
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v24 = "-[SKDaemonManager rootWholeDisk]";
        __int128 v25 = 2112;
        __int128 v26 = v12;
        __int128 v27 = 2112;
        v28 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Couldn't find root disk. container: %@, PS: %@",  buf,  0x20u);
      }
    }
  }

  else
  {
    id v17 = sub_10000E2BC();
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v24 = (const char *)v5;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_ERROR,  "Root volume must be APFS - found: %@",  buf,  0xCu);
    }

    uint64_t v14 = 0LL;
  }

  return v14;
}

  return v5;
}

  return v5;
}

void sub_10001C29C(_Unwind_Exception *a1)
{
}

void sub_10001C408(uint64_t a1)
{
  id v2 = (char *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) rootWholeDisk]);
  if (v2)
  {
    id v3 = -[SKDiskResizerBase initWithDisk:requestedSize:]( objc_alloc(&OBJC_CLASS___SKLastPartitionResizer),  "initWithDisk:requestedSize:",  v2,  *(void *)(a1 + 40));
    id v4 = sub_10000E2BC();
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412546;
      uint64_t v14 = v2;
      __int16 v15 = 2048;
      unint64_t v16 = -[SKLastPartitionResizer currentSize](v3, "currentSize");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Current size of %@: %lld bytes",  (uint8_t *)&v13,  0x16u);
    }

    unint64_t v6 = -[SKLastPartitionResizer currentSize](v3, "currentSize") & 0xFFF;
    int v7 = -[SKLastPartitionResizer currentSize](v3, "currentSize");
    if (v6) {
      int v7 = &v7[-(-[SKLastPartitionResizer currentSize](v3, "currentSize") & 0xFFF) + 4096];
    }
    unint64_t v8 = -[SKDiskResizerBase requestedSize](v3, "requestedSize") & 0xFFF;
    __int16 v9 = -[SKDiskResizerBase requestedSize](v3, "requestedSize");
    if (v8) {
      __int16 v9 = &v9[-(-[SKDiskResizerBase requestedSize](v3, "requestedSize") & 0xFFF) + 4096];
    }
    if (v7 == v9)
    {
      id v10 = sub_10000E2BC();
      __int16 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136315138;
        uint64_t v14 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: Disk was already resized",  (uint8_t *)&v13,  0xCu);
      }
    }

    else
    {
      id v12 =  [*(id *)(a1 + 32) resize:v2 toSize:*(void *)(a1 + 40) completionBlock:&stru_100045350];
    }
  }
}

void sub_10001C5E4(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10000E2BC();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  int v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      __int16 v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
      __int16 v12 = 2112;
      int v13 = v2;
      unint64_t v6 = "%s: VM disk resize failed: %@, shutting down";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, v8, v6, (uint8_t *)&v10, v9);
    }
  }

  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
    unint64_t v6 = "%s: VM disk resized successfully, shutting down";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_6;
  }

  reboot3(0x8000000000000008LL);
}

void sub_10001C7BC(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 4_Block_object_dispose(va, 8) = v2;
}

id sub_10001C7FC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001C850;
  v3[3] = &unk_100044B50;
  v3[4] = v1;
  return [v1 dispatchToWorkThread:v3];
}

id sub_10001C850(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueHeartbeat];
}

LABEL_26:
      objc_sync_exit(v7);
    }

    id v17 = dispatch_time(0LL, 5000000000LL);
    diskWorkQueueWatchDog = (dispatch_queue_s *)self->diskWorkQueueWatchDog;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_10001CC40;
    v19[3] = &unk_100044B50;
    v19[4] = self;
    dispatch_after(v17, diskWorkQueueWatchDog, v19);
  }

  _Block_object_dispose(&v29, 8);
}

void sub_10001CBB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

double sub_10001CC00(uint64_t a1)
{
  double result = -v2;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

id sub_10001CC40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueWatchdog];
}

LABEL_13:
    objc_sync_exit(v5);
  }

  else
  {
    int v7 = 0LL;
  }

  return v7;
}

    MKCFDisposeMedia(v12);
LABEL_14:
    unsigned int v23 = 0;
    goto LABEL_15;
  }

  __int128 v27 = MKCFWriteScheme(ValueAtIndex, v10, 0LL, 0LL, -[SKPartitionTable mediaRef](self, "mediaRef"));
  if (v27)
  {
    __int128 v25 = sub_10000E2BC();
    __int128 v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v29 = "-[SKPartitionTable overwriteExistingMediaLayout:opts:partitionScheme:size:]";
      id v30 = 1024;
      id v31 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to write scheme, MK err %d",  buf,  0x12u);
    }
  }

  MKCFDisposeMedia(v12);
  unsigned int v23 = v27 == 0;
LABEL_15:

  return v23;
}

void sub_10001CDB8(_Unwind_Exception *a1)
{
}

void sub_10001CF60(_Unwind_Exception *a1)
{
}

void sub_10001D160( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
}

uint64_t sub_10001D184(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10001D194(uint64_t a1)
{
}

void sub_10001D19C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _processDiskNotificationsForMap:*(void *)(a1 + 40) isCompleteDiskList:0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_10001D4C4(_Unwind_Exception *a1)
{
}

void sub_10001D548( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D728( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001D7C4(_Unwind_Exception *a1)
{
}

void sub_10001DE14( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

void sub_10001DE4C(uint64_t a1)
{
  uint64_t v2 = objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) _processDiskNotificationsForMap:*(void *)(a1 + 40) isCompleteDiskList:0]);
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_10001DFDC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fullRecacheWithDisks:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001E174(uint64_t a1)
{
  id v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  unint64_t v6 = sub_10001E204;
  int v7 = &unk_100044EB0;
  id v2 = *(void **)(a1 + 40);
  id v8 = *(id *)(a1 + 32);
  id v9 = v2;
  [v8 dispatchToWorkThread:&v4];
  uint64_t v3 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "finishedSemaphore", v4, v5, v6, v7, v8));
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void *sub_10001E204(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2 && !*(void *)(v3 + 96))
  {
    id v4 = sub_10000E2BC();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      unsigned int v18 = "-[SKDaemonManager _scheduleOperation:]_block_invoke_2";
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Scheduling operation: %@", buf, 0x16u);
    }

    *(_BYTE *)(*(void *)(a1 + 32) + 32LL) = 1;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 4_Block_object_dispose(va, 8) = v7;

    dispatch_time_t v10 = dispatch_time(0LL, 5000000000LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10001E3FC;
    block[3] = &unk_100044B50;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v10, &_dispatch_main_q, block);
    dispatch_time_t v11 = dispatch_time(0LL, 15000000000LL);
    uint64_t v12 = *(void *)(a1 + 32);
    int v13 = *(dispatch_queue_s **)(v12 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10001E458;
    v15[3] = &unk_100044B50;
    v15[4] = v12;
    dispatch_after(v11, v13, v15);
    uint64_t v3 = *(void *)(a1 + 32);
  }

  [*(id *)(v3 + 88) addObject:*(void *)(a1 + 40)];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[12]) {
    return [result _advanceOperationQueueOnWorkQueue];
  }
  return result;
}

id sub_10001E3FC(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_10001E450;
  v3[3] = &unk_100044B50;
  v3[4] = v1;
  return [v1 dispatchToWorkThread:v3];
}

id sub_10001E450(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueHeartbeat];
}

id sub_10001E458(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueWatchdog];
}

id sub_10001E4B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _advanceOperationQueueOnWorkQueue];
}

void sub_10001E9CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001EB5C(_Unwind_Exception *a1)
{
}

void sub_10001ECD8(_Unwind_Exception *a1)
{
}

id sub_10001EF28(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v2 visibleDiskRoles]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"role"]);

  id v6 = [v4 containsObject:v5];
  return v6;
}

id sub_10001F080(uint64_t a1)
{
  id v2 = sub_10000E2BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Timeout waiting for DA idle", v5, 2u);
  }

  return [*(id *)(a1 + 32) _idleCallback];
}

void sub_10001F290(_Unwind_Exception *a1)
{
}

void sub_10001F2AC(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 112LL);
  objc_sync_enter(v2);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 112) count];
  objc_sync_exit(v2);

  char v4 = *(_BYTE *)(a1 + 40);
  if (!v3)
  {
    if (!*(_BYTE *)(a1 + 40)) {
      goto LABEL_5;
    }
    char v4 = 1;
  }

  uint64_t v5 = *(void **)(a1 + 32);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_10001F4FC;
  v21[3] = &unk_100045490;
  char v22 = v4;
  v21[4] = v5;
  v21[5] = v3;
  [v5 dispatchSyncToWorkThread:v21];
LABEL_5:
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncAllDisksSemaphores]);
  BOOL v7 = [v6 count] == 0;

  if (!v7)
  {
    id v8 = sub_10000E2BC();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncAllDisksSemaphores]);
      unsigned int v11 = [v10 count];
      *(_DWORD *)buf = 136315394;
      __int128 v25 = "-[SKDaemonManager _idleCallback]_block_invoke";
      __int16 v26 = 1024;
      unsigned int v27 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Notifying %u client(s)", buf, 0x12u);
    }

    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "syncAllDisksSemaphores", 0));
    id v13 = [v12 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      do
      {
        for (i = 0LL; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v17 + 1) + 8LL * (void)i));
        }

        id v13 = [v12 countByEnumeratingWithState:&v17 objects:v23 count:16];
      }

      while (v13);
    }

    unint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncAllDisksSemaphores]);
    [v16 removeAllObjects];
  }

void sub_10001F4E0(_Unwind_Exception *a1)
{
}

void sub_10001F4FC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10001F620;
  v7[3] = &unk_100045468;
  v7[4] = v2;
  char v8 = *(_BYTE *)(a1 + 48);
  [v2 dispatchSyncToEjectThread:v7];
  id v3 = sub_10000E2BC();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (*(_BYTE *)(a1 + 48)) {
      id v6 = @" (complete disk list)";
    }
    else {
      id v6 = &stru_100046600;
    }
    *(_DWORD *)buf = 136315650;
    dispatch_time_t v10 = "-[SKDaemonManager _idleCallback]_block_invoke_2";
    __int16 v11 = 1024;
    int v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %u DA notification(s) handled%@",  buf,  0x1Cu);
  }
}

id sub_10001F620(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processDiskNotificationsWithCompleteDiskList:*(unsigned __int8 *)(a1 + 40)];
}

void sub_10001F8A8(_Unwind_Exception *a1)
{
}

void sub_10001FC9C(uint64_t a1)
{
  if ((objc_opt_respondsToSelector( *(void *)(*(void *)(a1 + 32) + 96LL),  "dmAsyncFinishedForDisk:mainError:detailError:dictionary:") & 1) != 0) {
    [*(id *)(*(void *)(a1 + 32) + 96) dmAsyncFinishedForDisk:*(void *)(a1 + 48) mainError:*(unsigned int *)(a1 + 56) detailError:*(unsigned int *)(a1 + 60) dictionary:*(void *)(a1 + 40)];
  }
  id v2 = *(const void **)(a1 + 48);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_10001FD98(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0LL);
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) diskArbCallbacksQueue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10001FE50;
  v9[3] = &unk_100044EB0;
  v9[4] = *(void *)(a1 + 32);
  dispatch_semaphore_t v10 = v2;
  char v4 = v2;
  dispatch_async(v3, v9);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  v5,  v6,  v7,  v8);
}

void sub_10001FE50(uint64_t a1)
{
  dispatch_semaphore_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) notificationsSyncQueue]);
  char v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472LL;
  uint64_t v6 = sub_10001FF18;
  uint64_t v7 = &unk_100044EB0;
  id v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  dispatch_async(v2, &v4);

  DAUnregisterCallback( *(DASessionRef *)(*(void *)(a1 + 32) + 72),  j__objc_msgSend__idleCallback,  *(void **)(a1 + 32));
  DARegisterIdleCallback(*(void *)(*(void *)(a1 + 32) + 72), j__objc_msgSend__idleCallback, *(void *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "startForceIdleTimer", v4, v5, v6, v7, v8);
}

void sub_10001FF18(uint64_t a1)
{
  dispatch_semaphore_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncAllDisksSemaphores]);
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = sub_10000E2BC();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) syncAllDisksSemaphores]);
    int v6 = 136315394;
    uint64_t v7 = "-[SKDaemonManager syncAllDisksWithCompletionBlock:]_block_invoke_3";
    __int16 v8 = 1024;
    unsigned int v9 = [v5 count];
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: %d client(s) are now waiting for idle",  (uint8_t *)&v6,  0x12u);
  }
}

uint64_t sub_100020078(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10002012C(uint64_t a1)
{
  if (!fstatat( -2, (const char *)[*(id *)(a1 + 32) fileSystemRepresentation], &v11, 544))
  {
    if (devname_r(v11.st_dev, 0x6000u, (char *)buf, 1024))
    {
      DADiskRef v8 = DADiskCreateFromBSDName(0LL, *(DASessionRef *)(*(void *)(a1 + 40) + 72LL), (const char *)buf);
      if (v8)
      {
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _diskWithDADisk:v8]);
LABEL_11:

        goto LABEL_12;
      }
    }

    else
    {
      id v9 = sub_10000E2BC();
      DADiskRef v8 = (DADiskRef)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)int v12 = 136315394;
        __int16 v13 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
        __int16 v14 = 2112;
        uint64_t v15 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Can't get BSD name for %@", v12, 0x16u);
      }
    }

    uint64_t v7 = 0LL;
    goto LABEL_11;
  }

  int v2 = *__error();
  id v3 = sub_10000E2BC();
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = strerror(v2);
    *(_DWORD *)buf = 136315650;
    __int128 v17 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
    __int16 v18 = 2112;
    uint64_t v19 = v5;
    __int16 v20 = 2080;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: fstatat of %@ failed: %s", buf, 0x20u);
  }

  uint64_t v7 = 0LL;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100020480(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) wholeDiskForDisk:*(void *)(a1 + 40)]);
  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

void sub_100020570(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isWholeDisk])
  {
    id v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) privateCache]);
    id v8 = (id)objc_claimAutoreleasedReturnValue([v2 sortedChildren]);

    id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v8 count]));
    if ([v8 count])
    {
      unint64_t v4 = 0LL;
      do
      {
        uint64_t v5 = *(void **)(a1 + 40);
        int v6 = (void *)objc_claimAutoreleasedReturnValue([v8 objectAtIndexedSubscript:v4]);
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 _diskWithDADisk:v6]);

        [v3 addObject:v7];
        ++v4;
      }

      while ((unint64_t)[v8 count] > v4);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

void sub_10002070C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastOperationName]);
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0LL);
}

BOOL sub_1000207C4(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return -[SKFilesystem shouldShow](a2, "shouldShow", a3);
}

uint64_t sub_100021D24(uint64_t a1, void *a2)
{
  return 0LL;
}

uint64_t sub_100022E80(uint64_t a1)
{
  if (a1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 16;
  }
  if (a1 == 1) {
    return 8LL;
  }
  else {
    return v1;
  }
}

uint64_t sub_100022E9C(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kSKDiskTypeGPTWholeDisk])
  {
    uint64_t v2 = 16LL;
  }

  else if ([v1 isEqualToString:kSKDiskTypeMBRWholeDisk])
  {
    uint64_t v2 = 8LL;
  }

  else if ([v1 isEqualToString:kSKDiskTypeAPMWholeDisk])
  {
    uint64_t v2 = 1LL;
  }

  else
  {
    uint64_t v2 = 512LL;
  }

  return v2;
}

NSDictionary *__cdecl sub_10002304C(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKPartitionTable.m", 67LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  int v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100023960(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKPartitionTable.m", 141LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  int v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_1000239FC(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKPartitionTable.m", 149LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  int v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100023E18(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKPartitionTable.m", 180LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  int v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

NSDictionary *__cdecl sub_100023EB4(id a1)
{
  uint64_t v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKPartitionTable.m", 187LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  int v6 = v2;
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

void sub_10002559C(id a1)
{
  id v1 = sub_10000E2BC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    unint64_t v4 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Connection to fsrunner interrupted",  (uint8_t *)&v3,  0xCu);
  }
}

void sub_100025640(id a1)
{
  id v1 = sub_10000E2BC();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    unint64_t v4 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "%s: Connection to fsrunner invalidated",  (uint8_t *)&v3,  0xCu);
  }
}

void sub_100025918( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_10002593C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_10002594C(uint64_t a1)
{
}

void sub_100025954(uint64_t a1, void *a2)
{
}

void sub_100025964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

NSDictionary *__cdecl sub_100025F08(id a1)
{
  id v5 = @"faultCode";
  id v1 = sub_10000E244((uint64_t)"SKFilesystemMaintainer.m", 204LL);
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  id v6 = v2;
  int v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v6,  &v5,  1LL));

  return (NSDictionary *)v3;
}

void sub_100026D60(_Unwind_Exception *a1)
{
}

BOOL sub_1000271AC(id a1, SKDisk *a2, NSDictionary *a3)
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](a2, "filesystem", a3));
  BOOL v4 = v3 == 0LL;

  return v4;
}

NSArray *__cdecl sub_100027410(id a1, SKDisk *a2, id *a3)
{
  int v3 = a2;
  unsigned int v4 = -[SKDisk isWritable](v3, "isWritable");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v3, "filesystem"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 verificationArgs]);
  uint64_t v7 = (void *)v6;
  if (v4)
  {
    v13[0] = v6;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v3, "filesystem"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 liveVerificationArgs]);
    v13[1] = v9;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v13, 2LL));
  }

  else
  {
    uint64_t v12 = v6;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v12, 1LL));
  }

  return (NSArray *)v10;
}

LABEL_21:
  return v22;
}

NSArray *__cdecl sub_100027914(id a1, SKDisk *a2, id *a3)
{
  unsigned int v4 = a2;
  uint64_t v16 = kSKDiskMountOptionRecursive;
  __int128 v17 = &__kCFBooleanTrue;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
  LOBYTE(a3) = -[SKDisk unmountWithOptions:error:](v4, "unmountWithOptions:error:", v5, a3);

  if ((a3 & 1) != 0)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[SKDisk filesystem](v4, "filesystem"));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 repairArgs]);
    id v11 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  }

  else
  {
    id v9 = sub_10000E2BC();
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v13 = "-[SKFilesystemMaintainer repairWithError:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v6,  OS_LOG_TYPE_ERROR,  "%s: Failed to unmount disk %@ for repair",  buf,  0x16u);
    }

    id v8 = 0LL;
  }

  return (NSArray *)v8;
}

void sub_100028048(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue([v2 progress]);
    [v4 setLocalizedAdditionalDescription:v3];
  }

void sub_10002809C(uint64_t a1, void *a2)
{
  if (a2)
  {
    uint64_t v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = (id)objc_claimAutoreleasedReturnValue([v2 progress]);
    [v4 setLocalizedAdditionalDescription:v3];
  }

void sub_100028F40(_Unwind_Exception *a1)
{
}

void sub_100029088(_Unwind_Exception *a1)
{
}

void sub_1000291D0(_Unwind_Exception *a1)
{
}

void sub_100029280(_Unwind_Exception *a1)
{
}

void sub_1000295B4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) childrenOperations]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v4 objectAtIndexedSubscript:*(void *)(a1 + 48)]);
  [v2 _processNotificationWithDiskOperation:v3];
}

void sub_100029994(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 notificationsCache]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v5 disksToProcess]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:*(void *)(a1 + 40)]);
  [v2 _processNotificationsWithDiskOperations:v4];
}

void sub_10002A3C8(_Unwind_Exception *a1)
{
}

void sub_10002A6F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

id sub_10002B414(uint64_t a1)
{
  uint64_t v2 = (void (**)(void, void))objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) callbackBlock]);
  v2[2](v2, 0LL);

  return [*(id *)(a1 + 32) finished];
}

void sub_10002B7EC(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 userInfo]);
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:_NSProgressRemoteLocalizedAdditionalDescriptionKey];
}

LABEL_24:
    -[SKDiskResizerBase setCompletedUnitCount:]( self,  "setCompletedUnitCount:",  (char *)-[SKDiskResizerBase completedUnitCount](self, "completedUnitCount") + 80);
    unsigned int v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase eventFromSize](self, "eventFromSize"));
    goto LABEL_25;
  }

  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  if ([v19 isCancelled])
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase resizeError](self, "resizeError"));

    if (!v20)
    {
      id v21 = sub_10000E2BC();
      char v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[SKLastPartitionResizer fsResize:]";
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Cancelling resize before it starts",  buf,  0xCu);
      }

      unsigned int v23 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase cancelWithError:](self, "cancelWithError:", a3));
      goto LABEL_25;
    }
  }

  else
  {
  }

  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  void v44[2] = sub_10002C438;
  v44[3] = &unk_100044B50;
  uint64_t v34 = v10;
  v45 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  [v35 setCancellationHandler:v44];

  uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue(-[SKLastPartitions resizablePart](v34, "resizablePart"));
  char v37 = objc_claimAutoreleasedReturnValue([v36 diskIdentifier]);
  id v38 = APFSContainerResize([v37 UTF8String], v12);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase progress](self, "progress"));
  LODWORD(v37) = [v39 isCancelled];

  if (!(_DWORD)v37)
  {
    if ((_DWORD)v38)
    {
      __int16 v41 =  +[SKError nilWithOSStatus:debugDescription:error:]( &OBJC_CLASS___SKError,  "nilWithOSStatus:debugDescription:error:",  v38,  @"APFS container resize failed",  a3);
      v40 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase rollbackResize:](self, "rollbackResize:", a3));
      goto LABEL_22;
    }

    goto LABEL_24;
  }

  v40 = objc_claimAutoreleasedReturnValue(-[SKDiskResizerBase cancelWithError:](self, "cancelWithError:", a3));
LABEL_22:
  unsigned int v42 = (void *)v40;

LABEL_26:
  return v42;
}

void sub_10002C438(uint64_t a1)
{
  id v2 = sub_10000E2BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SKLastPartitionResizer fsResize:]_block_invoke";
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Cancelling APFS resize",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) resizablePart]);
  id v5 = objc_claimAutoreleasedReturnValue([v4 diskIdentifier]);
  APFSCancelContainerResize([v5 UTF8String]);
}

uint64_t _deleteVolumeGroup(void *a1, void *a2, uint64_t a3, os_log_s **a4, NSString **a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = [v10 UTF8String];
  uint64_t v12 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", a3);
  id v38 = 0LL;
  uint64_t Volumes = APFSContainerVolumeGroupGetVolumes(v11, a3, &v38);
  if ((_DWORD)Volumes)
  {
    uint64_t v14 = Volumes;
    id v15 = sub_10000E2BC();
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      __int16 v42 = 2114;
      *(void *)v43 = v12;
      *(_WORD *)&v43[8] = 1024;
      *(_DWORD *)&v43[10] = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Failed to get volumes in group %{public}@, res=%d",  buf,  0x1Cu);
    }
  }

  else
  {
    uint64_t v16 = v38;
    id v17 = sub_10000E2BC();
    __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = -[os_log_s count](v16, "count");
      *(_DWORD *)buf = 136315650;
      __int16 v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      __int16 v42 = 1024;
      *(_DWORD *)v43 = v19;
      *(_WORD *)&v43[4] = 2114;
      *(void *)&v43[6] = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "%s: There are %d volumes in group %{public}@",  buf,  0x1Cu);
    }

    if (-[os_log_s count](v16, "count") == (id)2)
    {
      uint64_t v20 = APFSContainerVolumeGroupRemove(v11, a3);
      if ((_DWORD)v20)
      {
        uint64_t v14 = v20;
        id v21 = sub_10000E2BC();
        char v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          __int16 v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          __int16 v42 = 2114;
          *(void *)v43 = v12;
          *(_WORD *)&v43[8] = 2114;
          *(void *)&v43[10] = v10;
          __int16 v44 = 1024;
          int v45 = v14;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove volume group %{public}@ from %{public}@, res = %d",  buf,  0x26u);
        }
      }

      else
      {
        v33 = a4;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        unsigned int v23 = v16;
        id v24 = -[os_log_s countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
        if (v24)
        {
          id v25 = v24;
          uint64_t v26 = *(void *)v35;
          while (2)
          {
            for (i = 0LL; i != v25; i = (char *)i + 1)
            {
              if (*(void *)v35 != v26) {
                objc_enumerationMutation(v23);
              }
              v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@s%@",  v10,  *(void *)(*((void *)&v34 + 1) + 8LL * (void)i));
              if (!-[NSString isEqualToString:](v28, "isEqualToString:", v9))
              {
                __int16 v29 = v28;
                *a5 = v29;

                goto LABEL_22;
              }
            }

            id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( v23,  "countByEnumeratingWithState:objects:count:",  &v34,  v39,  16LL);
            if (v25) {
              continue;
            }
            break;
          }
        }

LABEL_22:
        id v30 = sub_10000E2BC();
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          __int16 v41 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          __int16 v42 = 2114;
          *(void *)v43 = v12;
          *(_WORD *)&v43[8] = 2114;
          *(void *)&v43[10] = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: Volume group %{public}@ removed from %{public}@",  buf,  0x20u);
        }

        uint64_t v16 = v23;
        uint64_t v14 = 0LL;
        void *v33 = v16;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }
  }

  return v14;
}

uint64_t SK_DM_APFSUtils_deleteVolume(void *a1)
{
  id v1 = a1;
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  uint64_t v53 = 0LL;
  uint64_t v54 = 0LL;
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 substringFromIndex:4]);
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 componentsSeparatedByString:@"s"]);

  if ((unint64_t)[v3 count] < 2)
  {
    id v5 = 0LL;
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectAtIndexedSubscript:0]);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"disk%@", v4));
  }

  int v6 = (NSUUID *)v1;
  id v7 = -[NSUUID UTF8String](v6, "UTF8String");
  id v8 = v5;
  id v9 = [v8 UTF8String];
  uint64_t v10 = 22LL;
  if (v7)
  {
    id v11 = v9;
    if (v9)
    {
      int v12 = APFSGetVolumeGroupID(v7, &v55);
      if (v12) {
        BOOL v13 = 0;
      }
      else {
        BOOL v13 = v55 != v53 || v56 != v54;
      }
      id v15 = -[NSUUID initWithUUIDBytes:](objc_alloc(&OBJC_CLASS___NSUUID), "initWithUUIDBytes:", &v55);
      id v16 = sub_10000E2BC();
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
        __int16 v47 = 2114;
        v48 = v6;
        __int16 v49 = 2114;
        id v50 = v15;
        __int16 v51 = 1024;
        int v52 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Volume %{public}@, group %{public}@ (get volume group res = %d)",  buf,  0x26u);
      }

      if (v13)
      {
        __int16 v44 = 0;
        int v18 = APFSVolumeRole(v7, &v44, 0LL);
        if (v18)
        {
          id v19 = sub_10000E2BC();
          uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
            __int16 v47 = 2114;
            v48 = v6;
            __int16 v49 = 1024;
            LODWORD(v50) = v18;
            _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_ERROR,  "%s: Failed to get APFS volume role for %{public}@, res = %d, assuming role = none",  buf,  0x1Cu);
          }
        }

        __int16 v42 = 0LL;
        v43 = 0LL;
        uint64_t v10 = _deleteVolumeGroup(v6, v8, (uint64_t)&v55, &v43, &v42);
        id v21 = v43;
        char v22 = v42;
        if (!(_DWORD)v10)
        {
          unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 _cachedDiskWithDiskIdentifier:v22]);

          if (!v24)
          {
            id v25 = sub_10000E2BC();
            uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              __int16 v47 = 2114;
              v48 = (NSUUID *)v22;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to find %{public}@ in SK cache",  buf,  0x16u);
            }

            id v24 = (void *)objc_opt_new(&OBJC_CLASS___NSObject, v27);
          }

          id v28 = v24;
          objc_sync_enter(v28);
          uint64_t v10 = APFSVolumeDelete(v7);
          id v29 = sub_10000E2BC();
          id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
            __int16 v47 = 2114;
            v48 = v6;
            __int16 v49 = 2114;
            id v50 = v15;
            __int16 v51 = 1024;
            int v52 = v10;
            _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "%s: Delete of APFS volume %{public}@ of group %{public}@ returned %d",  buf,  0x26u);
          }

          if ((_DWORD)v10)
          {
            int v31 = APFSContainerVolumeGroupAdd(v11, v21, &v55);
            id v32 = sub_10000E2BC();
            v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              __int16 v47 = 2114;
              v48 = v15;
              __int16 v49 = 1024;
              LODWORD(v50) = v31;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "%s: Volume group %{public}@ restore returned %d",  buf,  0x1Cu);
            }
          }

          else
          {
            __int16 v41 = 0;
            __int128 v36 = v22;
            int v40 = APFSVolumeRole(-[NSString UTF8String](v36, "UTF8String"), 0LL, &v41);
            id v37 = sub_10000E2BC();
            id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
              __int16 v47 = 2114;
              v48 = (NSUUID *)v36;
              __int16 v49 = 1024;
              LODWORD(v50) = v40;
              _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "%s: Remove volume role for %{public}@ returned %d",  buf,  0x1Cu);
            }
          }

          objc_sync_exit(v28);
        }
      }

      else
      {
        uint64_t v10 = APFSVolumeDelete(v7);
        id v34 = sub_10000E2BC();
        __int128 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v46 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
          __int16 v47 = 2114;
          v48 = v6;
          __int16 v49 = 1024;
          LODWORD(v50) = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "%s: Delete of APFS volume %{public}@ returned %d",  buf,  0x1Cu);
        }
      }
    }
  }

  return v10;
}

void sub_10002D134(_Unwind_Exception *a1)
{
}

void SK_DM_updateFileVaultProperties(void *a1, char a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002D208;
  v4[3] = &unk_100045800;
  char v7 = a2;
  id v5 = a1;
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[SKDaemonManager sharedManager](&OBJC_CLASS___SKDaemonManager, "sharedManager"));
  id v2 = v6;
  id v3 = v5;
  [v2 dispatchToWorkThread:v4];
}

void sub_10002D208(uint64_t a1)
{
  id v2 = sub_10000E2BC();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    __int16 v41 = "void SK_DM_updateFileVaultProperties(NSString *__strong, BOOL)_block_invoke";
    __int16 v42 = 2114;
    uint64_t v43 = v4;
    __int16 v44 = 1024;
    int v45 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "%s: Updating FileVault property of %{public}@ (and group members) to %d",  buf,  0x1Cu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) _cachedDiskWithDiskIdentifier:*(void *)(a1 + 32)]);
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___SKAPFSDisk);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    id v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 container]);
    if (v9)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v8 apfsVolumeGroupUUID]);
      int v12 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableArray, v11);
      BOOL v13 = v12;
      if (v10)
      {
        id v28 = v8;
        id v29 = v6;
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        uint64_t v27 = v9;
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 volumes]);
        id v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v35;
          do
          {
            for (i = 0LL; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v35 != v17) {
                objc_enumerationMutation(v14);
              }
              id v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
              uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 apfsVolumeGroupUUID]);
              unsigned int v21 = [v10 isEqual:v20];

              if (v21) {
                [v13 addObject:v19];
              }
            }

            id v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }

          while (v16);
        }

        id v8 = v28;
        id v6 = v29;
        id v9 = v27;
      }

      else
      {
        [v12 addObject:v8];
      }

      __int128 v32 = 0u;
      __int128 v33 = 0u;
      __int128 v30 = 0u;
      __int128 v31 = 0u;
      id v22 = v13;
      id v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v31;
        do
        {
          for (j = 0LL; j != v24; j = (char *)j + 1)
          {
            if (*(void *)v31 != v25) {
              objc_enumerationMutation(v22);
            }
            [*(id *)(*((void *)&v30 + 1) + 8 * (void)j) setDefaultEffaceable:*(_BYTE *)(a1 + 48) == 0];
          }

          id v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }

        while (v24);
      }

      [*(id *)(a1 + 40) _disksChanged:v22];
    }
  }
}

void sub_10002D4F0()
{
}

void sub_10002D518()
{
  __assert_rtn( "+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]",  "SKStateMachine.m",  83,  "events[entry.event] == nil");
}

id objc_msgSend_preflightRequestWithDiskDict_entitlementLevel_completionUUID_prettyFunc_authorizationNeeded_failResGenFunc_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:failResGenFunc:");
}

id objc_msgSend_preflightRequestWithDiskDict_entitlementLevel_completionUUID_prettyFunc_failResGenFunc_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:");
}

id objc_msgSend_preflightRequestWithSKDisk_entitlementLevel_completionUUID_prettyFunc_authorizationNeeded_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:");
}

id objc_msgSend_xmlOutputArg(void *a1, const char *a2, ...)
{
  return [a1 xmlOutputArg];
}
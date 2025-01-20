void sub_100002090(id a1)
{
  MSDLogModel *v1;
  void *v2;
  v1 = objc_alloc_init(&OBJC_CLASS___MSDLogModel);
  v2 = (void *)qword_10000C728;
  qword_10000C728 = (uint64_t)v1;
}

void sub_1000023DC(_Unwind_Exception *a1)
{
}

void sub_100002788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
}

uint64_t sub_1000027A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_1000027B0(uint64_t a1)
{
}

void sub_1000027B8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) description]);
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0]);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8LL);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1LL)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 description]);
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }

  *a4 = 0;
}

void sub_100002A80(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSDDemoVolumeManager);
  v2 = (void *)qword_10000C738;
  qword_10000C738 = (uint64_t)v1;
}

LABEL_10:
  return v11;
}

id sub_1000038F4(void *a1)
{
  id v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v3 = [v2 fileExistsAtPath:v1];

  return v3;
}

uint64_t start()
{
  if ((sub_1000038F4(@"/private/var/demo_bundle") & 1) != 0)
  {
    v0 = off_100008088;
LABEL_5:
    id v1 = (void *)objc_claimAutoreleasedReturnValue(-[__objc2_class sharedInstance](*v0, "sharedInstance"));
    [v1 finishInstallContent];

    return 0LL;
  }

  if (sub_1000038F4(@"/private/var/demo_backup"))
  {
    v0 = &off_100008090;
    goto LABEL_5;
  }

  return 0LL;
}

void sub_1000039F4(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___FDRContentInstaller);
  v2 = (void *)qword_10000C748;
  qword_10000C748 = (uint64_t)v1;
}

void sub_100004108(id a1)
{
  id v1 = objc_alloc_init(&OBJC_CLASS___MSDContentInstaller);
  v2 = (void *)qword_10000C758;
  qword_10000C758 = (uint64_t)v1;
}

LABEL_32:
  v10 = v13;
  v5 = v56;
  uint64_t v7 = v53;
LABEL_33:
  if (!-[MSDContentInstaller isContentRoot:](self, "isContentRoot:", v4))
  {
    v39 = 0LL;
    v38 = 1;
    goto LABEL_57;
  }

  v31 = -[MSDContentInstaller isContentRootToRemove:](self, "isContentRootToRemove:", v4);
  -[MSDContentInstaller removeXattr:](self, "removeXattr:", v4);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDContentInstaller originalPathFor:](self, "originalPathFor:", v4));

  v33 = self;
  v61 = v10;
  v34 = [v5 removeItemAtPath:v32 error:&v61];
  v13 = v61;

  if ((v34 & 1) == 0)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v50 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    [v14 logMessage:1, @"[INF]", @"Cannot remove %@ - %@", v32, v50 prefix message];

    v39 = 0LL;
    goto LABEL_65;
  }

  v10 = v13;
  v5 = v56;
  self = v33;
LABEL_37:
  if ((v31 & 1) != 0)
  {
    v57 = v10;
    v35 = [v5 removeItemAtPath:v4 error:&v57];
    v13 = v57;

    if ((v35 & 1) == 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
      v37 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
      [v36 logMessage:1, @"[INF]", @"Failed to remove:  %@ - Error:  %@", v4, v37 prefix message];
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v38 = 1;
    [v14 logMessage:1, @"[INF]", @"Removed %@.", v32 prefix message];
    v39 = 0LL;
    goto LABEL_54;
  }

  v40 = self;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v41 logMessage:1, @"[INF]", @"Moving content root item %@ to %@.", v4, v32 prefix message];

  v5 = v56;
  v39 = (void *)objc_claimAutoreleasedReturnValue([v32 stringByDeletingLastPathComponent]);
  if (([v56 fileExistsAtPath:v39 isDirectory:&v70] & 1) == 0
    && !-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]( v40,  "createIntermdediateDirectoriesInPathAndRestoreAttributes:",  v39))
  {
    v38 = 0;
    uint64_t v7 = v32;
    goto LABEL_57;
  }

  if (!-[MSDContentInstaller hasInheritanceACL:](v40, "hasInheritanceACL:", v39))
  {
    v58 = v10;
    v45 = [v56 moveItemAtPath:v4 toPath:v32 error:&v58];
    v13 = v58;

    if ((v45 & 1) != 0)
    {
      v38 = 1;
      goto LABEL_55;
    }

    id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    [v14 logMessage:1, @"[INF]", @"Cannot move %@ to %@.  Error:  %@", v4, v32, v51 prefix message];
    goto LABEL_64;
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v42 logMessage:1, @"[INF]", @"Parent folder of content root item has inheritance ACL: %@", v39 prefix message];

  v60 = v10;
  v43 = [v56 copyItemAtPath:v4 toPath:v32 error:&v60];
  v13 = v60;

  if ((v43 & 1) == 0)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v51 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    [v14 logMessage:1, @"[INF]", @"Cannot copy %@ to %@.  Error:  %@", v4, v32, v51 prefix message];
LABEL_64:

    goto LABEL_65;
  }

  v59 = v13;
  v44 = [v56 removeItemAtPath:v4 error:&v59];
  v10 = v59;

  if ((v44 & 1) != 0)
  {
    v38 = 1;
    uint64_t v7 = v32;
    goto LABEL_56;
  }

  id v14 = (id)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v10 localizedDescription]);
  [v14 logMessage:1, @"[INF]", @"Cannot remove item %@.  Error:  %@", v4, v52 prefix message];

  v38 = 0;
LABEL_53:
  v13 = v10;
LABEL_54:

LABEL_55:
  uint64_t v7 = v32;
  v10 = v13;
LABEL_56:
  v5 = v56;
LABEL_57:

  return v38;
}

void sub_100004EB4(_Unwind_Exception *a1)
{
}

uint64_t sub_100004EE0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_100004EF0(uint64_t a1)
{
}

void sub_100004EF8(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6 = objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) stringByAppendingPathComponent:a2]);
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v9 logMessage:1, @"[INF]", @"%s - intermediatePath:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];

  if ([*(id *)(a1 + 32) fileExistsAtPath:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]) {
    return;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue( [@"/private/var/demo_backup/backup" stringByAppendingPathComponent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  id v11 = *(void **)(a1 + 32);
  id v24 = 0LL;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v11 attributesOfItemAtPath:v10 error:&v24]);
  id v13 = v24;
  if (!v12)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 localizedDescription]);
    [v20 logMessage:1, @"[INF]", @"%s - Failed to read attributes of folder:  %@ - Error:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v10, v22 prefix message];

    goto LABEL_8;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 fileType]);
  unsigned int v15 = [v14 isEqualToString:NSFileTypeDirectory];

  if (!v15)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    [v20 logMessage:1, @"[INF]", @"%s - Intermediate path:  %@ must be folder.", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];
    goto LABEL_8;
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
  [v16 logMessage:1, @"[INF]", @"%s - Creating directory:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) prefix message];

  v17 = *(void **)(a1 + 32);
  uint64_t v18 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  id v23 = v13;
  LOBYTE(v16) = [v17 createDirectoryAtPath:v18 withIntermediateDirectories:0 attributes:v12 error:&v23];
  id v19 = v23;

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = (_BYTE)v16;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](&OBJC_CLASS___MSDLogModel, "sharedInstance"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v19 localizedDescription]);
    [v20 logMessage:1, @"[INF]", @"%s - Failed to create directory:  %@ - Error:  %@", "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]_block_invoke", v21 prefix message];

    id v13 = v19;
LABEL_8:

    id v19 = v13;
  }

  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    *a4 = 1;
  }
}

LABEL_7:
  v16 = 0;
LABEL_11:

  return v16;
}

LABEL_13:
    v9 = 0;
  }

  return v9;
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}
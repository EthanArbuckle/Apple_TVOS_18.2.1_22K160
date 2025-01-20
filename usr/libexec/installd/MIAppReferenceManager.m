@interface MIAppReferenceManager
+ (id)defaultManager;
- (BOOL)_countFinalReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_countReferencesWithType:(int)a3 atBaseURL:(id)a4 count:(unint64_t *)a5 withError:(id *)a6;
- (BOOL)_countTemporaryReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5;
- (BOOL)_removeReferenceAtURL:(id)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)_updateReferenceAtURL:(id)a3 byAddingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6;
- (BOOL)_updateReferenceAtURL:(id)a3 byRemovingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6;
- (BOOL)addReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 resultingPersonaUniqueStrings:(id *)a6 error:(id *)a7;
- (BOOL)addReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 byRemovingTemporaryReference:(BOOL)a5 inBundleContainer:(id)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)addTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 error:(id *)a6;
- (BOOL)finalizeTemporaryReference:(id)a3 resultingPersonaUniqueStrings:(id *)a4 error:(id *)a5;
- (BOOL)removeAllReferencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 error:(id *)a7;
- (BOOL)removeReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)removeReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8;
- (BOOL)removeTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 error:(id *)a7;
- (BOOL)revokeTemporaryReference:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5;
- (MIAppReferenceManager)init;
- (id)_referenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4;
- (id)_temporaryReferenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4;
- (id)addTemporaryReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6;
- (id)personaUniqueStringsForAppWithBundleID:(id)a3 domain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6;
- (id)personaUniqueStringsForAppWithBundleID:(id)a3 error:(id *)a4;
- (id)referencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5;
- (void)enumerateAppReferencesWithBlock:(id)a3;
@end

@implementation MIAppReferenceManager

+ (id)defaultManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004DFC4;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095BF0 != -1) {
    dispatch_once(&qword_100095BF0, block);
  }
  return (id)qword_100095BE8;
}

- (MIAppReferenceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIAppReferenceManager;
  return -[MIAppReferenceManager init](&v3, "init");
}

- (BOOL)addReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 resultingPersonaUniqueStrings:(id *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 bundleID]);
  id v24 = 0LL;
  v14 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v13,  a4,  &v24));
  id v15 = v24;

  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 personaUniqueString]);
    id v22 = v15;
    id v23 = 0LL;
    BOOL v17 = -[MIAppReferenceManager addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:]( self,  "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPerson aUniqueStrings:error:",  v9,  v16,  0LL,  v14,  &v23,  &v22);
    id v18 = v23;
    id v19 = v22;

    id v15 = v19;
    if (!a7) {
      goto LABEL_7;
    }
  }

  else
  {
    id v18 = 0LL;
    BOOL v17 = 0;
    if (!a7) {
      goto LABEL_7;
    }
  }

  if (!v17) {
    *a7 = v15;
  }
LABEL_7:
  char v20 = !v17;
  if (!a6) {
    char v20 = 1;
  }
  if ((v20 & 1) == 0) {
    *a6 = v18;
  }

  return v17;
}

- (BOOL)removeReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleID]);
  id v26 = 0LL;
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v15,  a4,  &v26));
  id v17 = v26;

  if (v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v14 personaUniqueString]);
    id v24 = v17;
    id v25 = 0LL;
    BOOL v19 = -[MIAppReferenceManager removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]( self,  "removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:",  v11,  v18,  v16,  a6,  &v25,  &v24);
    id v20 = v25;
    id v21 = v24;

    id v17 = v21;
    if (!a8) {
      goto LABEL_7;
    }
  }

  else
  {
    id v20 = 0LL;
    BOOL v19 = 0;
    if (!a8) {
      goto LABEL_7;
    }
  }

  if (!v19) {
    *a8 = v17;
  }
LABEL_7:
  char v22 = !v19;
  if (!a7) {
    char v22 = 1;
  }
  if ((v22 & 1) == 0) {
    *a7 = v20;
  }

  return v19;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
  id v22 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v11,  a4,  &v22));
  id v13 = v22;

  if (!v12)
  {
    id v19 = 0LL;
    if (!a6) {
      goto LABEL_10;
    }
    goto LABEL_8;
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 personaUniqueString]);
  id v21 = v13;
  unsigned int v15 = -[MIAppReferenceManager addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:]( self,  "addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:",  v7,  v14,  v12,  &v21);
  id v16 = v21;

  if (v15)
  {
    id v17 = objc_alloc(&OBJC_CLASS___MIAppReference);
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v19 = [v17 initWithReferenceUUID:v18 identity:v10 domain:a4 uid:v7];
  }

  else
  {
    id v19 = 0LL;
  }

  id v13 = v16;
  if (a6)
  {
LABEL_8:
    if (!v19) {
      *a6 = v13;
    }
  }

- (BOOL)finalizeTemporaryReference:(id)a3 resultingPersonaUniqueStrings:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
  id v22 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v10,  [v8 domain],  &v22));
  id v12 = v22;

  if (v11)
  {
    id v13 = [v8 uid];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 personaUniqueString]);
    id v20 = v12;
    id v21 = 0LL;
    BOOL v15 = -[MIAppReferenceManager addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:]( self,  "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPerson aUniqueStrings:error:",  v13,  v14,  1LL,  v11,  &v21,  &v20);
    id v16 = v21;
    id v17 = v20;

    id v12 = v17;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    id v16 = 0LL;
    BOOL v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (!v15) {
    *a5 = v12;
  }
LABEL_7:
  char v18 = !v15;
  if (!a4) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0) {
    *a4 = v16;
  }

  return v15;
}

- (BOOL)revokeTemporaryReference:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 identity]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleID]);
  id v19 = 0LL;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  v10,  [v8 domain],  &v19));
  id v12 = v19;

  if (v11)
  {
    id v13 = [v8 uid];
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 personaUniqueString]);
    id v18 = v12;
    BOOL v15 = -[MIAppReferenceManager removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:]( self,  "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:",  v13,  v14,  v11,  a4,  &v18);
    id v16 = v18;

    id v12 = v16;
    if (!a5) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v15 = 0;
    if (!a5) {
      goto LABEL_7;
    }
  }

  if (!v15) {
    *a5 = v12;
  }
LABEL_7:

  return v15;
}

- (id)_referenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 referenceStorageURL]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"user_%d/%@",  v4,  @"AppReferences"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v6 isDirectory:0]);

  return v7;
}

- (id)_temporaryReferenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([a4 referenceStorageURL]);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"user_%d/%@",  v4,  @"TemporaryAppReferences"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v6 isDirectory:0]);

  return v7;
}

- (BOOL)_updateReferenceAtURL:(id)a3 byAddingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v42 = 0LL;
  id v12 = (MIAppReferenceMetadata *)objc_claimAutoreleasedReturnValue( +[MIAppReferenceMetadata referenceMetadataFromURL:error:]( &OBJC_CLASS___MIAppReferenceMetadata,  "referenceMetadataFromURL:error:",  v9,  &v42));
  id v13 = v42;
  id v14 = v13;
  if (!v12)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    v37 = a6;
    if ([v18 isEqualToString:NSCocoaErrorDomain])
    {
      id v19 = [v14 code];

      if (v19 == (id)260)
      {
        id v20 = (id)objc_claimAutoreleasedReturnValue([v9 URLByDeletingLastPathComponent]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 URLByDeletingLastPathComponent]);
        id v41 = v14;
        unsigned int v22 = [v11 createDirectoryAtURL:v21 withIntermediateDirectories:0 mode:493 error:&v41];
        id v23 = v41;

        if (v22)
        {
          id v40 = v23;
          unsigned __int8 v24 = [v11 createDirectoryAtURL:v20 withIntermediateDirectories:0 mode:493 error:&v40];
          id v14 = v40;

          if ((v24 & 1) != 0)
          {
            id v12 = objc_opt_new(&OBJC_CLASS___MIAppReferenceMetadata);

            a6 = v37;
            goto LABEL_14;
          }

          id v23 = v14;
        }

LABEL_27:
        id v12 = 0LL;
        id v16 = 0LL;
        goto LABEL_31;
      }
    }

    else
    {
    }

    id v39 = 0LL;
    unsigned __int8 v27 = [v11 removeItemAtURL:v9 error:&v39];
    id v20 = v39;
    if ((v27 & 1) == 0)
    {
      uint64_t v28 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
        id v36 = v20;
        MOLogWrite(v28);
      }
    }

    v29 = (void *)MIInstallerErrorDomain;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path", v35, v36));
    id v32 = sub_1000130F4( (uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]",  222LL,  v29,  4LL,  v14,  0LL,  @"Failed to deserialize temporary references from %@",  v31,  (uint64_t)v30);
    id v23 = (id)objc_claimAutoreleasedReturnValue(v32);

    goto LABEL_27;
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](v12, "personas"));
  id v16 = (NSMutableArray *)[v15 mutableCopy];

  if (!v16)
  {
LABEL_14:
    id v16 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    goto LABEL_15;
  }

  if (!-[NSMutableArray count](v16, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100051C14(v9);
    }
    uint64_t v17 = qword_100095BF8;
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
      MOLogWrite(v17);
    }
  }

- (BOOL)_updateReferenceAtURL:(id)a3 byRemovingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v45 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MIAppReferenceMetadata referenceMetadataFromURL:error:]( &OBJC_CLASS___MIAppReferenceMetadata,  "referenceMetadataFromURL:error:",  v9,  &v45));
  id v13 = v45;
  id v14 = v13;
  if (!v12)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    if ([v21 isEqualToString:NSCocoaErrorDomain])
    {
      id v22 = [v14 code];

      if (v22 == (id)260)
      {

        id v16 = 0LL;
        if (!a5)
        {
          BOOL v32 = 1;
          id v14 = 0LL;
          goto LABEL_38;
        }

        id v14 = 0LL;
LABEL_12:
        id v23 = 0LL;
LABEL_36:
        id v37 = v23;
        *a5 = v37;

        goto LABEL_37;
      }
    }

    else
    {
    }

    id v44 = 0LL;
    unsigned __int8 v26 = [v11 removeItemAtURL:v9 error:&v44];
    id v25 = v44;
    if ((v26 & 1) == 0)
    {
      uint64_t v27 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v39 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
        id v41 = v25;
        MOLogWrite(v27);
      }
    }

    uint64_t v28 = (void *)MIInstallerErrorDomain;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path", v39, v41));
    id v31 = sub_1000130F4( (uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]",  280LL,  v28,  4LL,  v14,  0LL,  @"Failed to deserialize temporary references from %@",  v30,  (uint64_t)v29);
    id v20 = (id)objc_claimAutoreleasedReturnValue(v31);

    id v16 = 0LL;
    goto LABEL_20;
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v12 personas]);
  id v16 = [v15 mutableCopy];

  if (!v16)
  {
    if (!a5) {
      goto LABEL_37;
    }
    goto LABEL_12;
  }

  if ([v16 containsObject:v10])
  {
    [v16 removeObject:v10];
    id v18 = [v16 copy];
    [v12 setPersonas:v18];

    if (![v16 count])
    {
      id v42 = v14;
      unsigned __int8 v33 = [v11 removeItemAtURL:v9 error:&v42];
      id v34 = v42;

      if ((v33 & 1) != 0)
      {
        id v14 = v34;
      }

      else
      {
        uint64_t v36 = qword_100095BF8;
        if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
        {
          id v40 = (void *)objc_claimAutoreleasedReturnValue([v9 path]);
          MOLogWrite(v36);
        }

        id v14 = 0LL;
      }

- (BOOL)_countReferencesWithType:(int)a3 atBaseURL:(id)a4 count:(unint64_t *)a5 withError:(id *)a6
{
  id v9 = a4;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  uint64_t v17 = 0LL;
  id v18 = (id *)&v17;
  uint64_t v19 = 0x3032000000LL;
  id v20 = sub_10004F1EC;
  id v21 = sub_10004F1FC;
  id v22 = 0LL;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  if ([v10 itemDoesNotExistAtURL:v9])
  {
    if (a5) {
      *a5 = 0LL;
    }
    BOOL v11 = 1;
  }

  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004F204;
    v15[3] = &unk_100081AD0;
    int v16 = a3;
    v15[4] = &v17;
    v15[5] = &v23;
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 traverseDirectoryAtURL:v9 withBlock:v15]);
    if (v12) {
      objc_storeStrong(v18 + 5, v12);
    }
    id v13 = v18[5];
    BOOL v11 = v13 == 0LL;
    if (v13)
    {
      if (a6) {
        *a6 = v13;
      }
    }

    else if (a5)
    {
      *a5 = v24[3];
    }
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

- (BOOL)_countFinalReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 referenceStorageURL]);
  LOBYTE(a5) = -[MIAppReferenceManager _countReferencesWithType:atBaseURL:count:withError:]( self,  "_countReferencesWithType:atBaseURL:count:withError:",  2LL,  v8,  a3,  a5);

  return (char)a5;
}

- (BOOL)_countTemporaryReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue([a4 referenceStorageURL]);
  LOBYTE(a5) = -[MIAppReferenceManager _countReferencesWithType:atBaseURL:count:withError:]( self,  "_countReferencesWithType:atBaseURL:count:withError:",  1LL,  v8,  a3,  a5);

  return (char)a5;
}

- (BOOL)addTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a4;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _temporaryReferenceURLForUserWithID:inBundleContainer:]( self,  "_temporaryReferenceURLForUserWithID:inBundleContainer:",  v8,  a5));
  LOBYTE(a6) = -[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]( self,  "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:",  v11,  v10,  0LL,  a6);

  return (char)a6;
}

- (BOOL)addReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 byRemovingTemporaryReference:(BOOL)a5 inBundleContainer:(id)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a6;
  int v16 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:]( self,  "_referenceURLForUserWithID:inBundleContainer:",  v12,  v15));
  if (v11
    && !-[MIAppReferenceManager removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:]( self,  "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:",  v12,  v14,  v15,  0LL,  a8))
  {
    BOOL v17 = 0;
  }

  else
  {
    BOOL v17 = -[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]( self,  "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:",  v16,  v14,  a7,  a8);
  }

  return v17;
}

- (BOOL)_removeReferenceAtURL:(id)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  id v14 = a4;
  id v15 = a5;
  unsigned int v16 = -[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]( self,  "_updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:",  a3,  v14,  a7,  a8);
  BOOL v17 = v16;
  if (a6 && v16)
  {
    uint64_t v29 = 0LL;
    uint64_t v30 = 0LL;
    id v28 = 0LL;
    unsigned __int8 v18 = -[MIAppReferenceManager _countFinalReferences:inBundleContainer:withError:]( self,  "_countFinalReferences:inBundleContainer:withError:",  &v30,  v15,  &v28);
    id v19 = v28;
    if ((v18 & 1) == 0)
    {
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        id v24 = v19;
        MOLogWrite(qword_100095BF8);
      }

      id v19 = 0LL;
    }

    id v27 = v19;
    unsigned __int8 v20 = -[MIAppReferenceManager _countTemporaryReferences:inBundleContainer:withError:]( self,  "_countTemporaryReferences:inBundleContainer:withError:",  &v29,  v15,  &v27,  v24);
    id v21 = v27;

    uint64_t v22 = qword_100095BF8;
    if ((v20 & 1) == 0)
    {
      if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) < 3)
      {
LABEL_13:
        if (*(int *)(v22 + 44) < 5)
        {
LABEL_15:
          *a6 = v30 + v29 == 0;

          goto LABEL_16;
        }

- (BOOL)removeAllReferencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 error:(id *)a7
{
  uint64_t v9 = *(void *)&a5;
  id v22 = 0LL;
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  a3,  a4,  &v22));
  id v12 = v22;
  id v13 = v12;
  if (!v11)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
    else {
      BOOL v18 = 0;
    }

    id v14 = 0LL;
    if (!a7) {
      goto LABEL_13;
    }
LABEL_11:
    if (!v18)
    {
      id v17 = v13;
      BOOL v18 = 0;
      *a7 = v17;
      goto LABEL_14;
    }

- (BOOL)removeTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 error:(id *)a7
{
  uint64_t v10 = *(void *)&a3;
  id v12 = a5;
  id v13 = a4;
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _temporaryReferenceURLForUserWithID:inBundleContainer:]( self,  "_temporaryReferenceURLForUserWithID:inBundleContainer:",  v10,  v12));
  LOBYTE(a7) = -[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]( self,  "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:",  v14,  v13,  v12,  a6,  0LL,  a7);

  return (char)a7;
}

- (BOOL)removeReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v12 = *(void *)&a3;
  id v14 = a5;
  id v15 = a4;
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:]( self,  "_referenceURLForUserWithID:inBundleContainer:",  v12,  v14));
  LOBYTE(a8) = -[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]( self,  "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:",  v16,  v15,  v14,  a6,  a7,  a8);

  return (char)a8;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
}

- (id)referencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v30 = a3;
  id v28 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v7 = sub_10000D874();
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  int v9 = sub_10000D79C();
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  uint64_t v29 = v10;
  if (v11)
  {
    id v12 = v11;
    id v13 = 0LL;
    uint64_t v14 = *(void *)v33;
LABEL_3:
    uint64_t v15 = 0LL;
    while (1)
    {
      if (*(void *)v33 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = [*(id *)(*((void *)&v32 + 1) + 8 * v15) uid];
      id v17 = v16;
      if (a4 != 3 || v9 == (_DWORD)v16)
      {
        id v31 = v13;
        id v18 = (id)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:]( self,  "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:",  v30,  a4,  v16,  &v31));
        id v19 = v31;

        if (!v18)
        {

          id v21 = a5;
          id v22 = v28;
          if (a5) {
            goto LABEL_20;
          }
          goto LABEL_22;
        }

        unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", v17));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v18, v20);

        id v13 = v19;
        id v10 = v29;
      }

      if (v12 == (id)++v15)
      {
        id v12 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_16;
      }
    }
  }

  id v13 = 0LL;
LABEL_16:

  id v22 = v28;
  if (-[NSMutableDictionary count](v28, "count"))
  {
    id v18 = -[NSMutableDictionary copy](v28, "copy");
    id v19 = v13;
  }

  else
  {
    id v24 = sub_1000130F4( (uint64_t)"-[MIAppReferenceManager referencesForIdentifier:inDomain:error:]",  511LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Unexpectedly got no references for %@ for users %@",  v23,  (uint64_t)v30);
    id v19 = (id)objc_claimAutoreleasedReturnValue(v24);

    id v18 = 0LL;
  }

  id v21 = a5;
  if (a5)
  {
LABEL_20:
    if (!v18) {
      *id v21 = v19;
    }
  }

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 domain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  id v28 = 0LL;
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:]( &OBJC_CLASS___MIBundleContainer,  "appBundleContainerForIdentifier:inDomain:withError:",  a3,  a4,  &v28));
  id v10 = v28;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( -[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:]( self,  "_referenceURLForUserWithID:inBundleContainer:",  v7,  v9));
    id v27 = v10;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MIAppReferenceMetadata referenceMetadataFromURL:error:]( &OBJC_CLASS___MIAppReferenceMetadata,  "referenceMetadataFromURL:error:",  v11,  &v27));
    id v13 = v27;

    if (v12)
    {
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v12 personas]);
      uint64_t v15 = v14;
      uint64_t v16 = qword_100095BF8;
      id v17 = [v14 count];
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
      id v25 = v15;
      uint64_t v26 = v18;
      id v24 = v17;
      MOLogWrite(v16);
      goto LABEL_6;
    }

    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
    if ([v20 isEqualToString:NSCocoaErrorDomain])
    {
      id v21 = [v13 code];

      if (v21 == (id)260)
      {

        id v13 = (id)qword_100095BF8;
        if (qword_100095BF8)
        {
          if (*(int *)(qword_100095BF8 + 44) >= 7)
          {
            id v18 = (void *)objc_claimAutoreleasedReturnValue([v11 path]);
            id v24 = v18;
            MOLogWrite(v13);
            id v13 = 0LL;
            uint64_t v15 = &__NSArray0__struct;
LABEL_6:

LABEL_18:
            id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v15, v24, v25, v26));
LABEL_19:
            id v10 = v13;
            if (!a6) {
              goto LABEL_22;
            }
            goto LABEL_20;
          }

          id v13 = 0LL;
        }

        uint64_t v15 = &__NSArray0__struct;
        goto LABEL_18;
      }
    }

    else
    {
    }

    id v19 = 0LL;
    id v12 = 0LL;
    uint64_t v15 = 0LL;
    goto LABEL_19;
  }

  id v19 = 0LL;
  id v11 = 0LL;
  id v12 = 0LL;
  uint64_t v15 = 0LL;
  if (!a6) {
    goto LABEL_22;
  }
LABEL_20:
  if (!v19) {
    *a6 = v10;
  }
LABEL_22:
  id v22 = v19;

  return v22;
}

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = -[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:]( self,  "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:",  v6,  2LL,  sub_10000D79C(),  a4);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

@end
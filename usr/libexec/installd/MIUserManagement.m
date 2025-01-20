@interface MIUserManagement
+ (id)sharedInstance;
- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3;
- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4;
- (BOOL)setBundleIdentifiers:(id)a3 forPersonaUniqueString:(id)a4 error:(id *)a5;
- (MIUserManagement)init;
- (NSDictionary)personaAttributesMap;
- (NSString)enterprisePersonaUniqueString;
- (NSString)primaryPersonaUniqueString;
- (NSString)systemPersonaUniqueString;
- (OS_dispatch_queue)internalQueue;
- (id)bundleIDsAssociatedWithPersonaUniqueString:(id)a3 error:(id *)a4;
- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3;
- (id)personaForBundleID:(id)a3 error:(id *)a4;
- (unint64_t)personaGenerationIdentifier;
- (unint64_t)personaTypeForPersonaUniqueString:(id)a3;
- (void)setEnterprisePersonaUniqueString:(id)a3;
- (void)setPersonaAttributesMap:(id)a3;
- (void)setPersonaGenerationIdentifier:(unint64_t)a3;
- (void)setPrimaryPersonaUniqueString:(id)a3;
- (void)setSystemPersonaUniqueString:(id)a3;
@end

@implementation MIUserManagement

- (MIUserManagement)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MIUserManagement;
  v2 = -[MIUserManagement init](&v6, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.installd.umAccessQueue", 0LL);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;
  }

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000045B4;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095A58 != -1) {
    dispatch_once(&qword_100095A58, block);
  }
  return (id)qword_100095A50;
}

- (BOOL)_onQueue_refreshPersonaInformationWithError:(id *)a3
{
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  v45 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  id v6 = [sub_100004988() sharedManager];
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  id v51 = 0LL;
  id v8 = [v7 personaGenerationIdentifierWithError:&v51];
  id v9 = v51;

  if (!v8)
  {
    id v35 = sub_1000130F4( (uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]",  67LL,  MIInstallerErrorDomain,  4LL,  v9,  0LL,  @"Failed to read UM's persona generation identifier when resolving persona",  v10,  v38);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v35);
    goto LABEL_26;
  }

  uint64_t v11 = objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
  if (v11)
  {
    v12 = (void *)v11;
    unint64_t v13 = -[MIUserManagement personaGenerationIdentifier](self, "personaGenerationIdentifier");

    if (v8 == (id)v13)
    {
      BOOL v14 = 1;
      id v15 = v9;
      goto LABEL_29;
    }
  }

  id v16 = [sub_100004988() sharedManager];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v50 = v9;
  v18 = (void *)objc_claimAutoreleasedReturnValue([v17 listAllPersonaAttributesWithError:&v50]);
  id v19 = v50;

  if (!v18)
  {
    id v36 = sub_1000130F4( (uint64_t)"-[MIUserManagement _onQueue_refreshPersonaInformationWithError:]",  79LL,  MIInstallerErrorDomain,  4LL,  v19,  0LL,  @"Failed to read persona attributes from UM",  v20,  v38);
    id v15 = (id)objc_claimAutoreleasedReturnValue(v36);
    id v9 = v19;
LABEL_26:

    if (a3)
    {
      id v15 = v15;
      BOOL v14 = 0;
      *a3 = v15;
    }

    else
    {
      BOOL v14 = 0;
    }

    goto LABEL_29;
  }

  id v39 = v19;
  unint64_t v40 = (unint64_t)v8;
  v41 = self;
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v21 = v18;
  id v22 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v22)
  {
    id v23 = v22;
    p_enterprisePersonaUniqueString = (id *)&self->_enterprisePersonaUniqueString;
    location = (id *)&self->_systemPersonaUniqueString;
    uint64_t v24 = *(void *)v47;
    p_primaryPersonaUniqueString = (id *)&self->_primaryPersonaUniqueString;
    do
    {
      for (i = 0LL; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v47 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v46 + 1) + 8LL * (void)i);
        v27 = (void *)objc_claimAutoreleasedReturnValue([v26 userPersonaUniqueString]);
        if (v27)
        {
          v28 = (NSArray *)objc_claimAutoreleasedReturnValue([v26 userPersonaBundleIDList]);
          if (!v28) {
            v28 = objc_opt_new(&OBJC_CLASS___NSArray);
          }
          id v29 = objc_alloc(&OBJC_CLASS___MIPersonaAttributes);
          id v30 = [v26 userPersonaType];
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v28));
          id v32 = [v29 initWithPersonaString:v27 personaType:v30 associatedBundleIDs:v31];
          -[NSMutableDictionary setObject:forKeyedSubscript:](v45, "setObject:forKeyedSubscript:", v32, v27);
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v46 objects:v52 count:16];
    }

    while (v23);
  }

  v33 = (NSDictionary *)-[NSMutableDictionary copy](v45, "copy");
  personaAttributesMap = v41->_personaAttributesMap;
  v41->_personaAttributesMap = v33;

  v41->_personaGenerationIdentifier = v40;
  BOOL v14 = 1;
  id v15 = v39;
LABEL_29:

  return v14;
}

- (NSString)primaryPersonaUniqueString
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004AB0;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_primaryPersonaUniqueString;
}

- (NSString)enterprisePersonaUniqueString
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004BA4;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_enterprisePersonaUniqueString;
}

- (NSString)systemPersonaUniqueString
{
  dispatch_queue_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100004C98;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);

  return self->_systemPersonaUniqueString;
}

- (BOOL)isKnownPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  v18 = sub_100004EAC;
  id v19 = sub_100004EBC;
  id v20 = 0LL;
  if (([v6 isEqualToString:@"Invalid"] & 1) != 0
    || ([v6 isEqualToString:@"PersonalPersonaPlaceholderString"] & 1) != 0)
  {
    BOOL v7 = 1;
  }

  else
  {
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_100004EC4;
    v11[3] = &unk_100080C10;
    v11[4] = self;
    unint64_t v13 = &v15;
    id v12 = v6;
    BOOL v14 = &v21;
    dispatch_sync(v8, v11);

    int v9 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((_BYTE *)v22 + 24))
    {
      *a4 = (id) v16[5];
      int v9 = *((unsigned __int8 *)v22 + 24);
    }

    BOOL v7 = v9 != 0;
  }

  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v7;
}

- (id)multiPersonaSADAppBundleIDsWithError:(id *)a3
{
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100004EAC;
  id v20 = sub_100004EBC;
  id v21 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  unint64_t v13 = sub_100004EAC;
  BOOL v14 = sub_100004EBC;
  id v15 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000050F4;
  block[3] = &unk_100080C38;
  block[4] = self;
  void block[5] = &v10;
  block[6] = &v16;
  dispatch_sync(v5, block);

  id v6 = (void *)v17[5];
  if (a3 && !v6)
  {
    *a3 = (id) v11[5];
    id v6 = (void *)v17[5];
  }

  id v7 = v6;
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

- (id)personaForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  v34 = sub_100004EAC;
  id v35 = sub_100004EBC;
  id v36 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = sub_100004EAC;
  id v29 = sub_100004EBC;
  id v30 = 0LL;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
  {
    id v15 = v6;
    MOLogWrite(qword_100095BF8);
  }

  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue", v15));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10000541C;
  block[3] = &unk_100080C88;
  uint64_t v18 = &v21;
  block[4] = self;
  id v19 = &v25;
  id v8 = v6;
  id v17 = v8;
  id v20 = &v31;
  dispatch_sync(v7, block);

  if (*((_BYTE *)v22 + 24))
  {
    if (v32[5]) {
      goto LABEL_11;
    }
    int v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
    uint64_t v10 = objc_claimAutoreleasedReturnValue([v9 primaryPersonaString]);
    uint64_t v11 = (void *)v32[5];
    v32[5] = v10;

    BOOL v12 = *((_BYTE *)v22 + 24) == 0;
    if (!a4) {
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v12 = 1;
    if (!a4) {
      goto LABEL_11;
    }
  }

  if (v12) {
    *a4 = (id) v26[5];
  }
LABEL_11:
  id v13 = (id)v32[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v13;
}

- (unint64_t)personaTypeForPersonaUniqueString:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v4]);

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIUserManagement personaAttributesMap](self, "personaAttributesMap"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v4]);
    unint64_t v9 = (unint64_t)[v8 personaType];
  }

  else
  {
    unint64_t v9 = 1000LL;
  }

  return v9;
}

- (BOOL)setBundleIdentifiers:(id)a3 forPersonaUniqueString:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [sub_100004988() sharedManager];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  id v17 = 0LL;
  unsigned __int8 v11 = [v10 setBundleIdentifiers:v7 forPersonaWithPersonaUniqueString:v8 withError:&v17];
  id v12 = v17;

  if ((v11 & 1) == 0)
  {
    id v14 = sub_1000130F4( (uint64_t)"-[MIUserManagement setBundleIdentifiers:forPersonaUniqueString:error:]",  268LL,  MIInstallerErrorDomain,  4LL,  v12,  0LL,  @"Failed to associate apps with persona %@ : %@",  v13,  (uint64_t)v7);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (a5)
    {
      id v12 = v15;
      *a5 = v12;
    }

    else
    {
      id v12 = v15;
    }
  }

  return v11;
}

- (id)bundleIDsAssociatedWithPersonaUniqueString:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = sub_100004EAC;
  v26 = sub_100004EBC;
  id v27 = 0LL;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  id v19 = sub_100004EAC;
  id v20 = sub_100004EBC;
  id v21 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIUserManagement internalQueue](self, "internalQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000058D4;
  v12[3] = &unk_100080C10;
  v12[4] = self;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  id v15 = &v16;
  dispatch_sync(v7, v12);

  id v9 = (void *)v17[5];
  if (a4 && !v9)
  {
    *a4 = (id) v23[5];
    id v9 = (void *)v17[5];
  }

  id v10 = v9;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)setPrimaryPersonaUniqueString:(id)a3
{
}

- (void)setEnterprisePersonaUniqueString:(id)a3
{
}

- (void)setSystemPersonaUniqueString:(id)a3
{
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (unint64_t)personaGenerationIdentifier
{
  return self->_personaGenerationIdentifier;
}

- (void)setPersonaGenerationIdentifier:(unint64_t)a3
{
  self->_personaGenerationIdentifier = a3;
}

- (NSDictionary)personaAttributesMap
{
  return self->_personaAttributesMap;
}

- (void)setPersonaAttributesMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
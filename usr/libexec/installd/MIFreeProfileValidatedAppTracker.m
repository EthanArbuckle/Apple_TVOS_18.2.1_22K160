@interface MIFreeProfileValidatedAppTracker
+ (id)sharedTracker;
- (BOOL)_onQueue_addAppIdentifierIfCachedOnContainer:(id)a3 error:(id *)a4;
- (BOOL)_onQueue_addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5;
- (BOOL)_onQueue_discoverReferencesWithError:(id *)a3;
- (BOOL)_onQueue_removeReferenceForBundle:(id)a3 error:(id *)a4;
- (BOOL)addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5;
- (BOOL)removeReferenceForBundle:(id)a3 error:(id *)a4;
- (MIFreeProfileValidatedAppTracker)init;
- (NSMutableSet)refs;
- (OS_dispatch_queue)q;
- (void)invalidateCache;
- (void)setRefs:(id)a3;
@end

@implementation MIFreeProfileValidatedAppTracker

+ (id)sharedTracker
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036B28;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095B88 != -1) {
    dispatch_once(&qword_100095B88, block);
  }
  return (id)qword_100095B80;
}

- (MIFreeProfileValidatedAppTracker)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MIFreeProfileValidatedAppTracker;
  v2 = -[MIFreeProfileValidatedAppTracker init](&v9, "init");
  if (v2
    && (dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3),
        dispatch_queue_t v5 = dispatch_queue_create("com.apple.installd.MIFreeProfileValidatedAppTracker", v4),
        q = v2->_q,
        v2->_q = (OS_dispatch_queue *)v5,
        q,
        v4,
        !v2->_q))
  {
    v7 = 0LL;
  }

  else
  {
    v7 = v2;
  }

  return v7;
}

- (void)invalidateCache
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100036C88;
  block[3] = &unk_100080BE8;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (BOOL)_onQueue_addAppIdentifierIfCachedOnContainer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0LL;
  v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_100036DF8;
  v20 = sub_100036E08;
  id v21 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 containerURL]);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100036E10;
  v15[3] = &unk_1000817E0;
  v15[4] = self;
  v15[5] = &v16;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue([v8 enumerateURLsForItemsInDirectoryAtURL:v7 ignoreSymlinks:1 withBlock:v15]);

  v10 = (void *)v17[5];
  if (v10 || (v10 = v9) != 0LL)
  {
    id v11 = v10;
    id v12 = v11;
    if (a4)
    {
      id v12 = v11;
      BOOL v13 = 0;
      *a4 = v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    id v12 = 0LL;
    BOOL v13 = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v13;
}

- (BOOL)_onQueue_discoverReferencesWithError:(id *)a3
{
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  dispatch_assert_queue_V2(v5);

  id v6 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  -[MIFreeProfileValidatedAppTracker setRefs:](self, "setRefs:", v6);

  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000LL;
  uint64_t v18 = sub_100036DF8;
  v19 = sub_100036E08;
  id v20 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 primaryPersonaString]);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000370F0;
  v14[3] = &unk_100081808;
  v14[4] = self;
  v14[5] = &v15;
  objc_super v9 = (void *)objc_claimAutoreleasedReturnValue( +[MIMCMContainer enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:]( &OBJC_CLASS___MIMCMContainer,  "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:",  1LL,  v8,  0LL,  0LL,  0LL,  v14));

  v10 = (void *)v16[5];
  if (v10)
  {
    id v11 = v10;

    BOOL v12 = 0;
    objc_super v9 = v11;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    BOOL v12 = v9 == 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v12) {
    *a3 = v9;
  }
LABEL_7:

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)_onQueue_addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  dispatch_assert_queue_V2(v10);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  if (([v9 isPlaceholder] & 1) != 0 || objc_msgSend(v9, "bundleType") != 4)
  {
    id v14 = 0LL;
    goto LABEL_6;
  }

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  if (v12)
  {

    id v13 = 0LL;
  }

  else
  {
    id v34 = 0LL;
    unsigned __int8 v17 = -[MIFreeProfileValidatedAppTracker _onQueue_discoverReferencesWithError:]( self,  "_onQueue_discoverReferencesWithError:",  &v34);
    id v13 = v34;
    id v14 = v13;
    if ((v17 & 1) == 0) {
      goto LABEL_17;
    }
  }

  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  if ((unint64_t)[v18 count] <= 2)
  {

    goto LABEL_13;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  unsigned __int8 v20 = [v19 containsObject:v8];

  if ((v20 & 1) != 0)
  {
LABEL_13:
    v27 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleURL]);
    id v33 = v13;
    unsigned __int8 v28 = [v11 setValidatedByFreeProfileAppIdentifier:v8 insecurelyCachedOnBundle:v27 error:&v33];
    id v14 = v33;

    if ((v28 & 1) == 0)
    {
      v30 = (void *)MIInstallerErrorDomain;
      v22 = (void *)objc_claimAutoreleasedReturnValue([v9 bundleURL]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
      id v32 = sub_1000130F4( (uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]",  176LL,  v30,  4LL,  v14,  0LL,  @"Failed to set app identifier (%@) for %@",  v31,  (uint64_t)v8);
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v32);
      id v13 = v14;
      goto LABEL_16;
    }

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
    [v29 addObject:v8];

LABEL_6:
    BOOL v15 = 1;
    goto LABEL_7;
  }

  id v21 = (void *)MIInstallerErrorDomain;
  v35[0] = @"LegacyErrorString";
  v35[1] = MILibMISErrorNumberKey;
  v36[0] = @"ApplicationVerificationFailed";
  v36[1] = &off_10008A140;
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v36,  v35,  2LL));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  id v25 = sub_1000130F4( (uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]",  171LL,  v21,  13LL,  0LL,  v22,  @"This device has reached the maximum number of installed apps using a free developer profile: %@",  v24,  (uint64_t)v23);
  uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);
LABEL_16:

  id v14 = (id)v26;
LABEL_17:
  if (a5)
  {
    id v14 = v14;
    BOOL v15 = 0;
    *a5 = v14;
  }

  else
  {
    BOOL v15 = 0;
  }

- (BOOL)addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0LL;
  unsigned __int8 v28 = &v27;
  uint64_t v29 = 0x2020000000LL;
  char v30 = 0;
  uint64_t v21 = 0LL;
  v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = sub_100036DF8;
  id v25 = sub_100036E08;
  id v26 = 0LL;
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100037608;
  block[3] = &unk_100081620;
  v19 = &v27;
  block[4] = self;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  unsigned __int8 v20 = &v21;
  dispatch_sync(v10, block);

  int v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = (id) v22[5];
    int v13 = *((unsigned __int8 *)v28 + 24);
  }

  BOOL v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)_onQueue_removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleURL]);
  id v27 = 0LL;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:v8 error:&v27]);
  id v10 = v27;

  if (v9)
  {
    id v11 = (char *)[v9 rangeOfString:@"."];
    if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || (int v13 = v11 + 1, v11 + 1 >= [v9 length]))
    {
      id v18 = sub_1000130F4( (uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]",  229LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"Cached app identifier contains invalid data (%@)",  v12,  (uint64_t)v9);
      BOOL v14 = 0LL;
      v19 = v10;
      id v10 = (id)objc_claimAutoreleasedReturnValue(v18);
    }

    else
    {
      BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v9 substringFromIndex:v13]);
      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      unsigned __int8 v16 = [v14 isEqualToString:v15];

      if ((v16 & 1) != 0)
      {
        id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
        [v17 removeObject:v9];

        MIUninstallProfilesForAppIdentifier(v9);
LABEL_13:
        BOOL v21 = 1;
        goto LABEL_14;
      }

      uint64_t v23 = (void *)MIInstallerErrorDomain;
      v19 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
      id v25 = sub_1000130F4( (uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]",  234LL,  v23,  4LL,  0LL,  0LL,  @"Cached bundle identifier (%@) does not match bundle identifier (%@)",  v24,  (uint64_t)v14);
      uint64_t v26 = objc_claimAutoreleasedReturnValue(v25);

      id v10 = (id)v26;
    }

    goto LABEL_18;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  if ([v19 isEqualToString:NSPOSIXErrorDomain])
  {
    id v20 = [v10 code];

    if (v20 != (id)93)
    {
      BOOL v14 = 0LL;
      goto LABEL_19;
    }

LABEL_12:
    id v10 = 0LL;
    id v9 = 0LL;
    BOOL v14 = 0LL;
    goto LABEL_13;
  }

  BOOL v14 = 0LL;
LABEL_18:

LABEL_19:
  if (a4)
  {
    id v10 = v10;
    BOOL v21 = 0;
    *a4 = v10;
  }

  else
  {
    BOOL v21 = 0;
  }

- (BOOL)removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0LL;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000LL;
  v19 = sub_100036DF8;
  id v20 = sub_100036E08;
  id v21 = 0LL;
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100037A64;
  v12[3] = &unk_100080EA8;
  BOOL v14 = &v22;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  BOOL v15 = &v16;
  dispatch_sync(v7, v12);

  int v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = (id) v17[5];
    int v9 = *((unsigned __int8 *)v23 + 24);
  }

  BOOL v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (NSMutableSet)refs
{
  return self->_refs;
}

- (void)setRefs:(id)a3
{
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
}

@end
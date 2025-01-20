@interface MIJournal
+ (id)sharedInstance;
- (BOOL)purgeJournalEntry:(id)a3 withError:(id *)a4;
- (BOOL)writeJournalEntry:(id)a3 withError:(id *)a4;
- (MIJournal)init;
- (NSSet)journalEntryClasses;
- (NSURL)journalStorageBase;
- (id)_journalStorageURLForUniqueIdentifier:(id)a3;
- (id)journalEntryForUniqueIdentifier:(id)a3;
- (id)journaledEntriesWithError:(id *)a3;
- (void)_enumerateJournaledEntriesContinuingOnFailure:(BOOL)a3 withBlock:(id)a4;
- (void)reconcile;
@end

@implementation MIJournal

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100028D98;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095B38 != -1) {
    dispatch_once(&qword_100095B38, block);
  }
  return (id)qword_100095B30;
}

- (MIJournal)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___MIJournal;
  return -[MIJournal init](&v3, "init");
}

- (NSSet)journalEntryClasses
{
  return +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  objc_opt_class(&OBJC_CLASS___MIInstallationJournalEntry),  0LL);
}

- (NSURL)journalStorageBase
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](&OBJC_CLASS___MIDaemonConfiguration, "sharedInstance"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 journalStorageBaseURL]);

  return (NSURL *)v3;
}

- (id)_journalStorageURLForUniqueIdentifier:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 stringByAppendingPathExtension:@"plist"]);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalStorageBase](self, "journalStorageBase"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:v4 isDirectory:0]);

  return v6;
}

- (BOOL)writeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 shouldPersist];
  if (+[ICLFeatureFlags twoStageAppInstallEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "twoStageAppInstallEnabled")) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    id v9 = 0LL;
    v10 = 0LL;
    v11 = 0LL;
    BOOL v12 = 1;
  }

  else
  {
    if (qword_100095BF8 && *(int *)(qword_100095BF8 + 44) >= 7)
    {
      id v22 = v6;
      MOLogWrite(qword_100095BF8);
    }

    id v25 = 0LL;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  v6,  1LL,  &v25,  v22));
    id v13 = v25;
    v14 = v13;
    if (!v10)
    {
      v11 = 0LL;
      id v9 = v13;
      if (a4)
      {
LABEL_18:
        id v9 = v9;
        BOOL v12 = 0;
        *a4 = v9;
        goto LABEL_21;
      }

- (BOOL)purgeJournalEntry:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!+[ICLFeatureFlags twoStageAppInstallEnabled]( &OBJC_CLASS___ICLFeatureFlags,  "twoStageAppInstallEnabled"))
  {
    id v13 = 0LL;
    v10 = 0LL;
LABEL_19:
    BOOL v15 = 1;
    goto LABEL_20;
  }

  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    id v17 = v6;
    MOLogWrite(qword_100095BF8);
  }

  id v21 = 0LL;
  unsigned __int8 v7 = objc_msgSend(v6, "cleanUpJournaledDataOnDiskWithError:", &v21, v17);
  id v8 = v21;
  if ((v7 & 1) == 0)
  {
    if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
    {
      id v18 = v8;
      MOLogWrite(qword_100095BF8);
    }

    id v8 = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uniqueIdentifier", v18));
  v10 = (void *)objc_claimAutoreleasedReturnValue( -[MIJournal _journalStorageURLForUniqueIdentifier:]( self,  "_journalStorageURLForUniqueIdentifier:",  v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v20 = v8;
  unsigned __int8 v12 = [v11 removeItemAtURL:v10 error:&v20];
  id v13 = v20;

  if ((v12 & 1) != 0) {
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000506AC((uint64_t)v6, v10);
  }
  uint64_t v14 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
  {
    unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
    MOLogWrite(v14);
  }

  if (a4)
  {
    id v13 = v13;
    BOOL v15 = 0;
    *a4 = v13;
  }

  else
  {
    BOOL v15 = 0;
  }

- (void)_enumerateJournaledEntriesContinuingOnFailure:(BOOL)a3 withBlock:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalEntryClasses](self, "journalEntryClasses"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](&OBJC_CLASS___MIFileManager, "defaultManager"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MIJournal journalStorageBase](self, "journalStorageBase"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100029438;
  v13[3] = &unk_1000814E0;
  BOOL v16 = a3;
  id v14 = v7;
  id v15 = v6;
  id v10 = v7;
  id v11 = v6;
  id v12 = [v8 enumerateURLsForItemsInDirectoryAtURL:v9 ignoreSymlinks:1 withBlock:v13];
}

- (void)reconcile
{
  if ((_os_feature_enabled_impl("MobileInstallation", "install_journal") & 1) != 0)
  {
    -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:]( self,  "_enumerateJournaledEntriesContinuingOnFailure:withBlock:",  1LL,  &stru_100081520);
  }

  else if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    MOLogWrite(qword_100095BF8);
  }

- (id)journalEntryForUniqueIdentifier:(id)a3
{
  uint64_t v10 = 0LL;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000LL;
  id v13 = sub_100029900;
  id v14 = sub_100029910;
  id v15 = 0LL;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100029918;
  v7[3] = &unk_100081548;
  id v4 = a3;
  id v8 = v4;
  id v9 = &v10;
  -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:]( self,  "_enumerateJournaledEntriesContinuingOnFailure:withBlock:",  1LL,  v7);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (id)journaledEntriesWithError:(id *)a3
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_100029900;
  id v18 = sub_100029910;
  id v19 = 0LL;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  uint64_t v10 = sub_100029AB8;
  id v11 = &unk_100081548;
  id v5 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v12 = v5;
  id v13 = &v14;
  -[MIJournal _enumerateJournaledEntriesContinuingOnFailure:withBlock:]( self,  "_enumerateJournaledEntriesContinuingOnFailure:withBlock:",  0LL,  &v8);
  if (v15[5])
  {
    id v6 = 0LL;
    if (!a3) {
      goto LABEL_7;
    }
  }

  else
  {
    id v6 = -[NSMutableArray copy](v5, "copy", v8, v9, v10, v11);
    if (!a3) {
      goto LABEL_7;
    }
  }

  if (!v6) {
    *a3 = (id) v15[5];
  }
LABEL_7:

  _Block_object_dispose(&v14, 8);
  return v6;
}

@end
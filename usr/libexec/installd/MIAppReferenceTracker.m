@interface MIAppReferenceTracker
+ (id)managerForInstallationDomain:(unint64_t)a3;
- (BOOL)addReferenceForIdentity:(id)a3 error:(id *)a4;
- (BOOL)finalizeTemporaryReference:(id)a3 error:(id *)a4;
- (BOOL)referenceExists:(BOOL *)a3 forIdentity:(id)a4 error:(id *)a5;
- (BOOL)removeReferenceForIdentity:(id)a3 waitingForSpaceReclaimation:(BOOL)a4 error:(id *)a5;
- (BOOL)revokeTemporaryReference:(id)a3 error:(id *)a4;
- (id)addTemporaryReferenceForIdentity:(id)a3 error:(id *)a4;
- (id)initForInstallationDomain:(unint64_t)a3;
- (unint64_t)domain;
- (void)enumerateAppReferencesWithBlock:(id)a3;
@end

@implementation MIAppReferenceTracker

+ (id)managerForInstallationDomain:(unint64_t)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004BDA4;
  block[3] = &unk_100080BC0;
  block[4] = a1;
  if (qword_100095BD0 != -1) {
    dispatch_once(&qword_100095BD0, block);
  }
  if (a3 == 2)
  {
    v4 = (void *)qword_100095BC0;
    goto LABEL_7;
  }

  if (a3 == 3)
  {
    v4 = (void *)qword_100095BC8;
LABEL_7:
    id v5 = v4;
    return v5;
  }

  id v5 = 0LL;
  return v5;
}

- (id)initForInstallationDomain:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MIAppReferenceTracker;
  id result = -[MIAppReferenceTracker init](&v5, "init");
  if (result) {
    *((void *)result + 1) = a3;
  }
  return result;
}

- (BOOL)referenceExists:(BOOL *)a3 forIdentity:(id)a4 error:(id *)a5
{
  id v7 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]",  59LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v5,  (uint64_t)"-[MIAppReferenceTracker referenceExists:forIdentity:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

- (BOOL)addReferenceForIdentity:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]",  68LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MIAppReferenceTracker addReferenceForIdentity:error:]");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (BOOL)removeReferenceForIdentity:(id)a3 waitingForSpaceReclaimation:(BOOL)a4 error:(id *)a5
{
  id v7 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]",  77LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v5,  (uint64_t)"-[MIAppReferenceTracker removeReferenceForIdentity:waitingForSpaceReclaimation:error:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (a5) {
    *a5 = v8;
  }

  return 0;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]",  86LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MIAppReferenceTracker addTemporaryReferenceForIdentity:error:]");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0LL;
}

- (BOOL)finalizeTemporaryReference:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]",  95LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MIAppReferenceTracker finalizeTemporaryReference:error:]");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (BOOL)revokeTemporaryReference:(id)a3 error:(id *)a4
{
  id v6 = sub_1000130F4( (uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]",  104LL,  MIInstallerErrorDomain,  4LL,  0LL,  0LL,  @"%s is not yet implemented",  v4,  (uint64_t)"-[MIAppReferenceTracker revokeTemporaryReference:error:]");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (a4) {
    *a4 = v7;
  }

  return 0;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
}

- (unint64_t)domain
{
  return self->_domain;
}

@end
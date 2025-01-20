@interface MIReferenceAwareLSDatabaseGatherer
- (BOOL)performGatherWithError:(id *)a3;
- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6;
- (MIReferenceAwareLSDatabaseGatherer)initWithOptions:(unint64_t)a3 forTargetUID:(unsigned int)a4 enumerator:(id)a5;
- (unsigned)targetUID;
- (void)setTargetUID:(unsigned int)a3;
@end

@implementation MIReferenceAwareLSDatabaseGatherer

- (BOOL)scanExecutableBundle:(id)a3 inContainer:(id)a4 forPersona:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (-[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID")
    || [v11 containerClass] != (id)14)
  {
    if (([v10 isRemovableSystemApp] & 1) != 0
      || !-[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID"))
    {
      goto LABEL_16;
    }

    if ([v11 containerClass] == (id)14) {
      uint64_t v15 = 3LL;
    }
    else {
      uint64_t v15 = 2LL;
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceManager defaultManager](&OBJC_CLASS___MIAppReferenceManager, "defaultManager"));
    v17 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    id v27 = 0LL;
    v18 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v16,  "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:",  v17,  v15,  -[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID"),  &v27));
    id v19 = v27;

    unsigned __int8 v14 = v18 != 0LL;
    if (v18)
    {
      if ([v18 count])
      {

LABEL_16:
        v26.receiver = self;
        v26.super_class = (Class)&OBJC_CLASS___MIReferenceAwareLSDatabaseGatherer;
        unsigned __int8 v14 = -[MIReferenceAwareLSDatabaseGatherer scanExecutableBundle:inContainer:forPersona:withError:]( &v26,  "scanExecutableBundle:inContainer:forPersona:withError:",  v10,  v11,  v12,  a6);
        goto LABEL_17;
      }

      uint64_t v22 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        -[MIReferenceAwareLSDatabaseGatherer targetUID](self, "targetUID");
        MOLogWrite(v22);
      }
    }

    else
    {
      uint64_t v21 = qword_100095BF8;
      if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 3)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
        MOLogWrite(v21);
      }

      if (a6) {
        *a6 = v19;
      }
    }

    goto LABEL_17;
  }

  uint64_t v13 = qword_100095BF8;
  if (!qword_100095BF8 || *(int *)(qword_100095BF8 + 44) >= 5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
    MOLogWrite(v13);
  }

  unsigned __int8 v14 = 1;
LABEL_17:

  return v14;
}

- (MIReferenceAwareLSDatabaseGatherer)initWithOptions:(unint64_t)a3 forTargetUID:(unsigned int)a4 enumerator:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MIReferenceAwareLSDatabaseGatherer;
  v6 = -[MIReferenceAwareLSDatabaseGatherer initWithOptions:enumerator:](&v9, "initWithOptions:enumerator:", a3, a5);
  v7 = v6;
  if (v6) {
    -[MIReferenceAwareLSDatabaseGatherer setTargetUID:](v6, "setTargetUID:", v5);
  }
  return v7;
}

- (BOOL)performGatherWithError:(id *)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForCurrentUser]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForCurrentUser"));
  [v5 purge];

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](&OBJC_CLASS___MIGlobalConfiguration, "sharedInstance"));
  unsigned __int8 v7 = [v6 isSharediPad];

  if ((v7 & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue( +[MILaunchServicesOperationManager instanceForSystemSharedContent]( &OBJC_CLASS___MILaunchServicesOperationManager,  "instanceForSystemSharedContent"));
    [v8 purge];
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MIReferenceAwareLSDatabaseGatherer;
  return -[MIReferenceAwareLSDatabaseGatherer performGatherWithError:](&v10, "performGatherWithError:", a3);
}

- (unsigned)targetUID
{
  return self->_targetUID;
}

- (void)setTargetUID:(unsigned int)a3
{
  self->_targetUID = a3;
}

@end
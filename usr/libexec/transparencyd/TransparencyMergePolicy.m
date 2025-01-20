@interface TransparencyMergePolicy
- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4;
- (TransparencyMergePolicy)init;
- (void)updateDeviceRecord:(id)a3 withConflictingDevice:(id)a4;
- (void)updateMutation:(id)a3 withConflictingMutation:(id)a4;
- (void)updateTreeHead:(id)a3 withConflictingHead:(id)a4;
@end

@implementation TransparencyMergePolicy

- (TransparencyMergePolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TransparencyMergePolicy;
  return -[TransparencyMergePolicy initWithMergeType:](&v3, "initWithMergeType:", 1LL);
}

- (void)updateTreeHead:(id)a3 withConflictingHead:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 failures]);
  [v5 addFailures:v7];

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);

  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) setSth:v5];
        v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }

    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 failureEvent]);
  [v5 setFailureEvent:v14];

  v15 = (void *)objc_claimAutoreleasedReturnValue([v6 failureEvent]);
  [v15 setSth:v5];

  if ([v5 inclusionVerified] == (id)2) {
    objc_msgSend(v5, "setInclusionVerified:", objc_msgSend(v6, "inclusionVerified"));
  }
  if ([v5 consistencyVerified] == (id)2) {
    objc_msgSend(v5, "setConsistencyVerified:", objc_msgSend(v6, "consistencyVerified"));
  }
  if ([v5 mmdVerified] == (id)2) {
    objc_msgSend(v5, "setMmdVerified:", objc_msgSend(v6, "mmdVerified"));
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 sth]);
  v17 = (void *)objc_claimAutoreleasedReturnValue([v6 sth]);
  unsigned __int8 v18 = [v16 isEqualToData:v17];

  id v19 = [v5 signatureVerified];
  if ((v18 & 1) != 0)
  {
    if (v19 != (id)2) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }

  if (v19 != (id)1 && [v6 signatureVerified] == (id)1)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v6 sth]);
    [v5 setSth:v20];

LABEL_20:
    objc_msgSend(v5, "setSignatureVerified:", objc_msgSend(v6, "signatureVerified"));
  }

- (void)updateDeviceRecord:(id)a3 withConflictingDevice:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 responseTime]);
  [v7 timeIntervalSinceReferenceDate];
  double v9 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v16 request]);
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 responseTime]);
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v12;

  if (v9 > v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v5 loggableData]);
    [v16 setLoggableData:v14];

    v15 = (void *)objc_claimAutoreleasedReturnValue([v5 request]);
    [v16 setRequest:v15];
  }
}

- (void)updateMutation:(id)a3 withConflictingMutation:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 failures]);
  [v5 addFailures:v7];

  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  double v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "failures", 0));
  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 allObjects]);

  id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      double v13 = 0LL;
      do
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v13) setMutation:v5];
        double v13 = (char *)v13 + 1;
      }

      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }

    while (v11);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue([v6 failureEvent]);
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v6 failureEvent]);
    [v5 setFailureEvent:v15];

    id v16 = (void *)objc_claimAutoreleasedReturnValue([v6 failureEvent]);
    [v16 setMutation:v5];
  }

  if ([v5 signatureResult] == (id)2) {
    objc_msgSend(v5, "setSignatureResult:", objc_msgSend(v6, "signatureResult"));
  }
  if ([v5 mergeResult] == (id)2) {
    objc_msgSend(v5, "setMergeResult:", objc_msgSend(v6, "mergeResult"));
  }
}

- (BOOL)resolveConstraintConflicts:(id)a3 error:(id *)a4
{
  __int128 v59 = 0u;
  __int128 v60 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  id obj = a3;
  id v5 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v45 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v60 != v45) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
        double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseObject]);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 entity]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(+[KTTreeHead entity](&OBJC_CLASS___KTTreeHead, "entity"));
        unsigned int v12 = [v10 isKindOfEntity:v11];

        double v13 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseObject]);
        v14 = v13;
        if (v12)
        {
          __int128 v57 = 0u;
          __int128 v58 = 0u;
          __int128 v55 = 0u;
          __int128 v56 = 0u;
          v15 = (void *)objc_claimAutoreleasedReturnValue([v8 conflictingObjects]);
          id v16 = [v15 countByEnumeratingWithState:&v55 objects:v65 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v56;
            do
            {
              for (j = 0LL; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v56 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = *(id *)(*((void *)&v55 + 1) + 8LL * (void)j);
                -[TransparencyMergePolicy updateTreeHead:withConflictingHead:]( self,  "updateTreeHead:withConflictingHead:",  v14,  v20);
                __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v20 managedObjectContext]);
                [v21 deleteObject:v20];
              }

              id v17 = [v15 countByEnumeratingWithState:&v55 objects:v65 count:16];
            }

            while (v17);
          }
        }

        else
        {
          __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v13 entity]);
          __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(+[KTDeviceRecord entity](&OBJC_CLASS___KTDeviceRecord, "entity"));
          unsigned int v24 = [v22 isKindOfEntity:v23];

          v25 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseObject]);
          v14 = v25;
          if (v24)
          {
            __int128 v53 = 0u;
            __int128 v54 = 0u;
            __int128 v51 = 0u;
            __int128 v52 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue([v8 conflictingObjects]);
            id v26 = [v15 countByEnumeratingWithState:&v51 objects:v64 count:16];
            if (v26)
            {
              id v27 = v26;
              uint64_t v28 = *(void *)v52;
              do
              {
                for (k = 0LL; k != v27; k = (char *)k + 1)
                {
                  if (*(void *)v52 != v28) {
                    objc_enumerationMutation(v15);
                  }
                  id v30 = *(id *)(*((void *)&v51 + 1) + 8LL * (void)k);
                  -[TransparencyMergePolicy updateDeviceRecord:withConflictingDevice:]( self,  "updateDeviceRecord:withConflictingDevice:",  v14,  v30);
                  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 managedObjectContext]);
                  [v31 deleteObject:v30];
                }

                id v27 = [v15 countByEnumeratingWithState:&v51 objects:v64 count:16];
              }

              while (v27);
            }
          }

          else
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue([v25 entity]);
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[KTMutation entity](&OBJC_CLASS___KTMutation, "entity"));
            unsigned int v34 = [v32 isKindOfEntity:v33];

            if (!v34) {
              continue;
            }
            v14 = (void *)objc_claimAutoreleasedReturnValue([v8 databaseObject]);
            __int128 v47 = 0u;
            __int128 v48 = 0u;
            __int128 v49 = 0u;
            __int128 v50 = 0u;
            v15 = (void *)objc_claimAutoreleasedReturnValue([v8 conflictingObjects]);
            id v35 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
            if (v35)
            {
              id v36 = v35;
              uint64_t v37 = *(void *)v48;
              do
              {
                for (m = 0LL; m != v36; m = (char *)m + 1)
                {
                  if (*(void *)v48 != v37) {
                    objc_enumerationMutation(v15);
                  }
                  id v39 = *(id *)(*((void *)&v47 + 1) + 8LL * (void)m);
                  -[TransparencyMergePolicy updateMutation:withConflictingMutation:]( self,  "updateMutation:withConflictingMutation:",  v14,  v39);
                  v40 = (void *)objc_claimAutoreleasedReturnValue([v39 managedObjectContext]);
                  [v40 deleteObject:v39];
                }

                id v36 = [v15 countByEnumeratingWithState:&v47 objects:v63 count:16];
              }

              while (v36);
            }
          }
        }
      }

      id v6 = [obj countByEnumeratingWithState:&v59 objects:v66 count:16];
    }

    while (v6);
  }

  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___TransparencyMergePolicy;
  BOOL v41 = -[TransparencyMergePolicy resolveConstraintConflicts:error:](&v46, "resolveConstraintConflicts:error:", obj, a4);

  return v41;
}

@end
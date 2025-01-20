@interface ESAEscrowActivityUpdateResult
- (BOOL)didChange;
- (BOOL)isComplete;
- (BOOL)shouldReap;
- (ESAEscrowActivityUpdateResult)initWithActivity:(id)a3 event:(id)a4 context:(id)a5 totalPreviousOperations:(unint64_t)a6;
- (NSArray)activeOperations;
- (NSArray)reapedOperations;
- (NSArray)updatedOperations;
- (SecureBackupEscrowActivity)activity;
@end

@implementation ESAEscrowActivityUpdateResult

- (ESAEscrowActivityUpdateResult)initWithActivity:(id)a3 event:(id)a4 context:(id)a5 totalPreviousOperations:(unint64_t)a6
{
  id v57 = a3;
  id v58 = a4;
  id v53 = a5;
  v76.receiver = self;
  v76.super_class = (Class)&OBJC_CLASS___ESAEscrowActivityUpdateResult;
  v56 = -[ESAEscrowActivityUpdateResult init](&v76, "init");
  if (v56)
  {
    if (v57) {
      v54 = (SecureBackupEscrowActivity *)[v57 copy];
    }
    else {
      v54 = -[SecureBackupEscrowActivity initWithInitialEvent:context:]( objc_alloc(&OBJC_CLASS___SecureBackupEscrowActivity),  "initWithInitialEvent:context:",  v58,  v53);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue([v57 operations]);
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  (char *)[v10 count] + 1));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    *(_WORD *)&v56->_didChange = 256;
    v56->_shouldReap = 1;
    v75[0] = 0LL;
    v75[1] = v75;
    v75[2] = 0x2020000000LL;
    v75[3] = a6;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472LL;
    v67[2] = sub_100031870;
    v67[3] = &unk_100069A98;
    v55 = v56;
    v68 = v55;
    id v48 = v13;
    id v69 = v48;
    id v15 = v53;
    id v70 = v15;
    v74 = v75;
    id v52 = v14;
    id v71 = v52;
    id v50 = v12;
    id v72 = v50;
    id v51 = v11;
    id v73 = v51;
    v16 = objc_retainBlock(v67);
    if (v58)
    {
      __int128 v65 = 0u;
      __int128 v66 = 0u;
      __int128 v63 = 0u;
      __int128 v64 = 0u;
      v17 = (SecureBackupEscrowOperation *)objc_claimAutoreleasedReturnValue([v57 operations]);
      id v18 = -[SecureBackupEscrowOperation countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v63,  v78,  16LL);
      if (v18)
      {
        uint64_t v19 = *(void *)v64;
LABEL_8:
        uint64_t v20 = 0LL;
        while (1)
        {
          if (*(void *)v64 != v19) {
            objc_enumerationMutation(v17);
          }
          v21 = *(void **)(*((void *)&v63 + 1) + 8 * v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "operationId", v48));
          v23 = (void *)objc_claimAutoreleasedReturnValue([v21 id]);
          unsigned __int8 v24 = [v22 isEqual:v23];

          if ((v24 & 1) != 0) {
            break;
          }
          if (v18 == (id)++v20)
          {
            id v18 = -[SecureBackupEscrowOperation countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v63,  v78,  16LL);
            if (v18) {
              goto LABEL_8;
            }
            goto LABEL_14;
          }
        }
      }

      else
      {
LABEL_14:

        v17 = -[SecureBackupEscrowOperation initWithEvent:parentActivity:context:]( objc_alloc(&OBJC_CLASS___SecureBackupEscrowOperation),  "initWithEvent:parentActivity:context:",  v58,  v57,  v15);
        ((void (*)(void *, void, SecureBackupEscrowOperation *))v16[2])(v16, 0LL, v17);
      }
    }

    __int128 v61 = 0u;
    __int128 v62 = 0u;
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "operations", v48));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 reverseObjectEnumerator]);

    id v27 = [v26 countByEnumeratingWithState:&v59 objects:v77 count:16];
    if (v27)
    {
      uint64_t v28 = *(void *)v60;
      do
      {
        for (i = 0LL; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v60 != v28) {
            objc_enumerationMutation(v26);
          }
          v30 = *(void **)(*((void *)&v59 + 1) + 8LL * (void)i);
          if (v58
            && (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v59 + 1)
                                                                                   + 8LL * (void)i), "id")),
                v32 = (void *)objc_claimAutoreleasedReturnValue([v58 operationId]),
                unsigned int v33 = [v31 isEqual:v32],
                v32,
                v31,
                v33))
          {
            uint64_t v34 = objc_claimAutoreleasedReturnValue([v30 updatedOperationWithAdditionalEvent:v58 parentActivity:v57 context:v15]);
          }

          else
          {
            uint64_t v34 = objc_claimAutoreleasedReturnValue([v30 updatedOperationWithParentActivity:v57 context:v15]);
          }

          v35 = (void *)v34;
          ((void (*)(void *, void *, uint64_t))v16[2])(v16, v30, v34);
        }

        id v27 = [v26 countByEnumeratingWithState:&v59 objects:v77 count:16];
      }

      while (v27);
    }

    if ([v51 count])
    {
      id v36 = [v51 copy];
      -[SecureBackupEscrowActivity setOperations:](v54, "setOperations:", v36);
    }

    else
    {
      id v37 = [v52 copy];
      -[SecureBackupEscrowActivity setOperations:](v54, "setOperations:", v37);

      v56->_shouldReap = 1;
    }

    v38 = (NSArray *)[v50 copy];
    activeOperations = v55->_activeOperations;
    v55->_activeOperations = v38;

    v40 = (NSArray *)[v49 copy];
    updatedOperations = v55->_updatedOperations;
    v55->_updatedOperations = v40;

    v42 = (NSArray *)[v52 copy];
    reapedOperations = v55->_reapedOperations;
    v55->_reapedOperations = v42;

    -[SecureBackupEscrowActivity setAllOperationsComplete:](v54, "setAllOperationsComplete:", v56->_isComplete);
    -[SecureBackupEscrowActivity setSomeOperationsReaped:]( v54,  "setSomeOperationsReaped:",  [v52 count] != 0);
    activity = v55->_activity;
    v55->_activity = v54;
    v45 = v54;

    v46 = v55;
    _Block_object_dispose(v75, 8);
  }

  return v56;
}

- (SecureBackupEscrowActivity)activity
{
  return self->_activity;
}

- (BOOL)didChange
{
  return self->_didChange;
}

- (BOOL)isComplete
{
  return self->_isComplete;
}

- (BOOL)shouldReap
{
  return self->_shouldReap;
}

- (NSArray)activeOperations
{
  return self->_activeOperations;
}

- (NSArray)updatedOperations
{
  return self->_updatedOperations;
}

- (NSArray)reapedOperations
{
  return self->_reapedOperations;
}

- (void).cxx_destruct
{
}

@end
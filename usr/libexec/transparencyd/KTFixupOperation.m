@interface KTFixupOperation
- (KTFixupOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (KTOperationDependencies)deps;
- (KTStateString)errorState;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (NSOperation)finishedOp;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setErrorState:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setIntendedState:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation KTFixupOperation

- (KTFixupOperation)initWithDependenics:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___KTFixupOperation;
  v11 = -[KTGroupOperation init](&v15, "init");
  v12 = v11;
  if (v11)
  {
    -[KTFixupOperation setDeps:](v11, "setDeps:", v8);
    -[KTFixupOperation setErrorState:](v12, "setErrorState:", v10);
    -[KTFixupOperation setIntendedState:](v12, "setIntendedState:", v9);
    v13 = v12;
  }

  return v12;
}

- (void)groupStart
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation intendedState](self, "intendedState"));
  -[KTFixupOperation setNextState:](self, "setNextState:", v3);

  v4 = objc_alloc_init(&OBJC_CLASS___NSOperation);
  -[KTFixupOperation setFinishedOp:](self, "setFinishedOp:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
  -[KTGroupOperation dependOnBeforeGroupFinished:](self, "dependOnBeforeGroupFinished:", v5);

  v47[0] = objc_opt_class(&OBJC_CLASS____TtC13transparencyd25KTFixupRegistrationUpload, v6);
  v47[1] = objc_opt_class(&OBJC_CLASS____TtC13transparencyd31KTFixupRemoveMacAppSupportFiles, v7);
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v47, 2LL));
  id v8 = 0LL;
  id v10 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v42;
    *(void *)&__int128 v11 = 138412290LL;
    __int128 v35 = v11;
    while (2)
    {
      v13 = 0LL;
      do
      {
        if (*(void *)v42 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v41 + 1) + 8LL * (void)v13);
        id v15 = objc_msgSend((id)objc_opt_class(v14, v9), "fixupName");
        v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation deps](self, "deps"));
        v18 = (void *)objc_claimAutoreleasedReturnValue([v17 smDataStore]);
        unsigned int v19 = [v18 haveDoneFixup:v16];

        if (v19)
        {
          if (qword_1002E63B0 != -1) {
            dispatch_once(&qword_1002E63B0, &stru_100276B90);
          }
          v21 = (os_log_s *)qword_1002E63B8;
          if (os_log_type_enabled((os_log_t)qword_1002E63B8, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v35;
            *(void *)&buf[4] = v16;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Already performed fixup %@", buf, 0xCu);
          }
        }

        else
        {
          id v22 = objc_alloc((Class)objc_opt_class(v14, v20));
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation deps](self, "deps"));
          id v24 = [v22 initWithDependencies:v23];

          if (!v24)
          {
            if (qword_1002E63B0 != -1) {
              dispatch_once(&qword_1002E63B0, &stru_100276BB0);
            }
            v33 = (os_log_s *)qword_1002E63B8;
            if (os_log_type_enabled((os_log_t)qword_1002E63B8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v35;
              *(void *)&buf[4] = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "Failed to create fixup operation %@",  buf,  0xCu);
            }

            v34 = obj;
            goto LABEL_33;
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue([v24 doFixupOperation]);
          v26 = v25;
          if (v25)
          {
            if (v8) {
              [v25 addDependency:v8];
            }
            *(void *)buf = 0LL;
            objc_initWeak((id *)buf, self);
            v37[0] = _NSConcreteStackBlock;
            v37[1] = 3221225472LL;
            v37[2] = sub_10000A208;
            v37[3] = &unk_100276C18;
            objc_copyWeak(&v40, (id *)buf);
            id v38 = v16;
            id v27 = v26;
            id v39 = v27;
            id v28 = (id)objc_claimAutoreleasedReturnValue( +[NSBlockOperation blockOperationWithBlock:]( &OBJC_CLASS___NSBlockOperation,  "blockOperationWithBlock:",  v37));

            [v28 addDependency:v27];
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
            [v29 addOperation:v27];

            v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue"));
            [v30 addOperation:v28];

            objc_destroyWeak(&v40);
            objc_destroyWeak((id *)buf);

            id v8 = v28;
          }

          else
          {
            if (qword_1002E63B0 != -1) {
              dispatch_once(&qword_1002E63B0, &stru_100276BD0);
            }
            v31 = (os_log_s *)qword_1002E63B8;
            if (os_log_type_enabled((os_log_t)qword_1002E63B8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v35;
              *(void *)&buf[4] = v16;
              _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_INFO,  "Fixup %@ can't run right now, skipping for now",  buf,  0xCu);
            }
          }
        }

        v13 = (char *)v13 + 1;
      }

      while (v10 != v13);
      id v10 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    if (v8)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
      [v32 addDependency:v8];
      goto LABEL_31;
    }
  }

  else
  {
    v32 = obj;
LABEL_31:
  }

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[KTGroupOperation operationQueue](self, "operationQueue", v35));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTFixupOperation finishedOp](self, "finishedOp"));
  [v34 addOperation:v16];
LABEL_33:
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setIntendedState:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (KTStateString)errorState
{
  return (KTStateString *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setErrorState:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
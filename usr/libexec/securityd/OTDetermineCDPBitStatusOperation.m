@interface OTDetermineCDPBitStatusOperation
- (OTDetermineCDPBitStatusOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation OTDetermineCDPBitStatusOperation

- (OTDetermineCDPBitStatusOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___OTDetermineCDPBitStatusOperation;
  v12 = -[CKKSGroupOperation init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->super._queue, a3);
    objc_storeStrong((id *)&v13->super._startOperation, a4);
    objc_storeStrong((id *)&v13->super._finishOperation, a5);
  }

  return v13;
}

- (void)groupStart
{
  v3 = sub_10001267C("octagon-cdp-status");
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Checking CDP status", (uint8_t *)&buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 stateHolder]);
  id v36 = 0LL;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 loadOrCreateAccountMetadata:&v36]);
  id v8 = v36;

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 lockStateTracker]);
    unsigned int v11 = [v10 isLockedError:v8];

    v12 = sub_10001267C("octagon-cdp-status");
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v14)
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Device is locked! restarting on unlock",  (uint8_t *)&buf,  2u);
      }

      -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", @"WaitForClassCUnlock");
      -[CKKSResultOperation setError:](self, "setError:", v8);
    }

    else
    {
      if (v14)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Failed to load account metadata: %@",  (uint8_t *)&buf,  0xCu);
      }

      -[CKKSResultOperation setError:](self, "setError:", v8);
    }
  }

  else
  {
    objc_super v15 = sub_10001267C("octagon-cdp-status");
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = [v7 cdpState];
      if (v17 >= 3) {
        v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"(unknown: %i)",  v17));
      }
      else {
        v18 = *(&off_1002841F8 + v17);
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CDP is %@", (uint8_t *)&buf, 0xCu);
    }

    if ([v7 cdpState] == 2)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation intendedState](self, "intendedState"));
      -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", v19);
    }

    else
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v40 = 0x2020000000LL;
      int v41 = 0;
      id location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
      v21 = (void *)objc_claimAutoreleasedReturnValue([v20 cuttlefishXPCWrapper]);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 activeAccount]);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      v33[2] = sub_100058B7C;
      v33[3] = &unk_1002841D8;
      objc_copyWeak(&v34, &location);
      v33[4] = &buf;
      [v21 trustStatusWithSpecificUser:v23 reply:v33];

      unsigned int v24 = [v7 cdpState];
      if (v24 != *(_DWORD *)(*((void *)&buf + 1) + 24LL))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation deps](self, "deps"));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 stateHolder]);
        id v31 = 0LL;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472LL;
        v32[2] = sub_100058F84;
        v32[3] = &unk_100285640;
        v32[4] = &buf;
        [v26 persistAccountChanges:v32 error:&v31];
        id v27 = v31;

        if (v27)
        {
          v28 = sub_10001267C("octagon-cdp-status");
          v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v37 = 138412290;
            id v38 = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "Failed to load account metadata: %@",  v37,  0xCu);
          }

          -[CKKSResultOperation setError:](self, "setError:", v27);
        }

        unsigned int v24 = *(_DWORD *)(*((void *)&buf + 1) + 24LL);
      }

      if (v24 == 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[OTDetermineCDPBitStatusOperation intendedState](self, "intendedState"));
        -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", v30);
      }

      else
      {
        -[OTDetermineCDPBitStatusOperation setNextState:](self, "setNextState:", @"WaitForCDP");
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&location);
      _Block_object_dispose(&buf, 8);
    }
  }
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128LL, 1);
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136LL, 1);
}

- (void)setNextState:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 144LL, 1);
}

- (void)setDeps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
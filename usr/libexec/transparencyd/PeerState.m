@interface PeerState
+ (id)fetchRequest;
- (BOOL)isFailureIgnoredForDate:(id)a3;
- (BOOL)isFailureResolvedAndSeenByDate:(id)a3;
- (BOOL)setCompletedVerification:(id)a3;
- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4;
- (BOOL)updateResultWithStaticKey:(id)a3 staticKeyStore:(id)a4 forDate:(id)a5;
- (TransparencyManagedDataStore)dataStore;
- (id)verificationWithinTTLOfDate:(id)a3;
- (id)verifierResultWithStaticKeyStore:(id)a3;
- (unint64_t)bestVerificationResultToUIStatusForDate:(id)a3;
- (unint64_t)getUIStatusForDate:(id)a3;
- (unint64_t)getUnsigned:(SEL)a3;
- (void)setDataStore:(id)a3;
@end

@implementation PeerState

- (BOOL)setCompletedVerification:(id)a3
{
  id v4 = a3;
  if ([v4 verificationResult] == (id)1)
  {
    uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    if (!v5) {
      goto LABEL_4;
    }
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 idsResponseTime]);
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 idsResponseTime]);
    id v10 = [v8 compare:v9];

    if (v10 == (id)-1LL)
    {
LABEL_4:
      -[PeerState setMostRecentSuccess:](self, "setMostRecentSuccess:", v4);
LABEL_11:
      BOOL v11 = 1;
      goto LABEL_12;
    }
  }

  else
  {
    if ([v4 verificationResult])
    {
      BOOL v11 = 0;
      goto LABEL_15;
    }

    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    if (!v12) {
      goto LABEL_10;
    }
    v13 = (void *)v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 idsResponseTime]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v4 idsResponseTime]);
    id v17 = [v15 compare:v16];

    if (v17 == (id)-1LL)
    {
LABEL_10:
      -[PeerState setFailure:](self, "setFailure:", v4);
      -[PeerState setSeenDate:](self, "setSeenDate:", 0LL);
      goto LABEL_11;
    }
  }

  BOOL v11 = 0;
LABEL_12:
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentCompleted](self, "mostRecentCompleted"));
  if (!v18) {
    goto LABEL_14;
  }
  v19 = (void *)v18;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentCompleted](self, "mostRecentCompleted"));
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 idsResponseTime]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v4 idsResponseTime]);
  id v23 = [v21 compare:v22];

  if (v23 == (id)-1LL)
  {
LABEL_14:
    -[PeerState setMostRecentCompleted:](self, "setMostRecentCompleted:", v4);
    BOOL v11 = 1;
  }

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getAssociatedObject(self, @"dataStore");
}

- (void)setDataStore:(id)a3
{
}

- (unint64_t)bestVerificationResultToUIStatusForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState verificationWithinTTLOfDate:](self, "verificationWithinTTLOfDate:", v4));
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 getUnsigned:"verificationResult"];
    if (v7 == (id)3)
    {
      unint64_t v8 = 8LL;
      goto LABEL_23;
    }

    if (v7 != (id)2)
    {
      if (v7)
      {
        unint64_t v8 = 4LL;
      }

      else if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4))
      {
        unint64_t v8 = 8LL;
      }

      else
      {
        unint64_t v8 = 6LL;
      }

      goto LABEL_23;
    }

    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277290);
    }
    uint64_t v12 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v15 = (void *)objc_claimAutoreleasedReturnValue([v6 verificationId]);
      int v30 = 138412546;
      v31 = v14;
      __int16 v32 = 2114;
      v33 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ most recent verification %{public}@ pending",  (uint8_t *)&v30,  0x16u);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue([v6 creationTime]);
    [v16 timeIntervalSinceDate:v4];
    double v18 = v17;
    +[TransparencySettings queryJustMadeTimeout](&OBJC_CLASS___TransparencySettings, "queryJustMadeTimeout");
    double v20 = -v19;

    if (v18 > v20)
    {
      +[TransparencySettings queryJustMadeTimeout](&OBJC_CLASS___TransparencySettings, "queryJustMadeTimeout");
      double v22 = v21;
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v6 creationTime]);
      [v23 timeIntervalSinceDate:v4];
      double v25 = v22 + v24;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState dataStore](self, "dataStore"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
      [v26 recalculateVerifierResultForPeer:v27 application:v28 after:v25];

      unint64_t v8 = 3LL;
      goto LABEL_23;
    }
  }

  else
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277270);
    }
    v9 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      int v30 = 138412290;
      v31 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ no verification within 7 days",  (uint8_t *)&v30,  0xCu);
    }
  }

  if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4)) {
    unint64_t v8 = 12LL;
  }
  else {
    unint64_t v8 = 0LL;
  }
LABEL_23:

  return v8;
}

- (unint64_t)getUIStatusForDate:(id)a3
{
  id v4 = a3;
  if ((-[PeerState everCompletedVerification](self, "everCompletedVerification") & 1) != 0)
  {
    if ((-[PeerState optedIn](self, "optedIn") & 1) != 0)
    {
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));

      if (!v5)
      {
LABEL_14:
        unint64_t v16 = -[PeerState bestVerificationResultToUIStatusForDate:]( self,  "bestVerificationResultToUIStatusForDate:",  v4);
        goto LABEL_36;
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
      id v7 = [v6 verificationResult];

      if (v7)
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_1002772D0);
        }
        unint64_t v8 = (void *)qword_1002E6418;
        if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
        {
          v9 = v8;
          id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
          BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          int v29 = 138413058;
          int v30 = v10;
          __int16 v31 = 2112;
          __int16 v32 = v11;
          __int16 v33 = 2048;
          id v34 = [v12 verificationResult];
          __int16 v35 = 2048;
          uint64_t v36 = 0LL;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "There is a failed verification saved for peer (%@, %@) with verification result %lld. We only expect this va lue to be %lu. This may lead to issues later.",  (uint8_t *)&v29,  0x2Au);
        }
      }

      if (-[PeerState isFailureResolvedAndSeenByDate:](self, "isFailureResolvedAndSeenByDate:", v4))
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_1002772F0);
        }
        v13 = (void *)qword_1002E6418;
        if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_INFO))
        {
          v14 = v13;
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          int v29 = 138412290;
          int v30 = v15;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "getUIStatusForDate failure is resolved and seen (%@)",  (uint8_t *)&v29,  0xCu);
        }

        goto LABEL_14;
      }

      if (-[PeerState isFailureIgnoredForDate:](self, "isFailureIgnoredForDate:", v4))
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_100277310);
        }
        double v22 = (void *)qword_1002E6418;
        if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_INFO))
        {
          id v23 = v22;
          double v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          int v29 = 138412290;
          int v30 = v24;
          _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_INFO,  "getUIStatusForDate failure is ignored (%@)",  (uint8_t *)&v29,  0xCu);
        }

        unint64_t v16 = 8LL;
      }

      else
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_100277330);
        }
        double v25 = (void *)qword_1002E6418;
        if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_INFO))
        {
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
          int v29 = 138412290;
          int v30 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_INFO,  "getUIStatusForDate PeerState failure (%@)",  (uint8_t *)&v29,  0xCu);
        }

        unint64_t v16 = 6LL;
      }
    }

    else if (-[PeerState everOptedIn](self, "everOptedIn"))
    {
      else {
        unint64_t v16 = 10LL;
      }
    }

    else
    {
      unint64_t v16 = 2LL;
    }
  }

  else
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_1002772B0);
    }
    double v17 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
    {
      double v18 = v17;
      double v19 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
      unint64_t v16 = 3LL;
      uint64_t String = KTUIStatusGetString(3LL);
      double v21 = (void *)objc_claimAutoreleasedReturnValue(String);
      int v29 = 138412546;
      int v30 = v19;
      __int16 v31 = 2114;
      __int16 v32 = v21;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ -> %{public}@ never completed verification",  (uint8_t *)&v29,  0x16u);
    }

    else
    {
      unint64_t v16 = 3LL;
    }
  }

- (id)verificationWithinTTLOfDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 creationTime]);
    [v4 timeIntervalSinceDate:v7];
    double v9 = v8;

    +[TransparencySettings queryCacheHardTimeout](&OBJC_CLASS___TransparencySettings, "queryCacheHardTimeout");
    if (v9 < v10)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentSuccess](self, "mostRecentSuccess"));
LABEL_8:
      double v17 = (void *)v18;
      goto LABEL_9;
    }
  }

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 creationTime]);
    [v4 timeIntervalSinceDate:v13];
    double v15 = v14;

    +[TransparencySettings queryCacheHardTimeout](&OBJC_CLASS___TransparencySettings, "queryCacheHardTimeout");
    if (v15 < v16)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
      goto LABEL_8;
    }
  }

  double v17 = 0LL;
LABEL_9:

  return v17;
}

- (BOOL)isFailureResolvedAndSeenByDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));

  if (!v5)
  {
    BOOL v12 = 1;
    goto LABEL_30;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v7 creationTime]);
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
    double v10 = (void *)objc_claimAutoreleasedReturnValue([v9 creationTime]);
    id v11 = [v8 compare:v10];

    if (v11 == (id)-1LL)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
      double v14 = (void *)objc_claimAutoreleasedReturnValue([v13 creationTime]);
      double v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kt_toISO_8601_UTCString"));

      if ((+[TransparencyAnalytics hasInternalDiagnostics]( &OBJC_CLASS___TransparencyAnalytics,  "hasInternalDiagnostics") & 1) == 0)
      {
        double v16 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        double v17 = (void *)objc_claimAutoreleasedReturnValue([v16 creationTime]);
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "kt_fuzzyDate"));
        uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "kt_toISO_8601_UTCString"));

        double v15 = (void *)v19;
      }

      double v20 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));

      if (v20)
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_100277350);
        }
        double v21 = (void *)qword_1002E6418;
        if (!os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_28;
        }
        double v22 = v21;
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        double v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 verificationId]);
        int v48 = 138412802;
        v49 = v23;
        __int16 v50 = 2114;
        v51 = v25;
        __int16 v52 = 2114;
        v53 = v15;
        v26 = "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) ignored";
        goto LABEL_13;
      }

      if (-[PeerState optedIn](self, "optedIn"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        if ([v27 optedIn])
        {
        }

        else
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
          id v29 = [v28 verificationResult];

          if (v29 == (id)1)
          {
            if (qword_1002E6410 != -1) {
              dispatch_once(&qword_1002E6410, &stru_100277370);
            }
            int v30 = (void *)qword_1002E6418;
            if (!os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_28;
            }
            double v22 = v30;
            id v23 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
            double v24 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
            double v25 = (void *)objc_claimAutoreleasedReturnValue([v24 verificationId]);
            int v48 = 138412802;
            v49 = v23;
            __int16 v50 = 2114;
            v51 = v25;
            __int16 v52 = 2114;
            v53 = v15;
            v26 = "PeerStateCaculated: %{mash.hash}@ resolved failure %{public}@ from before opt-in (%{public}@)";
LABEL_13:
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v48, 0x20u);

LABEL_28:
            BOOL v12 = 1;
LABEL_29:

            goto LABEL_30;
          }
        }
      }

      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));

      if (v31)
      {
        __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));
        [v4 timeIntervalSinceDate:v32];
        double v34 = v33;

        +[TransparencySettings dismissFailureAfterSeenPeriod]( &OBJC_CLASS___TransparencySettings,  "dismissFailureAfterSeenPeriod");
        if (v34 >= v35) {
          goto LABEL_28;
        }
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_1002773B0);
        }
        uint64_t v36 = (void *)qword_1002E6418;
        BOOL v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        v37 = v36;
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v40 = (void *)objc_claimAutoreleasedReturnValue([v39 verificationId]);
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState seenDate](self, "seenDate"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "kt_toISO_8601_UTCString"));
        int v48 = 138413058;
        v49 = v38;
        __int16 v50 = 2114;
        v51 = v40;
        __int16 v52 = 2114;
        v53 = v15;
        __int16 v54 = 2112;
        v55 = v42;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) not seen for 1h (%@)",  (uint8_t *)&v48,  0x2Au);
      }

      else
      {
        if (qword_1002E6410 != -1) {
          dispatch_once(&qword_1002E6410, &stru_100277390);
        }
        v44 = (void *)qword_1002E6418;
        BOOL v12 = 0;
        if (!os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_29;
        }
        v37 = v44;
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState failure](self, "failure"));
        v47 = (void *)objc_claimAutoreleasedReturnValue([v46 verificationId]);
        int v48 = 138412802;
        v49 = v45;
        __int16 v50 = 2114;
        v51 = v47;
        __int16 v52 = 2114;
        v53 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ resolved failure %{public}@ (%{public}@) never seen",  (uint8_t *)&v48,  0x20u);
      }

      BOOL v12 = 0;
      goto LABEL_29;
    }
  }

  BOOL v12 = 0;
LABEL_30:

  return v12;
}

- (BOOL)isFailureIgnoredForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState ignoredFailureExpiry](self, "ignoredFailureExpiry"));
    [v6 timeIntervalSinceDate:v4];
    double v8 = v7;

    if (v8 <= 0.0)
    {
      if (qword_1002E6410 != -1) {
        dispatch_once(&qword_1002E6410, &stru_1002773D0);
      }
      double v9 = (void *)qword_1002E6418;
      if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_DEFAULT))
      {
        double v10 = v9;
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
        int v14 = 138412290;
        double v15 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "PeerStateCalculator: %{mash.hash}@ failure ignore expired",  (uint8_t *)&v14,  0xCu);
      }
    }

    BOOL v12 = v8 > 0.0;
  }

  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)updateResultWithStaticKey:(id)a3 staticKeyStore:(id)a4 forDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 publicID]);

  if (!v11)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_1002773F0);
    }
    double v21 = (void *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      double v22 = v21;
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v8 uri]);
      *(_DWORD *)buf = 141558274;
      uint64_t v35 = 1752392040LL;
      __int16 v36 = 2112;
      v37 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "veriferResultForPeer static key: no public id for %{mask.hash}@",  buf,  0x16u);
    }

    goto LABEL_26;
  }

  if (!v9)
  {
    if (qword_1002E6410 != -1) {
      dispatch_once(&qword_1002E6410, &stru_100277410);
    }
    double v24 = (os_log_s *)qword_1002E6418;
    if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "veriferResultForPeer static key: no static key store",  buf,  2u);
    }

- (id)verifierResultWithStaticKeyStore:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc(&OBJC_CLASS___KTVerifierResult);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState uri](self, "uri"));
  double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState application](self, "application"));
  id v8 = -[KTVerifierResult initWithUri:application:](v5, "initWithUri:application:", v6, v7);

  -[KTVerifierResult setOptedIn:](v8, "setOptedIn:", -[PeerState optedIn](self, "optedIn"));
  -[KTVerifierResult setEverOptedIn:](v8, "setEverOptedIn:", -[PeerState everOptedIn](self, "everOptedIn"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PeerState mostRecentVerification](self, "mostRecentVerification"));
  id v10 = v9;
  if (v9)
  {
    -[KTVerifierResult setSucceed:](v8, "setSucceed:", [v9 getUnsigned:"verificationResult"]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accountKey]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:error:]( &OBJC_CLASS___KTAccountPublicID,  "ktAccountPublicIDWithPublicKeyInfo:error:",  v11,  0LL));
    -[KTVerifierResult setPublicID:](v8, "setPublicID:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serverLoggableDatas]);
    int v14 = (void *)objc_claimAutoreleasedReturnValue([v13 loggableDatas]);
    -[KTVerifierResult setLoggableDatas:](v8, "setLoggableDatas:", v14);

    double v15 = (void *)objc_claimAutoreleasedReturnValue([v10 failure]);
    -[KTVerifierResult setFailure:](v8, "setFailure:", v15);

    -[KTVerifierResult setStaticAccountKeyStatus:]( v8,  "setStaticAccountKeyStatus:",  [v10 getUnsigned:"staticKeyStatus"]);
  }

  else
  {
    -[KTVerifierResult setSucceed:](v8, "setSucceed:", 2LL);
  }

  double v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
  -[KTVerifierResult setUiStatus:]( v8,  "setUiStatus:",  -[PeerState getUIStatusForDate:](self, "getUIStatusForDate:", v16));
  if (qword_1002E6410 != -1) {
    dispatch_once(&qword_1002E6410, &stru_100277450);
  }
  unint64_t v17 = (void *)qword_1002E6418;
  if (os_log_type_enabled((os_log_t)qword_1002E6418, OS_LOG_TYPE_INFO))
  {
    id v18 = v17;
    uint64_t String = KTUIStatusGetString(-[KTVerifierResult uiStatus](v8, "uiStatus"));
    double v20 = (void *)objc_claimAutoreleasedReturnValue(String);
    int v23 = 138412290;
    double v24 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "verifierResultWithStaticKeyStore setting UI status to %@",  (uint8_t *)&v23,  0xCu);
  }

  if (-[PeerState updateResultWithStaticKey:staticKeyStore:forDate:]( self,  "updateResultWithStaticKey:staticKeyStore:forDate:",  v8,  v4,  v16))
  {
    uint64_t v21 = objc_claimAutoreleasedReturnValue(-[PeerState verifierResultWithStaticKeyStore:](self, "verifierResultWithStaticKeyStore:", v4));

    id v8 = (KTVerifierResult *)v21;
  }

  return v8;
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001D6330(self, a3);
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:]( &OBJC_CLASS___NSFetchRequest,  "fetchRequestWithEntityName:",  @"PeerState");
}

@end
@interface FAEligibilityEvaluator
- (BOOL)_isCapableOfRecomendingMembers;
- (FAEligibilityEvaluator)initWithQueue:(id)a3 requirements:(id)a4;
- (id)_mediaAltDSID;
- (id)_recommendedMembers;
- (void)_unsafeFetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5;
@end

@implementation FAEligibilityEvaluator

- (FAEligibilityEvaluator)initWithQueue:(id)a3 requirements:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___FAEligibilityEvaluator;
  v9 = -[FAEligibilityEvaluator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_requirements, a4);
  }

  return v10;
}

- (void)fetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = (dispatch_queue_s *)self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10001A830;
  v15[3] = &unk_1000419F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)_unsafeFetchEligibilityForPropertyName:(id)a3 bundleID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, void))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue( -[FAEligibilityRequirements requirementsForPropertyName:]( self->_requirements,  "requirementsForPropertyName:",  v8));
  id v13 = v11;
  if (v11)
  {
    id v14 = [v11 serverEligibility];
    int v15 = (int)v14;
    uint64_t v17 = _FALogSystem(v14, v16);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v13 serverEligibility];
      v20 = @"NO";
      *(_DWORD *)v56 = 138412802;
      if (v19) {
        v20 = @"YES";
      }
      *(void *)&v56[4] = v20;
      __int16 v57 = 2112;
      id v58 = v8;
      __int16 v59 = 2112;
      id v60 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "serverEligibility: %@, propertyName: %@, bundleID: %@",  v56,  0x20u);
    }

    v21 = (void *)objc_claimAutoreleasedReturnValue([v13 activeBundleIDs]);
    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v13 activeBundleIDs]);
      unsigned int v23 = [v22 containsObject:v9];

      v15 &= v23;
      uint64_t v26 = _FALogSystem(v24, v25);
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        if (v23) {
          v28 = @"YES";
        }
        else {
          v28 = @"NO";
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeBundleIDs", *(void *)v56));
        *(_DWORD *)v56 = 138413058;
        *(void *)&v56[4] = v28;
        __int16 v57 = 2112;
        id v58 = v8;
        __int16 v59 = 2112;
        id v60 = v9;
        __int16 v61 = 2112;
        v62 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "bundleID found: %@, propertyName: %@, bundleID: %@, eligibleApps: %@",  v56,  0x2Au);
      }
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "expectedMediaAltDSID", *(void *)v56));

    if (v30)
    {
      uint64_t v31 = objc_claimAutoreleasedReturnValue(-[FAEligibilityEvaluator _mediaAltDSID](self, "_mediaAltDSID"));
      v33 = (void *)v31;
      if (v15)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue([v13 expectedMediaAltDSID]);
        LOBYTE(v15) = [v34 isEqualToString:v33];
      }

      uint64_t v35 = _FALogSystem(v31, v32);
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue([v13 expectedMediaAltDSID]);
        *(_DWORD *)v56 = 138413058;
        *(void *)&v56[4] = v33;
        __int16 v57 = 2112;
        id v58 = v8;
        __int16 v59 = 2112;
        id v60 = v9;
        __int16 v61 = 2112;
        v62 = v37;
        _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "found mediaAltDSID: %@, propertyName: %@, bundleID: %@, expectedMediaAltDSID: %@",  v56,  0x2Au);
      }
    }

    id v38 = [v13 hasRecommendedMembers];
    if ((_DWORD)v38)
    {
      BOOL v40 = -[FAEligibilityEvaluator _isCapableOfRecomendingMembers](self, "_isCapableOfRecomendingMembers");
      if (!v40)
      {
        uint64_t v54 = _FALogSystem(v40, v41);
        v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v56 = 138412546;
          *(void *)&v56[4] = v8;
          __int16 v57 = 2112;
          id v58 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "wantsFamilyMemberRecommendations: YES, recommendationCapable: NO, propertyName: %@, bundleID: %@",  v56,  0x16u);
        }

        goto LABEL_38;
      }

      v42 = (void *)objc_claimAutoreleasedReturnValue(-[FAEligibilityEvaluator _recommendedMembers](self, "_recommendedMembers"));
      id v43 = [v42 count];

      else {
        char v46 = 0;
      }
      uint64_t v47 = _FALogSystem(v44, v45);
      v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 134218498;
        *(void *)&v56[4] = v43;
        __int16 v57 = 2112;
        id v58 = v8;
        __int16 v59 = 2112;
        id v60 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "wantsFamilyMemberRecommendations: YES, recommendationCapable: YES, recommendedMemberCount: %ld, propertyName: %@, bundleID: %@",  v56,  0x20u);
      }

      if ((v46 & 1) == 0)
      {
LABEL_38:
        uint64_t v51 = 1LL;
        goto LABEL_39;
      }
    }

    else
    {
      uint64_t v52 = _FALogSystem(v38, v39);
      v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v56 = 138412546;
        *(void *)&v56[4] = v8;
        __int16 v57 = 2112;
        id v58 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "wantsFamilyMemberRecommendations: NO, propertyName: %@, bundleID: %@",  v56,  0x16u);
      }

      if ((v15 & 1) == 0) {
        goto LABEL_38;
      }
    }

    uint64_t v51 = 2LL;
  }

  else
  {
    uint64_t v49 = _FALogSystem(0LL, v12);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v56 = 138412546;
      *(void *)&v56[4] = v8;
      __int16 v57 = 2112;
      id v58 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "no eligibility information for propertyName: %@, bundleID: %@",  v56,  0x16u);
    }

    uint64_t v51 = 0LL;
  }

- (id)_mediaAltDSID
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "ams_activeiTunesAccount"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "ams_altDSID"));
  return v4;
}

- (id)_recommendedMembers
{
  id v2 = objc_alloc_init(&OBJC_CLASS___FAInviteSuggestions);
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 fetchFamilyMemberSuggestions:&v8]);
  uint64_t v5 = _FALogSystem(v3, v4);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[FAEligibilityEvaluator _recommendedMembers]";
    __int16 v11 = 2048;
    uint64_t v12 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: used proactive model %lu for invite suggestions",  buf,  0x16u);
  }

  return v3;
}

- (BOOL)_isCapableOfRecomendingMembers
{
  return 0;
}

- (void).cxx_destruct
{
}

@end
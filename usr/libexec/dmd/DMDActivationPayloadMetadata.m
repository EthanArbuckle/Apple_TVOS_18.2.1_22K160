@interface DMDActivationPayloadMetadata
+ (id)fetchRequestForActivationsFromOrganizationWithIdentifier:(id)a3;
- (void)updateStateDictionaryIfNeeded;
@end

@implementation DMDActivationPayloadMetadata

- (void)updateStateDictionaryIfNeeded
{
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[DMDPayloadMetadata status](self, "status"));
  v41 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v43 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v42 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  v37 = self;
  id obj = (id)objc_claimAutoreleasedReturnValue( -[DMDActivationPayloadMetadata outgoingPayloadMetadataReferences]( self,  "outgoingPayloadMetadataReferences"));
  id v3 = [obj countByEnumeratingWithState:&v45 objects:v61 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v46;
    uint64_t v38 = DMFDeclarationPayloadServerHashKey;
    uint64_t v39 = DMFDeclarationPayloadIdentifierKey;
    char v6 = 1;
    p_cache = &OBJC_CLASS___CEMImageAssetInstallMetadata.cache;
    char v8 = 1;
    uint64_t v40 = *(void *)v46;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v46 != v5) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)i);
        uint64_t v11 = objc_opt_class(p_cache + 448);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
        {
          v59[0] = v39;
          v12 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          v59[1] = v38;
          v60[0] = v12;
          v13 = (void *)objc_claimAutoreleasedReturnValue([v10 serverHash]);
          v60[1] = v13;
          v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v60,  v59,  2LL));
          v15 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          -[NSMutableDictionary setObject:forKeyedSubscript:](v41, "setObject:forKeyedSubscript:", v14, v15);

          unsigned int v16 = [v10 installed];
          v17 = (void *)objc_claimAutoreleasedReturnValue([v10 identifier]);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v41, "objectForKeyedSubscript:", v17));
          if (v16) {
            v19 = v43;
          }
          else {
            v19 = v42;
          }
          v6 &= v16 ^ 1;
          v8 &= v16;
          uint64_t v5 = v40;
          -[NSMutableArray addObject:](v19, "addObject:", v18);

          p_cache = (void **)(&OBJC_CLASS___CEMImageAssetInstallMetadata + 16);
        }
      }

      id v4 = [obj countByEnumeratingWithState:&v45 objects:v61 count:16];
    }

    while (v4);
  }

  else
  {
    char v6 = 1;
    char v8 = 1;
  }

  -[NSMutableArray sortUsingComparator:](v43, "sortUsingComparator:", &stru_10009D7F8);
  -[NSMutableArray sortUsingComparator:](v42, "sortUsingComparator:", &stru_10009D7F8);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v41, "allValues"));
  id v21 = [v20 mutableCopy];

  [v21 sortUsingComparator:&stru_10009D7F8];
  v22 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  v23 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v23,  "setObject:forKeyedSubscript:",  v21,  @"ActivatedConfigurations");
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[DMDActivationPayloadMetadata predicatePayloadMetadata](self, "predicatePayloadMetadata"));
  -[NSMutableDictionary addEntriesFromDictionary:](v23, "addEntriesFromDictionary:", v24);

  -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v23,  DMFDeclarationStatePayloadKey);
  if (-[DMDActivationPayloadMetadata installed](self, "installed"))
  {
    if ((v8 & 1) != 0)
    {
      v25 = v36;
      if (([v36 isEqualToString:DMFDeclarationStatusRemoved] & 1) == 0)
      {
        uint64_t v26 = DMFDeclarationStatusInstalled;
        uint64_t v27 = DMFDeclarationStateStatusKey;
        v28 = v22;
LABEL_22:
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v26, v27);
LABEL_26:
        -[DMDDeclarationPayloadMetadata setStateDictionary:](v37, "setStateDictionary:", v22);
        goto LABEL_27;
      }

      goto LABEL_27;
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  DMFDeclarationStatusPendingClient,  DMFDeclarationStateStatusKey);
    uint64_t v30 = DMFCommandStateReasonCodeKey;
    v56[0] = DMFCommandStateReasonCodeKey;
    v56[1] = DMFCEMReasonCodePayloadPhase;
    v57[0] = DMFCEMReasonCodePayloadPhase;
    v57[1] = @"Install";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
    v58[0] = v31;
    v54[0] = v30;
    v54[1] = DMFCEMReasonCodePendingConfigurations;
    v55[0] = DMFCEMReasonCodePendingConfigurations;
    v55[1] = v42;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v55,  v54,  2LL));
    v58[1] = v32;
    v33 = v58;
LABEL_25:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v33, 2LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  v35,  DMFDeclarationStateReasonKey);

    v25 = v36;
    goto LABEL_26;
  }

  if ((v6 & 1) == 0)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v22,  "setObject:forKeyedSubscript:",  DMFDeclarationStatusPendingClient,  DMFDeclarationStateStatusKey);
    uint64_t v34 = DMFCommandStateReasonCodeKey;
    v51[0] = DMFCommandStateReasonCodeKey;
    v51[1] = DMFCEMReasonCodePayloadPhase;
    v52[0] = DMFCEMReasonCodePayloadPhase;
    v52[1] = @"Remove";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v52,  v51,  2LL));
    v53[0] = v31;
    v49[0] = v34;
    v49[1] = DMFCEMReasonCodePendingConfigurations;
    v50[0] = DMFCEMReasonCodePendingConfigurations;
    v50[1] = v43;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v50,  v49,  2LL));
    v53[1] = v32;
    v33 = v53;
    goto LABEL_25;
  }

  uint64_t v29 = DMFDeclarationStatusRemoved;
  v25 = v36;
  if (([v36 isEqualToString:DMFDeclarationStatusRemoved] & 1) == 0)
  {
    uint64_t v27 = DMFDeclarationStateStatusKey;
    v28 = v22;
    uint64_t v26 = v29;
    goto LABEL_22;
  }

+ (id)fetchRequestForActivationsFromOrganizationWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 fetchRequest]);
  char v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSPredicate predicateWithFormat:]( &OBJC_CLASS___NSPredicate,  "predicateWithFormat:",  @"%K = %@",  @"organization.identifier",  v4));

  [v5 setPredicate:v6];
  return v5;
}

@end
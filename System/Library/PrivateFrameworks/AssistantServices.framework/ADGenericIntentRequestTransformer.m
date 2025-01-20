@interface ADGenericIntentRequestTransformer
- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4;
@end

@implementation ADGenericIntentRequestTransformer

- (void)getSiriRequestForClientBoundAceCommand:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  v39 = (void (**)(id, id))a4;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___SAIntentGroupSupportedIntentResponse);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v38 handleFailureInMethod:a2, self, @"ADGenericIntentRequestTransformer.m", 114, @"Invalid parameter not satisfying: %@", @"[aceCommand isKindOfClass:[SAIntentGroupSupportedIntentResponse class]]" object file lineNumber description];
  }

  id v9 = v7;
  v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v9 launchId]);
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue([v9 parameters]);
  id v13 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v45;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v44 + 1) + 8LL * (void)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "ad_filteredDictionaryWithAppID:", v11));
        if (v18)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);

          if (v19)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue([v17 name]);
            -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v18, v20);
          }
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v44 objects:v49 count:16];
    }

    while (v14);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  v21 = (void *)objc_claimAutoreleasedReturnValue([v9 commands]);
  id v22 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v41;
    do
    {
      for (j = 0LL; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v41 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)j);
        uint64_t v27 = objc_claimAutoreleasedReturnValue([v26 dictionary]);
        if (v27)
        {
          v28 = (void *)v27;
          v29 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);

          if (v29)
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue([v26 dictionary]);
            v31 = (void *)objc_claimAutoreleasedReturnValue([v26 name]);
            -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v30, v31);
          }
        }
      }

      id v23 = [v21 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }

    while (v23);
  }

  v32 = objc_alloc(&OBJC_CLASS___STGenericIntentRequest);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v9 launchId]);
  v34 = (void *)objc_claimAutoreleasedReturnValue([v9 useCaseId]);
  v35 = (void *)objc_claimAutoreleasedReturnValue([v9 utterance]);
  v36 = -[STGenericIntentRequest initWithAppIdentifier:intentString:utterance:info:]( v32,  "initWithAppIdentifier:intentString:utterance:info:",  v33,  v34,  v35,  v10);

  -[STGenericIntentRequest _setLaunchToForeground:]( v36,  "_setLaunchToForeground:",  [v9 backgroundLaunch] ^ 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue([v9 aceId]);
  -[STGenericIntentRequest _setOriginatingAceID:](v36, "_setOriginatingAceID:", v37);

  v39[2](v39, v36);
}

@end
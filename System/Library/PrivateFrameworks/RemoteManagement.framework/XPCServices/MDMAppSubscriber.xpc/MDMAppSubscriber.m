int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  v3 = objc_opt_class(&OBJC_CLASS___MDMAppStatus, argv, envp);
  return +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:publisherClass:]( &OBJC_CLASS___RMConfigurationSubscriberClient,  "runConfigurationSubscriberClientWithApplicators:publisherClass:",  &__NSArray0__struct,  v3);
}

void sub_100002B7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.remotemanagementd", "mDMAppStatus");
  v2 = (void *)qword_1000086D8;
  qword_1000086D8 = (uint64_t)v1;
}

void sub_100002DAC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v5 appsByBundleIdentifier]);
    v8 = -[NSMutableArray initWithCapacity:](v6, "initWithCapacity:", [v7 count]);

    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appsByBundleIdentifier", 0));
    id v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v27;
      do
      {
        v13 = 0LL;
        do
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue([v5 appsByBundleIdentifier]);
          v16 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKeyedSubscript:v14]);

          v17 = (void *)objc_claimAutoreleasedReturnValue([v16 sourceIdentifier]);
          if (!v17)
          {
            id v20 = objc_msgSend((id)objc_opt_class(*(void *)(a1 + 32), v18, v19), "appStatusForApp:", v16);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue([v21 serializeWithType:1]);
            -[NSMutableArray addObject:](v8, "addObject:", v22);
          }

          v13 = (char *)v13 + 1;
        }

        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v11);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [*(id *)(a1 + 40) count]));
    [v23 setObject:v8 forKeyedSubscript:RMModelStatusItemMDMApp];
    uint64_t v24 = *(void *)(a1 + 48);
    id v25 = [v23 copy];
    (*(void (**)(uint64_t, id, void))(v24 + 16))(v24, v25, 0LL);
  }
}

void sub_100003190(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "Querying mdm app status for key paths: %{public}@",  (uint8_t *)&v2,  0xCu);
}

id objc_msgSend_buildWithIdentifier_removed_name_externalVersionId_version_shortVersion_state_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildWithIdentifier:removed:name:externalVersionId:version:shortVersion:state:");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}
@interface PDSharingManagementBulkRevokeShareResponse
+ (BOOL)jsonDataOptional;
- (NSDictionary)statuses;
- (PDSharingManagementBulkRevokeShareResponse)initWithData:(id)a3;
@end

@implementation PDSharingManagementBulkRevokeShareResponse

- (PDSharingManagementBulkRevokeShareResponse)initWithData:(id)a3
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___PDSharingManagementBulkRevokeShareResponse;
  v4 = -[PDSharingManagementBulkRevokeShareResponse initWithData:](&v37, "initWithData:");
  v5 = v4;
  if (a3 && v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PDSharingManagementBulkRevokeShareResponse JSONObject](v4, "JSONObject"));
    uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary, v7);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
    {
      id v10 = objc_msgSend( v6,  "PKArrayContaining:forKey:",  objc_opt_class(NSDictionary, v9),  @"statuses");
      uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
      if (!v11)
      {
        v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
        __int128 v33 = 0u;
        __int128 v34 = 0u;
        __int128 v35 = 0u;
        __int128 v36 = 0u;
        id v23 = [0 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v34;
          do
          {
            for (i = 0LL; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v34 != v25) {
                objc_enumerationMutation(0LL);
              }
              v27 = *(void **)(*((void *)&v33 + 1) + 8LL * (void)i);
              v28 = (void *)objc_claimAutoreleasedReturnValue([v27 PKStringForKey:@"shareIdentifier"]);
              uint64_t v29 = objc_claimAutoreleasedReturnValue([v27 PKNumberForKey:@"status"]);
              v30 = (void *)v29;
              if (v28) {
                BOOL v31 = v29 == 0;
              }
              else {
                BOOL v31 = 1;
              }
              if (!v31) {
                -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v29, v28);
              }
            }

            id v24 = [0 countByEnumeratingWithState:&v33 objects:v38 count:16];
          }

          while (v24);
        }

        v32 = (NSDictionary *)-[NSMutableDictionary copy](v12, "copy");
        statuses = (os_log_s *)v5->_statuses;
        v5->_statuses = v32;
        goto LABEL_10;
      }

      v12 = (NSMutableDictionary *)v11;
      statuses = (os_log_s *)v5;
    }

    else
    {
      uint64_t Object = PKLogFacilityTypeGetObject(6LL);
      statuses = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
      if (os_log_type_enabled(statuses, OS_LOG_TYPE_DEFAULT))
      {
        v16 = (objc_class *)objc_opt_class(v6, v15);
        v17 = NSStringFromClass(v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v20 = (void *)objc_opt_class(v5, v19);
        *(_DWORD *)buf = 138543618;
        v40 = v18;
        __int16 v41 = 2112;
        v42 = v20;
        id v21 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  statuses,  OS_LOG_TYPE_DEFAULT,  "Malformed response: expected dictionary and received %{public}@ inside %@",  buf,  0x16u);
      }

      v12 = (NSMutableDictionary *)v5;
    }

    v5 = 0LL;
LABEL_10:
  }

  return v5;
}

+ (BOOL)jsonDataOptional
{
  return 1;
}

- (NSDictionary)statuses
{
  return self->_statuses;
}

- (void).cxx_destruct
{
}

@end
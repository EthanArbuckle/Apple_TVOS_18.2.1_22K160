@interface IDSDXPCBAASigner
- (IDSBAASigner)baaSigner;
- (IDSDXPCBAASigner)initWithTopic:(id)a3 queue:(id)a4 connection:(id)a5;
- (NSString)topic;
- (OS_dispatch_queue)queue;
- (void)baaHeadersBySigningData:(id)a3 serverTimestamp:(id)a4 completion:(id)a5;
- (void)purgeBAACertWithCompletion:(id)a3;
- (void)setBaaSigner:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation IDSDXPCBAASigner

- (IDSDXPCBAASigner)initWithTopic:(id)a3 queue:(id)a4 connection:(id)a5
{
  id v7 = a3;
  id obj = a4;
  id v8 = a4;
  id v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:kIDSRegistrationEntitlement]);
  v11 = &IMInsertBoolsToXPCDictionary_ptr;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray, v12);
  if ((objc_opt_isKindOfClass(v10, v13) & 1) == 0)
  {
    uint64_t v24 = objc_opt_class(&OBJC_CLASS___NSString, v14);
    if ((objc_opt_isKindOfClass(v10, v24) & 1) != 0)
    {
      unsigned int v26 = [v10 isEqualToString:v7];
    }

    else
    {
      uint64_t v27 = objc_opt_class(&OBJC_CLASS___NSNumber, v25);
      if ((objc_opt_isKindOfClass(v10, v27) & 1) == 0)
      {
        int v28 = 0;
        goto LABEL_21;
      }

      unsigned int v26 = [v10 BOOLValue];
    }

    int v28 = v26;
    goto LABEL_21;
  }

  id v54 = v9;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  id v15 = v10;
  id v16 = [v15 countByEnumeratingWithState:&v64 objects:v71 count:16];
  if (v16)
  {
    id v18 = v16;
    char v19 = 0;
    uint64_t v20 = *(void *)v65;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v65 != v20) {
          objc_enumerationMutation(v15);
        }
        v22 = *(void **)(*((void *)&v64 + 1) + 8LL * (void)i);
        uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString, v17);
      }

      id v18 = [v15 countByEnumeratingWithState:&v64 objects:v71 count:16];
    }

    while (v18);
  }

  else
  {
    char v19 = 0;
  }

  int v28 = v19 & 1;
  id v9 = v54;
  v11 = &IMInsertBoolsToXPCDictionary_ptr;
LABEL_21:
  v29 = (void *)objc_claimAutoreleasedReturnValue([v9 valueForEntitlement:kIDSMessagingEntitlement]);
  uint64_t v31 = objc_opt_class(v11[469], v30);
  if ((objc_opt_isKindOfClass(v29, v31) & 1) != 0)
  {
    v53 = v10;
    id v55 = v8;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    id v33 = v29;
    id v34 = [v33 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v34)
    {
      id v36 = v34;
      id v37 = v9;
      uint64_t v38 = *(void *)v61;
      do
      {
        for (j = 0LL; j != v36; j = (char *)j + 1)
        {
          if (*(void *)v61 != v38) {
            objc_enumerationMutation(v33);
          }
          v40 = *(void **)(*((void *)&v60 + 1) + 8LL * (void)j);
          uint64_t v41 = objc_opt_class(&OBJC_CLASS___NSString, v35);
          if ((objc_opt_isKindOfClass(v40, v41) & 1) != 0) {
            v28 |= [v40 isEqualToString:v7];
          }
        }

        id v36 = [v33 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }

      while (v36);
    }

    else
    {
      id v37 = v9;
    }

    id v9 = v37;
    v10 = v53;
    id v8 = v55;
    v44 = self;
  }

  else
  {
    uint64_t v42 = objc_opt_class(&OBJC_CLASS___NSString, v32);
    if ((objc_opt_isKindOfClass(v29, v42) & 1) != 0)
    {
      v44 = self;
      goto LABEL_39;
    }

    uint64_t v45 = objc_opt_class(&OBJC_CLASS___NSNumber, v43);
    v44 = self;
    if ((objc_opt_isKindOfClass(v29, v45) & 1) != 0)
    {
      goto LABEL_39;
    }
  }

  if ((v28 & 1) != 0)
  {
LABEL_45:
    v59.receiver = v44;
    v59.super_class = (Class)&OBJC_CLASS___IDSDXPCBAASigner;
    v48 = -[IDSDXPCBAASigner init](&v59, "init");
    v49 = v48;
    if (v48)
    {
      objc_storeStrong((id *)&v48->_queue, obj);
      objc_storeStrong((id *)&v49->_topic, a3);
      v50 = -[IDSBAASigner initWithQueue:](objc_alloc(&OBJC_CLASS___IDSBAASigner), "initWithQueue:", v49->_queue);
      baaSigner = v49->_baaSigner;
      v49->_baaSigner = v50;
    }

    v44 = v49;
    v47 = v44;
    goto LABEL_48;
  }

- (void)baaHeadersBySigningData:(id)a3 serverTimestamp:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCBAASigner baaSigner](self, "baaSigner"));
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCBAASigner topic](self, "topic"));
    [v11 headersBySigningData:v8 serverTimestamp:v9 topic:v12 completion:v10];
  }

  else
  {
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[IMRGLog registration](&OBJC_CLASS___IMRGLog, "registration"));
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100693DC0(v13);
    }
  }
}

- (void)purgeBAACertWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IDSDXPCBAASigner baaSigner](self, "baaSigner"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IDSDXPCBAASigner topic](self, "topic"));
  [v6 purgeBAACertForTopic:v5 completion:v4];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSString)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
}

- (IDSBAASigner)baaSigner
{
  return self->_baaSigner;
}

- (void)setBaaSigner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
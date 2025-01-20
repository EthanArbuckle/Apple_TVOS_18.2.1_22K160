@interface APSTopicGroup
- (APSTopicGroup)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5;
- (APSTopicHasher)topicHasher;
- (BOOL)isEqual:(id)a3;
- (NSMutableDictionary)hashesToEnabledTopics;
- (NSMutableDictionary)hashesToIgnoredTopics;
- (NSMutableDictionary)hashesToNonWakingTopics;
- (NSMutableDictionary)hashesToOpportunisticTopics;
- (NSMutableDictionary)hashesToPausedTopics;
- (NSSet)enabledTopics;
- (NSSet)ignoredTopics;
- (NSSet)nonWakingTopics;
- (NSSet)opportunisticTopics;
- (NSString)logString;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)currentFilterForTopicState:(id)a3;
@end

@implementation APSTopicGroup

- (APSTopicGroup)initWithEnvironment:(id)a3 topicHasher:(id)a4 user:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___APSTopicGroup;
  v12 = -[APSTopicGroup init](&v25, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_user, a5);
    objc_storeStrong((id *)&v13->_environment, a3);
    objc_storeStrong((id *)&v13->_topicHasher, a4);
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hashesToEnabledTopics = v13->_hashesToEnabledTopics;
    v13->_hashesToEnabledTopics = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hashesToIgnoredTopics = v13->_hashesToIgnoredTopics;
    v13->_hashesToIgnoredTopics = v16;

    v18 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hashesToOpportunisticTopics = v13->_hashesToOpportunisticTopics;
    v13->_hashesToOpportunisticTopics = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hashesToNonWakingTopics = v13->_hashesToNonWakingTopics;
    v13->_hashesToNonWakingTopics = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    hashesToPausedTopics = v13->_hashesToPausedTopics;
    v13->_hashesToPausedTopics = v22;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (APSTopicGroup *)a3;
  v6 = v4;
  if (!v4) {
    goto LABEL_9;
  }
  if (self == v4)
  {
    unsigned __int8 v17 = 1;
    goto LABEL_19;
  }

  uint64_t v7 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self, "hashesToEnabledTopics"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](v8, "hashesToEnabledTopics"));
    if ([v9 isEqualToDictionary:v10])
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self, "hashesToOpportunisticTopics"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](v8, "hashesToOpportunisticTopics"));
      if ([v11 isEqualToDictionary:v12])
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self, "hashesToNonWakingTopics"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](v8, "hashesToNonWakingTopics"));
        if ([v13 isEqualToDictionary:v14])
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self, "hashesToIgnoredTopics"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](v8, "hashesToIgnoredTopics"));
          if (objc_msgSend(v15, "isEqualToDictionary:"))
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self, "hashesToPausedTopics"));
            v20 = v15;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](v8, "hashesToPausedTopics"));
            unsigned __int8 v17 = [v19 isEqualToDictionary:v16];

            v15 = v20;
          }

          else
          {
            unsigned __int8 v17 = 0;
          }
        }

        else
        {
          unsigned __int8 v17 = 0;
        }
      }

      else
      {
        unsigned __int8 v17 = 0;
      }
    }

    else
    {
      unsigned __int8 v17 = 0;
    }
  }

  else
  {
LABEL_9:
    unsigned __int8 v17 = 0;
  }

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = -[APSTopicGroup initWithEnvironment:topicHasher:user:]( objc_alloc(&OBJC_CLASS___APSTopicGroup),  "initWithEnvironment:topicHasher:user:",  self->_environment,  self->_topicHasher,  self->_user);
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToEnabledTopics](self, "hashesToEnabledTopics"));
  uint64_t v7 = -[NSDictionary initWithDictionary:copyItems:](v5, "initWithDictionary:copyItems:", v6, 1LL);
  v8 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v7, "mutableCopy");
  hashesToEnabledTopics = v4->_hashesToEnabledTopics;
  v4->_hashesToEnabledTopics = v8;

  id v10 = objc_alloc(&OBJC_CLASS___NSDictionary);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToOpportunisticTopics](self, "hashesToOpportunisticTopics"));
  v12 = -[NSDictionary initWithDictionary:copyItems:](v10, "initWithDictionary:copyItems:", v11, 1LL);
  v13 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v12, "mutableCopy");
  hashesToOpportunisticTopics = v4->_hashesToOpportunisticTopics;
  v4->_hashesToOpportunisticTopics = v13;

  v15 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToNonWakingTopics](self, "hashesToNonWakingTopics"));
  unsigned __int8 v17 = -[NSDictionary initWithDictionary:copyItems:](v15, "initWithDictionary:copyItems:", v16, 1LL);
  v18 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v17, "mutableCopy");
  hashesToNonWakingTopics = v4->_hashesToNonWakingTopics;
  v4->_hashesToNonWakingTopics = v18;

  v20 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToIgnoredTopics](self, "hashesToIgnoredTopics"));
  v22 = -[NSDictionary initWithDictionary:copyItems:](v20, "initWithDictionary:copyItems:", v21, 1LL);
  v23 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v22, "mutableCopy");
  hashesToIgnoredTopics = v4->_hashesToIgnoredTopics;
  v4->_hashesToIgnoredTopics = v23;

  objc_super v25 = objc_alloc(&OBJC_CLASS___NSDictionary);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicGroup hashesToPausedTopics](self, "hashesToPausedTopics"));
  v27 = -[NSDictionary initWithDictionary:copyItems:](v25, "initWithDictionary:copyItems:", v26, 1LL);
  v28 = (NSMutableDictionary *)-[NSDictionary mutableCopy](v27, "mutableCopy");
  hashesToPausedTopics = v4->_hashesToPausedTopics;
  v4->_hashesToPausedTopics = v28;

  return v4;
}

- (int64_t)currentFilterForTopicState:(id)a3
{
  id v4 = a3;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_hashesToEnabledTopics, "allValues"));
  id v6 = [v5 countByEnumeratingWithState:&v64 objects:v72 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v65;
    int64_t v9 = 1LL;
LABEL_3:
    uint64_t v10 = 0LL;
    while (1)
    {
      if (*(void *)v65 != v8) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(void **)(*((void *)&v64 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 topicName]);
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if ((v14 & 1) != 0) {
        break;
      }
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v64 objects:v72 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:

    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_hashesToOpportunisticTopics, "allValues"));
    id v15 = [v5 countByEnumeratingWithState:&v60 objects:v71 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v61;
      int64_t v9 = 2LL;
LABEL_11:
      uint64_t v18 = 0LL;
      while (1)
      {
        if (*(void *)v61 != v17) {
          objc_enumerationMutation(v5);
        }
        v19 = *(void **)(*((void *)&v60 + 1) + 8 * v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 topicName]);
        unsigned __int8 v22 = [v20 isEqualToString:v21];

        if ((v22 & 1) != 0) {
          break;
        }
        if (v16 == (id)++v18)
        {
          id v16 = [v5 countByEnumeratingWithState:&v60 objects:v71 count:16];
          if (v16) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }

    else
    {
LABEL_17:

      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_hashesToNonWakingTopics, "allValues"));
      id v23 = [v5 countByEnumeratingWithState:&v56 objects:v70 count:16];
      if (v23)
      {
        id v24 = v23;
        uint64_t v25 = *(void *)v57;
        int64_t v9 = 4LL;
LABEL_19:
        uint64_t v26 = 0LL;
        while (1)
        {
          if (*(void *)v57 != v25) {
            objc_enumerationMutation(v5);
          }
          v27 = *(void **)(*((void *)&v56 + 1) + 8 * v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
          v29 = (void *)objc_claimAutoreleasedReturnValue([v27 topicName]);
          unsigned __int8 v30 = [v28 isEqualToString:v29];

          if ((v30 & 1) != 0) {
            break;
          }
          if (v24 == (id)++v26)
          {
            id v24 = [v5 countByEnumeratingWithState:&v56 objects:v70 count:16];
            if (v24) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }

      else
      {
LABEL_25:

        __int128 v54 = 0u;
        __int128 v55 = 0u;
        __int128 v52 = 0u;
        __int128 v53 = 0u;
        uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_hashesToIgnoredTopics, "allValues"));
        id v31 = [v5 countByEnumeratingWithState:&v52 objects:v69 count:16];
        if (v31)
        {
          id v32 = v31;
          uint64_t v33 = *(void *)v53;
          int64_t v9 = 3LL;
LABEL_27:
          uint64_t v34 = 0LL;
          while (1)
          {
            if (*(void *)v53 != v33) {
              objc_enumerationMutation(v5);
            }
            v35 = *(void **)(*((void *)&v52 + 1) + 8 * v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
            v37 = (void *)objc_claimAutoreleasedReturnValue([v35 topicName]);
            unsigned __int8 v38 = [v36 isEqualToString:v37];

            if ((v38 & 1) != 0) {
              break;
            }
            if (v32 == (id)++v34)
            {
              id v32 = [v5 countByEnumeratingWithState:&v52 objects:v69 count:16];
              if (v32) {
                goto LABEL_27;
              }
              goto LABEL_33;
            }
          }
        }

        else
        {
LABEL_33:

          __int128 v50 = 0u;
          __int128 v51 = 0u;
          __int128 v48 = 0u;
          __int128 v49 = 0u;
          uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_hashesToPausedTopics, "allValues", 0LL));
          id v39 = [v5 countByEnumeratingWithState:&v48 objects:v68 count:16];
          if (v39)
          {
            id v40 = v39;
            uint64_t v41 = *(void *)v49;
            int64_t v9 = 5LL;
LABEL_35:
            uint64_t v42 = 0LL;
            while (1)
            {
              if (*(void *)v49 != v41) {
                objc_enumerationMutation(v5);
              }
              v43 = *(void **)(*((void *)&v48 + 1) + 8 * v42);
              v44 = (void *)objc_claimAutoreleasedReturnValue([v4 topicName]);
              v45 = (void *)objc_claimAutoreleasedReturnValue([v43 topicName]);
              unsigned __int8 v46 = [v44 isEqualToString:v45];

              if ((v46 & 1) != 0) {
                break;
              }
              if (v40 == (id)++v42)
              {
                id v40 = [v5 countByEnumeratingWithState:&v48 objects:v68 count:16];
                if (v40) {
                  goto LABEL_35;
                }
                goto LABEL_41;
              }
            }
          }

          else
          {
LABEL_41:
            int64_t v9 = 0LL;
          }
        }
      }
    }
  }

  return v9;
}

- (NSSet)enabledTopics
{
  return (NSSet *)sub_10003DA64(self->_hashesToEnabledTopics);
}

- (NSSet)ignoredTopics
{
  return (NSSet *)sub_10003DA64(self->_hashesToIgnoredTopics);
}

- (NSSet)opportunisticTopics
{
  return (NSSet *)sub_10003DA64(self->_hashesToOpportunisticTopics);
}

- (NSSet)nonWakingTopics
{
  return (NSSet *)sub_10003DA64(self->_hashesToNonWakingTopics);
}

- (NSMutableDictionary)hashesToEnabledTopics
{
  return self->_hashesToEnabledTopics;
}

- (NSMutableDictionary)hashesToIgnoredTopics
{
  return self->_hashesToIgnoredTopics;
}

- (NSMutableDictionary)hashesToOpportunisticTopics
{
  return self->_hashesToOpportunisticTopics;
}

- (NSMutableDictionary)hashesToNonWakingTopics
{
  return self->_hashesToNonWakingTopics;
}

- (NSMutableDictionary)hashesToPausedTopics
{
  return self->_hashesToPausedTopics;
}

- (NSString)logString
{
  v3 = -[NSMutableString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSMutableString),  "initWithFormat:",  @"%@:",  self);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"enabled: %@", self->_hashesToEnabledTopics);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"opportunistic: %@", self->_hashesToOpportunisticTopics);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"ignored: %@", self->_hashesToIgnoredTopics);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"nonwaking: %@", self->_hashesToNonWakingTopics);
  -[NSMutableString appendFormat:](v3, "appendFormat:", @"paused: %@", self->_hashesToPausedTopics);
  return (NSString *)v3;
}

- (APSTopicHasher)topicHasher
{
  return self->_topicHasher;
}

- (void).cxx_destruct
{
}

@end
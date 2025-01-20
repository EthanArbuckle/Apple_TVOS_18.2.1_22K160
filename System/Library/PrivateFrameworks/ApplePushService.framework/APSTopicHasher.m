@interface APSTopicHasher
- (APSTopicHasher)initWithTopicSaltStore:(id)a3;
- (APSTopicSaltStore)topicSaltStore;
- (id)_identifierForTopic:(id)a3 user:(id)a4;
- (id)createTopicHashForTopic:(id)a3 user:(id)a4 shouldSalt:(BOOL)a5;
- (id)topicHashForTopic:(id)a3 user:(id)a4;
- (id)topicsToSaltsWithUser:(id)a3;
- (void)clearSaltForTopic:(id)a3 user:(id)a4;
- (void)setTopicSaltStore:(id)a3;
@end

@implementation APSTopicHasher

- (APSTopicHasher)initWithTopicSaltStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___APSTopicHasher;
  v6 = -[APSTopicHasher init](&v9, "init");
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_topicSaltStore, a3);
  }

  return v7;
}

- (void)clearSaltForTopic:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[APSTopicHasher _identifierForTopic:user:](self, "_identifierForTopic:user:", a3, v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicSaltStore](self, "topicSaltStore"));
  [v7 saveSalt:0 forIdentifier:v8 user:v6];
}

- (id)createTopicHashForTopic:(id)a3 user:(id)a4 shouldSalt:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher _identifierForTopic:user:](self, "_identifierForTopic:user:", v8, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicSaltStore](self, "topicSaltStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 loadSaltForIdentifier:v10 user:v9]);

    if (v12)
    {
      id v23 = v12;
      id v13 = sub_100077E84(v8, &v23);
      id v14 = (id)objc_claimAutoreleasedReturnValue(v13);
      id v15 = v23;
    }

    else
    {
      id v22 = 0LL;
      id v17 = sub_100077E84(v8, &v22);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v17);
      id v15 = v22;
      v18 = 0LL;
      if (v15 && v12)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicSaltStore](self, "topicSaltStore"));
        unsigned int v20 = [v19 saveSalt:v15 forIdentifier:v10 user:v9];

        if (v20) {
          v18 = v12;
        }
        else {
          v18 = 0LL;
        }
      }

      id v14 = v18;
    }
  }

  else
  {
    id v16 = sub_100077D74(v8);
    id v14 = (id)objc_claimAutoreleasedReturnValue(v16);
  }

  return v14;
}

- (id)topicHashForTopic:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher _identifierForTopic:user:](self, "_identifierForTopic:user:", v7, v6));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicSaltStore](self, "topicSaltStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue([v9 loadSaltForIdentifier:v8 user:v6]);

  if (v10)
  {
    id v15 = v10;
    id v11 = sub_100077E84(v7, &v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    id v7 = v15;
  }

  else
  {
    id v13 = sub_100077D74(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (id)topicsToSaltsWithUser:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSTopicHasher topicSaltStore](self, "topicSaltStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 loadIdentifiersToSaltsForUser:v4]);

  return v6;
}

- (id)_identifierForTopic:(id)a3 user:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 storageName]);
  id v8 = [v7 length];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 storageName]);
    id v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@,%@", v5, v9));
  }

  else
  {
    id v10 = v5;
  }

  return v10;
}

- (APSTopicSaltStore)topicSaltStore
{
  return self->_topicSaltStore;
}

- (void)setTopicSaltStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
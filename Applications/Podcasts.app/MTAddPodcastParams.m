@interface MTAddPodcastParams
- (BOOL)userInitiated;
- (MTAddPodcastParams)init;
- (NSString)location;
- (NSString)url;
- (id)completion;
- (id)processingCompletion;
- (int64_t)storeCollectionId;
- (void)setCompletion:(id)a3;
- (void)setLocation:(id)a3;
- (void)setProcessingCompletion:(id)a3;
- (void)setStoreCollectionId:(int64_t)a3;
- (void)setUrl:(id)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation MTAddPodcastParams

- (MTAddPodcastParams)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___MTAddPodcastParams;
  v2 = -[MTAddPodcastParams init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[MTAddPodcastParams setUserInitiated:](v2, "setUserInitiated:", 1LL);
  }
  return v3;
}

- (void)setUrl:(id)a3
{
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v18 scheme]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  if ([v5 isEqualToString:@"pcast"])
  {

LABEL_4:
    v8 = (void *)objc_claimAutoreleasedReturnValue([v18 resourceSpecifier]);
    v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"http:%@", v8);
    goto LABEL_9;
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  unsigned int v7 = [v6 isEqualToString:@"feed"];

  if (v7) {
    goto LABEL_4;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
  if ([v10 isEqualToString:@"pcasts"])
  {
  }

  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v4 lowercaseString]);
    unsigned int v12 = [v11 isEqualToString:@"feeds"];

    if (!v12)
    {
      v15 = v18;
      goto LABEL_10;
    }
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue([v18 resourceSpecifier]);
  v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"https:%@", v8);
LABEL_9:
  v13 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v13));

  v15 = (void *)v14;
LABEL_10:
  id v19 = v15;
  v16 = (NSString *)objc_claimAutoreleasedReturnValue([v15 absoluteString]);
  url = self->_url;
  self->_url = v16;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)storeCollectionId
{
  return self->_storeCollectionId;
}

- (void)setStoreCollectionId:(int64_t)a3
{
  self->_storeCollectionId = a3;
}

- (BOOL)userInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)processingCompletion
{
  return self->_processingCompletion;
}

- (void)setProcessingCompletion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
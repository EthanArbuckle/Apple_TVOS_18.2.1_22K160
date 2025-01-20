@interface MTApnsDictionaryProcessor
- (MTApnsDictionaryProcessor)initWithDictionary:(id)a3;
- (NSDictionary)dictionary;
- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5;
- (id)versionForGetTransaction:(id)a3 key:(id)a4;
- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)setDictionary:(id)a3;
- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7;
@end

@implementation MTApnsDictionaryProcessor

- (MTApnsDictionaryProcessor)initWithDictionary:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___MTApnsDictionaryProcessor;
  id v3 = a3;
  v4 = -[MTApnsDictionaryProcessor init](&v6, "init");
  -[MTApnsDictionaryProcessor setDictionary:](v4, "setDictionary:", v3, v6.receiver, v6.super_class);

  return v4;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  return @"0";
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTApnsDictionaryProcessor dictionary](self, "dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:v6]);

  if (!v8)
  {
    uint64_t v16 = _MTLogCategoryCloudSync(v9);
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v18 = 138412290;
      id v19 = v6;
      v15 = "Processor was asked for key %@ that's missing from the provided dictionary!";
      goto LABEL_9;
    }

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
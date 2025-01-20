@interface HHDBubbleJob
- (HHDBubbleJob)initWithBubbleId:(id)a3 jobName:(id)a4 jobDataRetriever:(id)a5;
- (NSString)launchdJobName;
- (NSUUID)bubbleId;
@end

@implementation HHDBubbleJob

- (HHDBubbleJob)initWithBubbleId:(id)a3 jobName:(id)a4 jobDataRetriever:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___HHDBubbleJob;
  v12 = -[HHDBubbleJob init](&v18, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bubbleId, a3);
    objc_storeStrong((id *)&v13->_launchdJobName, a4);
    p_jobDataRetriever = (void **)&v13->_jobDataRetriever;
    objc_storeStrong((id *)&v13->_jobDataRetriever, a5);
    if (!v11)
    {
      uint64_t v15 = objc_claimAutoreleasedReturnValue(+[_HHDPlistReader plistReader](&OBJC_CLASS____HHDPlistReader, "plistReader"));
      v16 = *p_jobDataRetriever;
      *p_jobDataRetriever = (void *)v15;
    }
  }

  return v13;
}

- (NSString)launchdJobName
{
  return self->_launchdJobName;
}

- (NSUUID)bubbleId
{
  return self->_bubbleId;
}

- (void).cxx_destruct
{
}

@end
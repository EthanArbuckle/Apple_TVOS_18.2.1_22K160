@interface GTCaptureProgress
+ (BOOL)supportsSecureCoding;
- (GTCaptureCompletionState)completionState;
- (GTCaptureDescriptor)descriptor;
- (GTCaptureProgress)initWithCoder:(id)a3;
- (GTCaptureProgressStatistics)stats;
- (id)description;
- (unint64_t)captureState;
- (unint64_t)capturedCommandsBuffers;
- (void)encodeWithCoder:(id)a3;
- (void)setCaptureState:(unint64_t)a3;
- (void)setCapturedCommandsBuffers:(unint64_t)a3;
- (void)setCompletionState:(id)a3;
- (void)setDescriptor:(id)a3;
- (void)setStats:(id)a3;
@end

@implementation GTCaptureProgress

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTCaptureProgress)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___GTCaptureProgress;
  v5 = -[GTCaptureProgress init](&v19, "init");
  if (v5)
  {
    v5->_captureState = (unint64_t)[v4 decodeInt64ForKey:@"captureState"];
    v5->_capturedCommandsBuffers = (unint64_t)[v4 decodeInt64ForKey:@"capturedCommandsBuffers"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class(GTCaptureDescriptor) forKey:@"descriptor"];
    uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
    descriptor = v5->_descriptor;
    v5->_descriptor = (GTCaptureDescriptor *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class(GTCaptureProgressStatistics) forKey:@"stats"];
    uint64_t v10 = objc_claimAutoreleasedReturnValue(v9);
    stats = v5->_stats;
    v5->_stats = (GTCaptureProgressStatistics *)v10;

    v12 = objc_opt_new(&OBJC_CLASS___GTCaptureCompletionState);
    completionState = v5->_completionState;
    v5->_completionState = v12;

    id v14 = [v4 decodeObjectOfClass:objc_opt_class(NSURL) forKey:@"completionState.archiveURL"];
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[GTCaptureCompletionState setArchiveURL:](v5->_completionState, "setArchiveURL:", v15);

    id v16 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"completionState.error"];
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[GTCaptureCompletionState setError:](v5->_completionState, "setError:", v17);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t captureState = self->_captureState;
  id v5 = a3;
  [v5 encodeInt64:captureState forKey:@"captureState"];
  [v5 encodeInt64:self->_capturedCommandsBuffers forKey:@"capturedCommandsBuffers"];
  [v5 encodeObject:self->_descriptor forKey:@"descriptor"];
  [v5 encodeObject:self->_stats forKey:@"stats"];
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[GTCaptureCompletionState archiveURL](self->_completionState, "archiveURL"));
  [v5 encodeObject:v6 forKey:@"completionState.archiveURL"];

  id v7 = (id)objc_claimAutoreleasedReturnValue(-[GTCaptureCompletionState error](self->_completionState, "error"));
  [v5 encodeObject:v7 forKey:@"completionState.error"];
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___GTCaptureProgress;
  id v2 = -[GTCaptureProgress description](&v6, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@", v3));

  return v4;
}

- (unint64_t)captureState
{
  return self->_captureState;
}

- (void)setCaptureState:(unint64_t)a3
{
  self->_unint64_t captureState = a3;
}

- (GTCaptureDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
}

- (GTCaptureCompletionState)completionState
{
  return self->_completionState;
}

- (void)setCompletionState:(id)a3
{
}

- (unint64_t)capturedCommandsBuffers
{
  return self->_capturedCommandsBuffers;
}

- (void)setCapturedCommandsBuffers:(unint64_t)a3
{
  self->_capturedCommandsBuffers = a3;
}

- (GTCaptureProgressStatistics)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
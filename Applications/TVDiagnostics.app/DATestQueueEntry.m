@interface DATestQueueEntry
+ (id)queueEntryWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTestQueueEntry:(id)a3;
- (DATestQueueEntry)initWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5;
- (DKDiagnosticAttributes)attributes;
- (DKDiagnosticParameters)parameters;
- (id)completion;
- (unint64_t)hash;
@end

@implementation DATestQueueEntry

+ (id)queueEntryWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithAttributes:v10 parameters:v9 completion:v8];

  return v11;
}

- (DATestQueueEntry)initWithAttributes:(id)a3 parameters:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___DATestQueueEntry;
  v12 = -[DATestQueueEntry init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_attributes, a3);
    objc_storeStrong((id *)&v13->_parameters, a4);
    id v14 = objc_retainBlock(v11);
    id completion = v13->_completion;
    v13->_id completion = v14;
  }

  return v13;
}

- (unint64_t)hash
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueueEntry attributes](self, "attributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identifier]);
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (BOOL)isEqualToTestQueueEntry:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DATestQueueEntry attributes](self, "attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 identifier]);
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 attributes]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
  unsigned __int8 v9 = [v6 isEqual:v8];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (DATestQueueEntry *)a3;
  unsigned __int8 v5 = self == v4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___DATestQueueEntry);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0) {
    unsigned __int8 v5 = -[DATestQueueEntry isEqualToTestQueueEntry:](self, "isEqualToTestQueueEntry:", v4);
  }

  return v5;
}

- (DKDiagnosticAttributes)attributes
{
  return self->_attributes;
}

- (id)completion
{
  return self->_completion;
}

- (DKDiagnosticParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
}

@end
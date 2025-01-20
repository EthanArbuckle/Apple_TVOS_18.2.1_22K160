@interface ProgressInfo
- (id)description;
@end

@implementation ProgressInfo

- (id)description
{
  if (-[ASDProgress phase](self->_asdProgress, "phase") == (id)2)
  {
    v23.receiver = self;
    v23.super_class = (Class)&OBJC_CLASS___ProgressInfo;
    id v3 = -[ProgressInfo description](&v23, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    bundleID = self->_bundleID;
    double progressPercentage = self->_progressPercentage;
    -[ASDProgress throughput](self->_asdProgress, "throughput");
    uint64_t v8 = v7;
    id v9 = -[ASDProgress secondsRemaining](self->_asdProgress, "secondsRemaining");
    unint64_t v10 = (unint64_t)-[ASDProgress phase](self->_asdProgress, "phase");
    if (v10 > 7) {
      v11 = &stru_1003F3E40;
    }
    else {
      v11 = off_1003F33E0[v10];
    }
    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: {bundleID = %@; fractionCompleted = %.3f; throughput = %.0f; remaining = %ld phase = %@}",
            v4,
            bundleID,
            *(void *)&progressPercentage,
            v8,
            v9,
            v11);
  }

  else
  {
    v22.receiver = self;
    v22.super_class = (Class)&OBJC_CLASS___ProgressInfo;
    id v12 = -[ProgressInfo description](&v22, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v13 = self->_bundleID;
    double v14 = self->_progressPercentage;
    unint64_t v15 = (unint64_t)-[ASDProgress phase](self->_asdProgress, "phase");
    if (v15 > 7) {
      v16 = &stru_1003F3E40;
    }
    else {
      v16 = off_1003F33E0[v15];
    }
    v17 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: {bundleID = %@; fractionCompleted = %.3f; phase = %@}",
            v4,
            v13,
            *(void *)&v14,
            v16,
            v20,
            v21);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return v18;
}

- (void).cxx_destruct
{
}

@end
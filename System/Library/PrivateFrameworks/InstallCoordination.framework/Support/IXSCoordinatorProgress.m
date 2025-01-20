@interface IXSCoordinatorProgress
+ (double)_computeOverallProgressForCurrentProgress:(double)a3 progressPhase:(unint64_t)a4 progressHint:(id)a5;
- (BOOL)needsPostProcessing;
- (BOOL)progressCompleted;
- (IXApplicationIdentity)identity;
- (IXProgressHint)progressHint;
- (IXSCoordinatorProgressDelegate)delegate;
- (double)currentPhaseProgress;
- (id)description;
- (id)initForCoordinatorWithIdentity:(id)a3 totalUnits:(unint64_t)a4 progressHint:(id)a5 needsPostProcessing:(BOOL)a6 delegate:(id)a7;
- (unint64_t)progressPhase;
- (unint64_t)totalUnits;
- (unint64_t)totalUnitsCompleted;
- (void)_notifyDelegateAndUpdateProgressWithPhaseCompleted:(BOOL)a3;
- (void)finishInstalling;
- (void)finishLoading;
- (void)finishPostProcessing;
- (void)setCurrentPhaseProgress:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setIdentity:(id)a3;
- (void)setNeedsPostProcessing:(BOOL)a3;
- (void)setProgressCompleted:(BOOL)a3;
- (void)setProgressHint:(id)a3;
- (void)setProgressPhase:(unint64_t)a3;
- (void)setTotalUnits:(unint64_t)a3;
- (void)setTotalUnitsCompleted:(unint64_t)a3;
@end

@implementation IXSCoordinatorProgress

- (id)initForCoordinatorWithIdentity:(id)a3 totalUnits:(unint64_t)a4 progressHint:(id)a5 needsPostProcessing:(BOOL)a6 delegate:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___IXSCoordinatorProgress;
  v16 = -[IXSCoordinatorProgress init](&v19, "init");
  p_isa = (id *)&v16->super.isa;
  if (v16)
  {
    v16->_progressPhase = 0LL;
    v16->_currentPhaseProgress = 0.0;
    v16->_totalUnitsCompleted = 0LL;
    v16->_totalUnits = a4;
    v16->_progressCompleted = 0;
    v16->_needsPostProcessing = a6;
    objc_storeStrong((id *)&v16->_progressHint, a5);
    objc_storeStrong(p_isa + 7, a3);
    objc_storeWeak(p_isa + 8, v15);
  }

  return p_isa;
}

- (id)description
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorProgress identity](self, "identity"));
  unint64_t v4 = -[IXSCoordinatorProgress progressPhase](self, "progressPhase");
  if (v4 >= 3) {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown progress value %lu",  v4));
  }
  else {
    v5 = off_1000CD108[v4];
  }
  -[IXSCoordinatorProgress currentPhaseProgress](self, "currentPhaseProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Progress for coordinator: %@, Phase: %@, Percentage: %f",  v3,  v5,  v6));

  return v7;
}

- (void)finishLoading
{
  if (!-[IXSCoordinatorProgress progressPhase](self, "progressPhase"))
  {
    self->_totalUnitsCompleted = self->_totalUnits;
    -[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]( self,  "_notifyDelegateAndUpdateProgressWithPhaseCompleted:",  1LL);
    -[IXSCoordinatorProgress setProgressPhase:](self, "setProgressPhase:", 1LL);
    -[IXSCoordinatorProgress setCurrentPhaseProgress:](self, "setCurrentPhaseProgress:", 0.0);
    self->_totalUnitsCompleted = 0LL;
    self->_totalUnits = 0LL;
  }

- (void)finishInstalling
{
  if ((id)-[IXSCoordinatorProgress progressPhase](self, "progressPhase") == (id)1
    && !-[IXSCoordinatorProgress progressCompleted](self, "progressCompleted"))
  {
    uint64_t v3 = -[IXSCoordinatorProgress needsPostProcessing](self, "needsPostProcessing") ^ 1;
    -[IXSCoordinatorProgress setProgressCompleted:](self, "setProgressCompleted:", v3);
    self->_totalUnitsCompleted = self->_totalUnits;
    -[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]( self,  "_notifyDelegateAndUpdateProgressWithPhaseCompleted:",  1LL);
    if ((v3 & 1) == 0)
    {
      -[IXSCoordinatorProgress setProgressPhase:](self, "setProgressPhase:", 2LL);
      -[IXSCoordinatorProgress setCurrentPhaseProgress:](self, "setCurrentPhaseProgress:", 0.0);
      self->_totalUnitsCompleted = 0LL;
      self->_totalUnits = 0LL;
    }
  }

- (void)finishPostProcessing
{
  if ((id)-[IXSCoordinatorProgress progressPhase](self, "progressPhase") == (id)2
    && !-[IXSCoordinatorProgress progressCompleted](self, "progressCompleted"))
  {
    -[IXSCoordinatorProgress setProgressCompleted:](self, "setProgressCompleted:", 1LL);
    self->_totalUnitsCompleted = self->_totalUnits;
    -[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]( self,  "_notifyDelegateAndUpdateProgressWithPhaseCompleted:",  1LL);
  }

+ (double)_computeOverallProgressForCurrentProgress:(double)a3 progressPhase:(unint64_t)a4 progressHint:(id)a5
{
  id v7 = a5;
  v8 = v7;
  double v9 = 0.0;
  if (a4 <= 2)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue([v7 loadingPhaseProportion]);
    if (a4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 loadingPhaseProportion]);
      [v11 doubleValue];
      double v9 = v12 * 100.0;

      id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 installingPhaseProportion]);
      if (a4 == 1)
      {
        v10 = v13;
      }

      else
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v8 installingPhaseProportion]);
        [v14 doubleValue];
        double v9 = v9 + v15 * 100.0;

        v10 = (void *)objc_claimAutoreleasedReturnValue([v8 postProcessingPhaseProportion]);
      }
    }

    [v10 doubleValue];
    double v9 = v9 + a3 * v16;
  }

  return v9;
}

- (void)_notifyDelegateAndUpdateProgressWithPhaseCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[IXSCoordinatorProgress totalUnits](self, "totalUnits"))
  {
    double v5 = (double)-[IXSCoordinatorProgress totalUnitsCompleted](self, "totalUnitsCompleted");
    double v6 = v5 / (double)-[IXSCoordinatorProgress totalUnits](self, "totalUnits") * 100.0;
    -[IXSCoordinatorProgress currentPhaseProgress](self, "currentPhaseProgress");
    if (v6 - v7 >= 1.0 || v3)
    {
      -[IXSCoordinatorProgress setCurrentPhaseProgress:](self, "setCurrentPhaseProgress:", v6);
      uint64_t v9 = objc_claimAutoreleasedReturnValue(-[IXSCoordinatorProgress delegate](self, "delegate"));
      v10 = (void *)v9;
      if (v9 && (objc_opt_respondsToSelector(v9, "didUpdateProgress:forPhase:overallProgress:") & 1) != 0)
      {
        v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
        double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          sub_10007A2C8((uint64_t)self, v12);
        }

        unint64_t v13 = -[IXSCoordinatorProgress progressPhase](self, "progressPhase");
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatorProgress progressHint](self, "progressHint"));
        +[IXSCoordinatorProgress _computeOverallProgressForCurrentProgress:progressPhase:progressHint:]( &OBJC_CLASS___IXSCoordinatorProgress,  "_computeOverallProgressForCurrentProgress:progressPhase:progressHint:",  v13,  v14,  v6);
        double v16 = v15;

        objc_msgSend( v10,  "didUpdateProgress:forPhase:overallProgress:",  -[IXSCoordinatorProgress progressPhase](self, "progressPhase"),  v6,  v16);
      }
    }
  }

- (void)setTotalUnitsCompleted:(unint64_t)a3
{
  if (-[IXSCoordinatorProgress progressCompleted](self, "progressCompleted") || self->_totalUnitsCompleted >= a3)
  {
    double v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "-[IXSCoordinatorProgress setTotalUnitsCompleted:]";
      __int16 v11 = 2112;
      double v12 = self;
      __int16 v13 = 2048;
      unint64_t v14 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Attempt to set units completed on finished progress: %llu",  (uint8_t *)&v9,  0x20u);
    }
  }

  else
  {
    unint64_t v5 = -[IXSCoordinatorProgress totalUnits](self, "totalUnits");
    if (v5 >= a3) {
      unint64_t v6 = a3;
    }
    else {
      unint64_t v6 = v5;
    }
    self->_totalUnitsCompleted = v6;
    -[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]( self,  "_notifyDelegateAndUpdateProgressWithPhaseCompleted:",  0LL);
  }

- (void)setTotalUnits:(unint64_t)a3
{
  if (self->_totalUnits != a3)
  {
    if (-[IXSCoordinatorProgress progressCompleted](self, "progressCompleted"))
    {
      unint64_t v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315650;
        v8 = "-[IXSCoordinatorProgress setTotalUnits:]";
        __int16 v9 = 2112;
        v10 = self;
        __int16 v11 = 2048;
        unint64_t v12 = a3;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Attempt to set total units on finished progress: %llu",  (uint8_t *)&v7,  0x20u);
      }
    }

    else if (-[IXSCoordinatorProgress totalUnitsCompleted](self, "totalUnitsCompleted") <= a3)
    {
      self->_totalUnits = a3;
      -[IXSCoordinatorProgress _notifyDelegateAndUpdateProgressWithPhaseCompleted:]( self,  "_notifyDelegateAndUpdateProgressWithPhaseCompleted:",  0LL);
    }
  }

- (unint64_t)totalUnitsCompleted
{
  return self->_totalUnitsCompleted;
}

- (unint64_t)totalUnits
{
  return self->_totalUnits;
}

- (unint64_t)progressPhase
{
  return self->_progressPhase;
}

- (void)setProgressPhase:(unint64_t)a3
{
  self->_progressPhase = a3;
}

- (double)currentPhaseProgress
{
  return self->_currentPhaseProgress;
}

- (void)setCurrentPhaseProgress:(double)a3
{
  self->_currentPhaseProgress = a3;
}

- (BOOL)progressCompleted
{
  return self->_progressCompleted;
}

- (void)setProgressCompleted:(BOOL)a3
{
  self->_progressCompleted = a3;
}

- (BOOL)needsPostProcessing
{
  return self->_needsPostProcessing;
}

- (void)setNeedsPostProcessing:(BOOL)a3
{
  self->_needsPostProcessing = a3;
}

- (IXProgressHint)progressHint
{
  return self->_progressHint;
}

- (void)setProgressHint:(id)a3
{
}

- (IXApplicationIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (IXSCoordinatorProgressDelegate)delegate
{
  return (IXSCoordinatorProgressDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
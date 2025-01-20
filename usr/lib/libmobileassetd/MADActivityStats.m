@interface MADActivityStats
- (MADActivityStats)init;
- (NSString)failureReason;
- (NSString)failureResultName;
- (NSString)firstAdditionalFailure;
- (NSString)firstSuccessIssue;
- (NSString)firstWarningMessage;
- (NSString)firstWarningMethod;
- (NSString)lastAdditionalFailure;
- (NSString)lastSuccessIssue;
- (NSString)lastWarningMessage;
- (NSString)lastWarningMethod;
- (int)failureResult;
- (unint64_t)additionalFailures;
- (unint64_t)allocationFailures;
- (unint64_t)associateReplyFailures;
- (unint64_t)successWithIssues;
- (unint64_t)successfulOperations;
- (unint64_t)totalWarnings;
- (void)setAdditionalFailures:(unint64_t)a3;
- (void)setAllocationFailures:(unint64_t)a3;
- (void)setAssociateReplyFailures:(unint64_t)a3;
- (void)setFailureReason:(id)a3;
- (void)setFailureResult:(int)a3;
- (void)setFailureResultName:(id)a3;
- (void)setFirstAdditionalFailure:(id)a3;
- (void)setFirstSuccessIssue:(id)a3;
- (void)setFirstWarningMessage:(id)a3;
- (void)setFirstWarningMethod:(id)a3;
- (void)setLastAdditionalFailure:(id)a3;
- (void)setLastSuccessIssue:(id)a3;
- (void)setLastWarningMessage:(id)a3;
- (void)setLastWarningMethod:(id)a3;
- (void)setSuccessWithIssues:(unint64_t)a3;
- (void)setSuccessfulOperations:(unint64_t)a3;
- (void)setTotalWarnings:(unint64_t)a3;
@end

@implementation MADActivityStats

- (MADActivityStats)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___MADActivityStats;
  v2 = -[MADActivityStats init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_successfulOperations = 0LL;
    v2->_successWithIssues = 0LL;
    firstSuccessIssue = v2->_firstSuccessIssue;
    v2->_firstSuccessIssue = 0LL;

    lastSuccessIssue = v3->_lastSuccessIssue;
    v3->_lastSuccessIssue = 0LL;

    firstWarningMethod = v3->_firstWarningMethod;
    v3->_totalWarnings = 0LL;
    v3->_firstWarningMethod = 0LL;

    firstWarningMessage = v3->_firstWarningMessage;
    v3->_firstWarningMessage = 0LL;

    lastWarningMethod = v3->_lastWarningMethod;
    v3->_lastWarningMethod = 0LL;

    lastWarningMessage = v3->_lastWarningMessage;
    v3->_lastWarningMessage = 0LL;

    v3->_failureResult = 0;
    v3->_allocationFailures = 0LL;
    v3->_associateReplyFailures = 0LL;
    failureResultName = v3->_failureResultName;
    v3->_failureResultName = 0LL;

    failureReason = v3->_failureReason;
    v3->_failureReason = 0LL;

    firstAdditionalFailure = v3->_firstAdditionalFailure;
    v3->_additionalFailures = 0LL;
    v3->_firstAdditionalFailure = 0LL;

    lastAdditionalFailure = v3->_lastAdditionalFailure;
    v3->_lastAdditionalFailure = 0LL;
  }

  return v3;
}

- (unint64_t)successfulOperations
{
  return self->_successfulOperations;
}

- (void)setSuccessfulOperations:(unint64_t)a3
{
  self->_successfulOperations = a3;
}

- (unint64_t)successWithIssues
{
  return self->_successWithIssues;
}

- (void)setSuccessWithIssues:(unint64_t)a3
{
  self->_successWithIssues = a3;
}

- (NSString)firstSuccessIssue
{
  return self->_firstSuccessIssue;
}

- (void)setFirstSuccessIssue:(id)a3
{
}

- (NSString)lastSuccessIssue
{
  return self->_lastSuccessIssue;
}

- (void)setLastSuccessIssue:(id)a3
{
}

- (unint64_t)totalWarnings
{
  return self->_totalWarnings;
}

- (void)setTotalWarnings:(unint64_t)a3
{
  self->_totalWarnings = a3;
}

- (NSString)firstWarningMethod
{
  return self->_firstWarningMethod;
}

- (void)setFirstWarningMethod:(id)a3
{
}

- (NSString)firstWarningMessage
{
  return self->_firstWarningMessage;
}

- (void)setFirstWarningMessage:(id)a3
{
}

- (NSString)lastWarningMethod
{
  return self->_lastWarningMethod;
}

- (void)setLastWarningMethod:(id)a3
{
}

- (NSString)lastWarningMessage
{
  return self->_lastWarningMessage;
}

- (void)setLastWarningMessage:(id)a3
{
}

- (unint64_t)allocationFailures
{
  return self->_allocationFailures;
}

- (void)setAllocationFailures:(unint64_t)a3
{
  self->_allocationFailures = a3;
}

- (unint64_t)associateReplyFailures
{
  return self->_associateReplyFailures;
}

- (void)setAssociateReplyFailures:(unint64_t)a3
{
  self->_associateReplyFailures = a3;
}

- (int)failureResult
{
  return self->_failureResult;
}

- (void)setFailureResult:(int)a3
{
  self->_failureResult = a3;
}

- (NSString)failureResultName
{
  return self->_failureResultName;
}

- (void)setFailureResultName:(id)a3
{
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
}

- (unint64_t)additionalFailures
{
  return self->_additionalFailures;
}

- (void)setAdditionalFailures:(unint64_t)a3
{
  self->_additionalFailures = a3;
}

- (NSString)firstAdditionalFailure
{
  return self->_firstAdditionalFailure;
}

- (void)setFirstAdditionalFailure:(id)a3
{
}

- (NSString)lastAdditionalFailure
{
  return self->_lastAdditionalFailure;
}

- (void)setLastAdditionalFailure:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
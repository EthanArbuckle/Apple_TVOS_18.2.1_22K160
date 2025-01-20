@interface CLDaemonMonitoringRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)conditionLimitExceeded;
- (BOOL)conditionUnsupported;
- (BOOL)isMonitoring;
- (BOOL)persistenceUnavailable;
- (BOOL)shouldSendEvent;
- (CLCondition)daemonCondition;
- (CLDaemonMonitoringRecord)initWithClientMonitoringRecord:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 initForStopMonitoring:(BOOL)a8 callbackHandler:(id)a9;
- (CLDaemonMonitoringRecord)initWithCoder:(id)a3;
- (CLMonitoringEvent)daemonEvent;
- (NSString)recordIdentifier;
- (id)debugDescription;
- (id)description;
- (id)getMonitoringRecordToNotifyClient;
- (unint64_t)clientState;
- (unint64_t)daemonState;
- (unint64_t)diagnosticMaskIfMonitoringIsNonFunctional;
- (unint64_t)serviceTypeMask;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetDaemonPartOfCondition;
- (void)setConditionLimitExceeded:(BOOL)a3;
- (void)setConditionUnsupported:(BOOL)a3;
- (void)setDaemonCondition:(id)a3;
- (void)setDaemonEvent:(id)a3;
- (void)setPersistenceUnavailable:(BOOL)a3;
- (void)setRecordIdentifier:(id)a3;
- (void)setupDaemonPartOfConditionWithAuthContext:(id)a3 clientKeyPath:(id)a4 universe:(id)a5 identifier:(id)a6 stopMonitoring:(BOOL)a7 callbackHandler:(id)a8;
- (void)updateClientEvent:(id)a3;
@end

@implementation CLDaemonMonitoringRecord

- (CLDaemonMonitoringRecord)initWithClientMonitoringRecord:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 initForStopMonitoring:(BOOL)a8 callbackHandler:(id)a9
{
  BOOL v9 = a8;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___CLDaemonMonitoringRecord;
  v15 = (CLDaemonMonitoringRecord *)-[CLDaemonMonitoringRecord initRecordWithMonitoringRecord:]( &v17,  "initRecordWithMonitoringRecord:");
  if (v15)
  {
    if (!v9) {
      a7 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"%@@%@",  a7,  [a3 identifier]);
    }
    -[CLDaemonMonitoringRecord setRecordIdentifier:](v15, "setRecordIdentifier:", a7);
    -[CLDaemonMonitoringRecord setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:]( v15,  "setupDaemonPartOfConditionWithAuthContext:clientKeyPath:universe:identifier:stopMonitoring:callbackHandler:",  a5,  a4,  a6,  -[CLDaemonMonitoringRecord recordIdentifier](v15, "recordIdentifier"),  v9,  a9);
  }

  return v15;
}

- (void)dealloc
{
  self->_daemonCondition = 0LL;
  -[CLDaemonMonitoringRecord setDaemonEvent:](self, "setDaemonEvent:", 0LL);

  self->_recordIdentifier = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord dealloc](&v3, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLDaemonMonitoringRecord.mm",  77LL,  @"Invalid parameter not satisfying: %@",  @"coder.requiresSecureCoding");
  }
  v6 = -[CLDaemonMonitoringRecord recordIdentifier](self, "recordIdentifier");
  [a3 encodeObject:v6 forKey:off_1019389B0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord encodeWithCoder:](&v7, "encodeWithCoder:", a3);
}

- (CLDaemonMonitoringRecord)initWithCoder:(id)a3
{
  if (([a3 requiresSecureCoding] & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLDaemonMonitoringRecord.mm",  83LL,  @"Invalid parameter not satisfying: %@",  @"coder.requiresSecureCoding");
  }
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___CLDaemonMonitoringRecord;
  v6 = -[CLDaemonMonitoringRecord initWithCoder:](&v8, "initWithCoder:", a3);
  if (v6) {
    -[CLDaemonMonitoringRecord setRecordIdentifier:]( v6,  "setRecordIdentifier:",  [a3 decodeObjectOfClass:objc_opt_class(NSString) forKey:off_1019389B0]);
  }
  return v6;
}

- (void)setupDaemonPartOfConditionWithAuthContext:(id)a3 clientKeyPath:(id)a4 universe:(id)a5 identifier:(id)a6 stopMonitoring:(BOOL)a7 callbackHandler:(id)a8
{
  BOOL v9 = a7;
  uint64_t v15 = objc_opt_class(-[CLDaemonMonitoringRecord condition](self, "condition"));
  if (v15 == objc_opt_class(&OBJC_CLASS___CLCircularGeographicCondition))
  {
    if (objc_msgSend(objc_msgSend(a5, "vendor"), "isServiceEnabled:", @"CLFenceManager"))
    {
      id v16 = -[CLDaemonCircularGeographicCondition initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMonitoring:callbackHandler:]( objc_alloc(&OBJC_CLASS___CLDaemonCircularGeographicCondition),  "initFromClientCondition:clientKeyPath:authorizationContext:universe:identifier:removePersistingFenceFromMo nitoring:callbackHandler:",  -[CLDaemonMonitoringRecord condition](self, "condition"),  a4,  a3,  a5,  a6,  v9,  a8);
      goto LABEL_10;
    }

- (void)resetDaemonPartOfCondition
{
  self->_daemonCondition = 0LL;
  -[CLDaemonMonitoringRecord setDaemonEvent:](self, "setDaemonEvent:", 0LL);
}

- (unint64_t)clientState
{
  return -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord clientEvent](self, "clientEvent"), "state");
}

- (unint64_t)daemonState
{
  return -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
}

- (BOOL)shouldSendEvent
{
  CLMonitoringState v3 = -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
  if (v3)
  {
    unint64_t v4 = -[CLDaemonMonitoringRecord clientState](self, "clientState");
    LOBYTE(v3) = v4 != -[CLMonitoringEvent state](-[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"), "state");
  }

  return v3;
}

- (void)updateClientEvent:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonMonitoringRecord;
  -[CLDaemonMonitoringRecord updateEvent:](&v3, "updateEvent:", a3);
}

- (id)getMonitoringRecordToNotifyClient
{
  return  -[CLMonitoringRecord initRecordWithCondition:options:event:]( objc_alloc(&OBJC_CLASS___CLMonitoringRecord),  "initRecordWithCondition:options:event:",  -[CLDaemonMonitoringRecord condition](self, "condition"),  -[CLDaemonMonitoringRecord options](self, "options"),  -[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent"));
}

- (id)debugDescription
{
  objc_super v3 = +[NSMutableString stringWithString:]( &OBJC_CLASS___NSMutableString,  "stringWithString:",  -[CLDaemonMonitoringRecord description](self, "description"));
  -[NSMutableString appendFormat:](v3, "appendFormat:", @", obj: %p", self);
  return v3;
}

- (id)description
{
  id v3 = +[NSMutableString string](&OBJC_CLASS___NSMutableString, "string");
  objc_msgSend( v3,  "appendString:",  objc_msgSend(-[CLDaemonMonitoringRecord condition](self, "condition"), "description"));
  objc_msgSend(v3, "appendFormat:", @", options: %lu", -[CLDaemonMonitoringRecord options](self, "options"));
  [v3 appendFormat:@", clientEvent: %@", -[CLDaemonMonitoringRecord clientEvent](self, "clientEvent")];
  [v3 appendFormat:@", daemonEvent: %@", -[CLDaemonMonitoringRecord daemonEvent](self, "daemonEvent")];
  return v3;
}

- (BOOL)isMonitoring
{
  return -[CLCondition isMonitoring]( -[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"),  "isMonitoring");
}

- (unint64_t)diagnosticMaskIfMonitoringIsNonFunctional
{
  unint64_t v3 = (unint64_t)objc_msgSend( -[CLCondition authorizationContext]( -[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"),  "authorizationContext"),  "diagnosticMask") & 3;
  if (!-[CLDaemonMonitoringRecord conditionLimitExceeded](self, "conditionLimitExceeded")
    && !-[CLDaemonMonitoringRecord conditionUnsupported](self, "conditionUnsupported")
    && !-[CLDaemonMonitoringRecord persistenceUnavailable](self, "persistenceUnavailable"))
  {
    v3 |= (unint64_t)-[CLCondition diagnosticMaskIfNonFunctional]( -[CLDaemonMonitoringRecord daemonCondition](self, "daemonCondition"),  "diagnosticMaskIfNonFunctional");
  }

  return v3;
}

- (unint64_t)serviceTypeMask
{
  id v4 = -[CLDaemonMonitoringRecord condition](self, "condition");
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___CLCircularGeographicCondition);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0) {
    return 2LL;
  }
  id v7 = -[CLDaemonMonitoringRecord condition](self, "condition");
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___CLBeaconIdentityCondition);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    return 1LL;
  }
  id v9 = -[CLDaemonMonitoringRecord condition](self, "condition");
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___CLMinimumAltitudeCondition);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"CLDaemonMonitoringRecord.mm",  258LL,  @"Condition type is not supported",  ", ",  "\"condition\",  ":",  "%{private, location:escape_only}@",  -[CLDaemonMonitoringRecord condition](self, "condition""));
  }
  return 16LL;
}

- (CLCondition)daemonCondition
{
  return self->_daemonCondition;
}

- (void)setDaemonCondition:(id)a3
{
}

- (CLMonitoringEvent)daemonEvent
{
  return self->_daemonEvent;
}

- (void)setDaemonEvent:(id)a3
{
}

- (NSString)recordIdentifier
{
  return self->_recordIdentifier;
}

- (void)setRecordIdentifier:(id)a3
{
}

- (BOOL)conditionLimitExceeded
{
  return self->_conditionLimitExceeded;
}

- (void)setConditionLimitExceeded:(BOOL)a3
{
  self->_conditionLimitExceeded = a3;
}

- (BOOL)persistenceUnavailable
{
  return self->_persistenceUnavailable;
}

- (void)setPersistenceUnavailable:(BOOL)a3
{
  self->_persistenceUnavailable = a3;
}

- (BOOL)conditionUnsupported
{
  return self->_conditionUnsupported;
}

- (void)setConditionUnsupported:(BOOL)a3
{
  self->_conditionUnsupported = a3;
}

@end
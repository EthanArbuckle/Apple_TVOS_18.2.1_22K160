@interface CLClientManagerAuthorizationContext
- (BOOL)authorizedForWidgetUpdates;
- (BOOL)inUseLevelIsAtLeast:(int)a3;
- (BOOL)isAuthorizedForServiceType:(unint64_t)a3;
- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3;
- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3;
- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8;
- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3;
- (id)description;
- (id)getStateSummary;
- (int)inUseLevel;
- (int)registrationResult;
- (int)transientAwareRegistrationResult;
- (unint64_t)diagnosticMask;
- (unint64_t)effectiveServiceMask;
- (unint64_t)provisionalServiceMask;
- (unint64_t)staticServiceMask;
@end

@implementation CLClientManagerAuthorizationContext

- (CLClientManagerAuthorizationContext)initWithInUseLevel:(int)a3 registrationResult:(int)a4 transientAwareRegistrationResult:(int)a5 serviceMaskTuple:(CLClientServiceTypeMaskTuple)a6 diagnosticMask:(unint64_t)a7 authorizedForWidgetUpdates:(BOOL)a8
{
  unint64_t var1 = a6.var1;
  unint64_t var0 = a6.var0;
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___CLClientManagerAuthorizationContext;
  result = -[CLClientManagerAuthorizationContext init](&v15, "init");
  if (result)
  {
    result->_registrationResult = a4;
    result->_inUseLevel = a3;
    result->_effectiveServiceMask = var0;
    result->_provisionalServiceMask = var1;
    result->_transientAwareRegistrationResult = a5;
    result->_diagnosticMask = a7;
    result->_authorizedForWidgetUpdates = a8;
  }

  return result;
}

- (id)authorizationContextByANDingServiceMaskTuple:(CLClientServiceTypeMaskTuple)a3
{
  v3 = self;
  uint64_t v4 = *((void *)self + 5);
  uint64_t v5 = *((void *)self + 6);
  unint64_t v6 = v4 & a3.var0;
  unint64_t v7 = v5 & a3.var1;
  if ((v4 & a3.var0) != v4 || v7 != v5)
  {
    v9 = objc_alloc(&OBJC_CLASS___CLClientManagerAuthorizationContext);
    LOBYTE(v10) = v3[8];
    return  -[CLClientManagerAuthorizationContext initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:authorizedForWidgetUpdates:]( v9,  "initWithInUseLevel:registrationResult:transientAwareRegistrationResult:serviceMaskTuple:diagnosticMask:au thorizedForWidgetUpdates:",  *((unsigned int *)v3 + 5),  *((unsigned int *)v3 + 4),  *((unsigned int *)v3 + 3),  v6,  v7,  *((void *)v3 + 3),  v10);
  }

  return self;
}

- (id)description
{
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"AuthContext InUse:%d  RegResult:%d(%d) EffectiveMask:%d  ProvisionalMask:%d  DiagnosticMask:%d",  self->_inUseLevel,  self->_registrationResult,  self->_transientAwareRegistrationResult,  self->_effectiveServiceMask,  self->_provisionalServiceMask,  self->_diagnosticMask);
}

- (BOOL)isNonProvisionallyAuthorizedForServiceTypeMask:(unint64_t)a3
{
  return (a3 & ~-[CLClientManagerAuthorizationContext effectiveServiceMask](self, "effectiveServiceMask")) == 0;
}

- (BOOL)isNonProvisionallyAuthorizedForServiceType:(unint64_t)a3
{
  return -[CLClientManagerAuthorizationContext isNonProvisionallyAuthorizedForServiceTypeMask:]( self,  "isNonProvisionallyAuthorizedForServiceTypeMask:",  1 << a3);
}

- (BOOL)isAuthorizedForServiceTypeMask:(unint64_t)a3
{
  unint64_t v5 = -[CLClientManagerAuthorizationContext effectiveServiceMask](self, "effectiveServiceMask");
  return (a3 & ~(-[CLClientManagerAuthorizationContext provisionalServiceMask](self, "provisionalServiceMask") | v5)) == 0;
}

- (BOOL)isAuthorizedForServiceType:(unint64_t)a3
{
  return -[CLClientManagerAuthorizationContext isAuthorizedForServiceTypeMask:]( self,  "isAuthorizedForServiceTypeMask:",  1 << a3);
}

- (BOOL)inUseLevelIsAtLeast:(int)a3
{
  return self->_inUseLevel >= a3;
}

- (BOOL)isEqual:(id)a3
{
  *(void *)&double v5 = objc_opt_class(self).n128_u64[0];
  unsigned int v7 = objc_msgSend(a3, "isMemberOfClass:", v6, v5);
  if (v7) {
    LOBYTE(v7) = self->_inUseLevel == *((_DWORD *)a3 + 5)
  }
              && self->_staticServiceMask == *((void *)a3 + 4)
              && self->_effectiveServiceMask == *((void *)a3 + 5)
              && self->_provisionalServiceMask == *((void *)a3 + 6)
              && self->_registrationResult == *((_DWORD *)a3 + 4)
              && self->_authorizedForWidgetUpdates == *((unsigned __int8 *)a3 + 8)
              && self->_transientAwareRegistrationResult == *((_DWORD *)a3 + 3)
              && self->_diagnosticMask == *((void *)a3 + 3);
  return v7;
}

- (id)getStateSummary
{
  id v3 = +[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  self->_inUseLevel),  @"InUseLevel");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  self->_effectiveServiceMask),  @"EffectiveServiceMask");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  self->_provisionalServiceMask),  @"ProvisionalServiceMask");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  self->_registrationResult),  @"RegistrationResult");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  self->_transientAwareRegistrationResult),  @"TransientAwareRegistrationResult");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_diagnosticMask),  @"DiagnosticMask");
  objc_msgSend( v3,  "setObject:forKeyedSubscript:",  +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_authorizedForWidgetUpdates),  @"AuthorizedForWidgetUpdates");
  return v3;
}

- (int)transientAwareRegistrationResult
{
  return self->_transientAwareRegistrationResult;
}

- (int)registrationResult
{
  return self->_registrationResult;
}

- (BOOL)authorizedForWidgetUpdates
{
  return self->_authorizedForWidgetUpdates;
}

- (int)inUseLevel
{
  return self->_inUseLevel;
}

- (unint64_t)diagnosticMask
{
  return self->_diagnosticMask;
}

- (unint64_t)staticServiceMask
{
  return self->_staticServiceMask;
}

- (unint64_t)effectiveServiceMask
{
  return self->_effectiveServiceMask;
}

- (unint64_t)provisionalServiceMask
{
  return self->_provisionalServiceMask;
}

@end
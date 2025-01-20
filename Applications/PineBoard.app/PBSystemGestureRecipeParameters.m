@interface PBSystemGestureRecipeParameters
- (NSSet)deferringTargetSystemGestureTypes;
- (NSSet)systemGestureRecognizerDescriptors;
- (PBSystemGestureFailurePolicy)failurePolicy;
- (PBSystemGestureRecipeParameters)init;
- (PBSystemGestureRecognitionPolicy)recognitionPolicy;
- (PBSystemGestureSimultaneousRecognitionPolicy)simultaneousRecognitionPolicy;
- (int64_t)level;
- (void)setDeferringTargetSystemGestureTypes:(id)a3;
- (void)setFailurePolicy:(id)a3;
- (void)setLevel:(int64_t)a3;
- (void)setRecognitionPolicy:(id)a3;
- (void)setSimultaneousRecognitionPolicy:(id)a3;
- (void)setSystemGestureRecognizerDescriptors:(id)a3;
@end

@implementation PBSystemGestureRecipeParameters

- (PBSystemGestureRecipeParameters)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecipeParameters;
  v2 = -[PBSystemGestureRecipeParameters init](&v6, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSSet set](&OBJC_CLASS___NSSet, "set"));
    systemGestureRecognizerDescriptors = v2->_systemGestureRecognizerDescriptors;
    v2->_systemGestureRecognizerDescriptors = (NSSet *)v3;
  }

  return v2;
}

- (void)setSystemGestureRecognizerDescriptors:(id)a3
{
  objc_super v6 = (NSSet *)a3;
  if (v6)
  {
    v7 = v6;
    systemGestureRecognizerDescriptors = self->_systemGestureRecognizerDescriptors;
    p_systemGestureRecognizerDescriptors = &self->_systemGestureRecognizerDescriptors;
    if (systemGestureRecognizerDescriptors != v6) {
      objc_storeStrong((id *)p_systemGestureRecognizerDescriptors, a3);
    }
  }

  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemGestureRecognizerDescriptors != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289CCC(a2);
    }
    _bs_set_crash_log_message([v10 UTF8String]);
    __break(0);
  }

- (NSSet)systemGestureRecognizerDescriptors
{
  return self->_systemGestureRecognizerDescriptors;
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (PBSystemGestureRecognitionPolicy)recognitionPolicy
{
  return self->_recognitionPolicy;
}

- (void)setRecognitionPolicy:(id)a3
{
}

- (PBSystemGestureSimultaneousRecognitionPolicy)simultaneousRecognitionPolicy
{
  return self->_simultaneousRecognitionPolicy;
}

- (void)setSimultaneousRecognitionPolicy:(id)a3
{
}

- (PBSystemGestureFailurePolicy)failurePolicy
{
  return self->_failurePolicy;
}

- (void)setFailurePolicy:(id)a3
{
}

- (NSSet)deferringTargetSystemGestureTypes
{
  return self->_deferringTargetSystemGestureTypes;
}

- (void)setDeferringTargetSystemGestureTypes:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

@end
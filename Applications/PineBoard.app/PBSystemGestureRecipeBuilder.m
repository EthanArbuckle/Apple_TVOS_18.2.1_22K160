@interface PBSystemGestureRecipeBuilder
- (NSMutableSet)deferringTargetSystemGestureTypes;
- (NSMutableSet)descriptors;
- (PBSystemGestureFailurePolicy)failurePolicy;
- (PBSystemGestureRecipeBuilder)initWithSystemGestureType:(unint64_t)a3;
- (PBSystemGestureRecognitionPolicy)recognitionPolicy;
- (PBSystemGestureSimultaneousRecognitionPolicy)simultaneousRecognitionPolicy;
- (id)build;
- (int64_t)layoutLevel;
- (unint64_t)systemGestureType;
- (void)_addButtonDownPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 withActivationMask:(unint64_t)a5;
- (void)_addGameControllerPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4;
- (void)_addLongPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 minimumPressDuration:(id)a5 withActivationMask:(unint64_t)a6;
- (void)_addPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4;
- (void)_addRepeatingPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 withActivationMask:(unint64_t)a5;
- (void)addButtonDownPressDescriptorForType:(int64_t)a3;
- (void)addButtonDownPressDescriptorForType:(int64_t)a3 numberOfCompletedTapsRequired:(unint64_t)a4;
- (void)addButtonDownPressDescriptorForType:(int64_t)a3 withActivationMask:(unint64_t)a4;
- (void)addButtonDownPressDescriptorForTypes:(id)a3 numberOfCompletedTapsRequired:(unint64_t)a4;
- (void)addDeferringTargetSystemGesture:(unint64_t)a3;
- (void)addGameControllerPressDescriptorForType:(int64_t)a3;
- (void)addGestureRecognizerDescriptor:(id)a3 withActivationMask:(unint64_t)a4;
- (void)addLongPressDescriptorForHomeWithMinimumPressDuration:(double)a3 activationMask:(unint64_t)a4;
- (void)addLongPressDescriptorForType:(int64_t)a3 minimumPressDuration:(double)a4;
- (void)addLongPressDescriptorForType:(int64_t)a3 minimumPressDuration:(double)a4 withActivationMask:(unint64_t)a5;
- (void)addLongPressDescriptorForType:(int64_t)a3 withActivationMask:(unint64_t)a4;
- (void)addLongPressDescriptorForTypes:(id)a3;
- (void)addPressDescriptorForType:(int64_t)a3;
- (void)addPressDescriptorForType:(int64_t)a3 numberOfTaps:(unint64_t)a4;
- (void)addPressDescriptorForTypes:(id)a3;
- (void)addPressDescriptorForTypes:(id)a3 numberOfTaps:(unint64_t)a4;
- (void)addRepeatingPressDescriptorForType:(int64_t)a3;
- (void)addSystemGestureRecognizerDescriptor:(id)a3;
- (void)setFailurePolicy:(id)a3;
- (void)setLayoutLevel:(int64_t)a3;
- (void)setRecognitionPolicy:(id)a3;
- (void)setSimultaneousRecognitionPolicy:(id)a3;
@end

@implementation PBSystemGestureRecipeBuilder

- (PBSystemGestureRecipeBuilder)initWithSystemGestureType:(unint64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecipeBuilder;
  v4 = -[PBSystemGestureRecipeBuilder init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_systemGestureType = a3;
    v4->_layoutLevel = -1LL;
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    descriptors = v5->_descriptors;
    v5->_descriptors = v6;
  }

  return v5;
}

- (void)addGestureRecognizerDescriptor:(id)a3 withActivationMask:(unint64_t)a4
{
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue([a3 systemGestureRecognizerDescriptorWithActivationMask:a4]);
    -[PBSystemGestureRecipeBuilder addSystemGestureRecognizerDescriptor:]( self,  "addSystemGestureRecognizerDescriptor:",  v5);
  }

- (void)addSystemGestureRecognizerDescriptor:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_descriptors, "addObject:");
  }
}

- (void)addDeferringTargetSystemGesture:(unint64_t)a3
{
  deferringTargetSystemGestureTypes = self->_deferringTargetSystemGestureTypes;
  if (!deferringTargetSystemGestureTypes)
  {
    v6 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    v7 = self->_deferringTargetSystemGestureTypes;
    self->_deferringTargetSystemGestureTypes = v6;

    deferringTargetSystemGestureTypes = self->_deferringTargetSystemGestureTypes;
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3));
  -[NSMutableSet addObject:](deferringTargetSystemGestureTypes, "addObject:", v8);
}

- (id)build
{
  v3 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureRecipeParameters);
  -[PBSystemGestureRecipeParameters setSystemGestureRecognizerDescriptors:]( v3,  "setSystemGestureRecognizerDescriptors:",  self->_descriptors);
  -[PBSystemGestureRecipeParameters setLevel:](v3, "setLevel:", self->_layoutLevel);
  -[PBSystemGestureRecipeParameters setRecognitionPolicy:](v3, "setRecognitionPolicy:", self->_recognitionPolicy);
  -[PBSystemGestureRecipeParameters setSimultaneousRecognitionPolicy:]( v3,  "setSimultaneousRecognitionPolicy:",  self->_simultaneousRecognitionPolicy);
  -[PBSystemGestureRecipeParameters setFailurePolicy:](v3, "setFailurePolicy:", self->_failurePolicy);
  id v4 = -[NSMutableSet copy](self->_deferringTargetSystemGestureTypes, "copy");
  -[PBSystemGestureRecipeParameters setDeferringTargetSystemGestureTypes:]( v3,  "setDeferringTargetSystemGestureTypes:",  v4);

  v5 = -[PBSystemGestureRecipe initWithType:parameters:]( objc_alloc(&OBJC_CLASS___PBSystemGestureRecipe),  "initWithType:parameters:",  self->_systemGestureType,  v3);
  return v5;
}

- (unint64_t)systemGestureType
{
  return self->_systemGestureType;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (void)setLayoutLevel:(int64_t)a3
{
  self->_layoutLevel = a3;
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

- (NSMutableSet)descriptors
{
  return self->_descriptors;
}

- (NSMutableSet)deferringTargetSystemGestureTypes
{
  return self->_deferringTargetSystemGestureTypes;
}

- (void).cxx_destruct
{
}

- (void)_addButtonDownPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 withActivationMask:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = -[PBButtonDownPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( objc_alloc(&OBJC_CLASS___PBButtonDownPressGestureRecognizerDescriptor),  "initWithAllowedPressTypes:numberOfTapsRequired:",  v9,  v8);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v10,  a5);
}

- (void)addButtonDownPressDescriptorForType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBSystemGestureRecipeBuilder _addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:]( self,  "_addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:",  v5,  0LL,  1LL);
}

- (void)addButtonDownPressDescriptorForType:(int64_t)a3 withActivationMask:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v8 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[PBSystemGestureRecipeBuilder _addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:]( self,  "_addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:",  v7,  0LL,  a4);
}

- (void)addButtonDownPressDescriptorForType:(int64_t)a3 numberOfCompletedTapsRequired:(unint64_t)a4
{
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[PBSystemGestureRecipeBuilder _addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:]( self,  "_addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:",  v7,  v8,  1LL);
}

- (void)addButtonDownPressDescriptorForTypes:(id)a3 numberOfCompletedTapsRequired:(unint64_t)a4
{
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[PBSystemGestureRecipeBuilder _addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:]( self,  "_addButtonDownPressDescriptorForTypes:numberOfTaps:withActivationMask:",  v6,  v7,  1LL);
}

- (void)_addGameControllerPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PBPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( objc_alloc(&OBJC_CLASS___PBGameControllerPressGestureRecognizerDescriptor),  "initWithAllowedPressTypes:numberOfTapsRequired:",  v7,  v6);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v8,  4LL);
}

- (void)addGameControllerPressDescriptorForType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBSystemGestureRecipeBuilder _addGameControllerPressDescriptorForTypes:numberOfTaps:]( self,  "_addGameControllerPressDescriptorForTypes:numberOfTaps:",  v5,  0LL);
}

- (void)_addPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[PBPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( objc_alloc(&OBJC_CLASS___PBPressGestureRecognizerDescriptor),  "initWithAllowedPressTypes:numberOfTapsRequired:",  v7,  v6);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v8,  4LL);
}

- (void)addPressDescriptorForType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBSystemGestureRecipeBuilder _addPressDescriptorForTypes:numberOfTaps:]( self,  "_addPressDescriptorForTypes:numberOfTaps:",  v5,  0LL);
}

- (void)addPressDescriptorForType:(int64_t)a3 numberOfTaps:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[PBSystemGestureRecipeBuilder _addPressDescriptorForTypes:numberOfTaps:]( self,  "_addPressDescriptorForTypes:numberOfTaps:",  v7,  v8);
}

- (void)addPressDescriptorForTypes:(id)a3
{
}

- (void)addPressDescriptorForTypes:(id)a3 numberOfTaps:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a4));
  -[PBSystemGestureRecipeBuilder _addPressDescriptorForTypes:numberOfTaps:]( self,  "_addPressDescriptorForTypes:numberOfTaps:",  v6,  v7);
}

- (void)_addLongPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 minimumPressDuration:(id)a5 withActivationMask:(unint64_t)a6
{
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = -[PBLongPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:]( objc_alloc(&OBJC_CLASS___PBLongPressGestureRecognizerDescriptor),  "initWithAllowedPressTypes:numberOfTapsRequired:minimumPressDuration:",  v12,  v11,  v10);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v13,  a6);
}

- (void)addLongPressDescriptorForType:(int64_t)a3 minimumPressDuration:(double)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v9 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  -[PBSystemGestureRecipeBuilder _addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:]( self,  "_addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:",  v7,  0LL,  v8,  1LL);
}

- (void)addLongPressDescriptorForType:(int64_t)a3 withActivationMask:(unint64_t)a4
{
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v8 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v8, 1LL));
  -[PBSystemGestureRecipeBuilder _addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:]( self,  "_addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:",  v7,  0LL,  0LL,  a4);
}

- (void)addLongPressDescriptorForType:(int64_t)a3 minimumPressDuration:(double)a4 withActivationMask:(unint64_t)a5
{
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v11 = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a4));
  -[PBSystemGestureRecipeBuilder _addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:]( self,  "_addLongPressDescriptorForTypes:numberOfTaps:minimumPressDuration:withActivationMask:",  v9,  0LL,  v10,  a5);
}

- (void)addLongPressDescriptorForTypes:(id)a3
{
}

- (void)addLongPressDescriptorForHomeWithMinimumPressDuration:(double)a3 activationMask:(unint64_t)a4
{
  id v7 = objc_alloc(&OBJC_CLASS___PBHomeLongPressGestureRecognizerDescriptor);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", a3));
  id v9 = -[PBHomeLongPressGestureRecognizerDescriptor initWithNumberOfTapsRequired:minimumPressDuration:]( v7,  "initWithNumberOfTapsRequired:minimumPressDuration:",  0LL,  v8);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v9,  a4);
}

- (void)_addRepeatingPressDescriptorForTypes:(id)a3 numberOfTaps:(id)a4 withActivationMask:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = -[PBPressGestureRecognizerDescriptor initWithAllowedPressTypes:numberOfTapsRequired:]( objc_alloc(&OBJC_CLASS___PBRepeatingPressGestureRecognizerDescriptor),  "initWithAllowedPressTypes:numberOfTapsRequired:",  v9,  v8);

  -[PBSystemGestureRecipeBuilder addGestureRecognizerDescriptor:withActivationMask:]( self,  "addGestureRecognizerDescriptor:withActivationMask:",  v10,  a5);
}

- (void)addRepeatingPressDescriptorForType:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](&OBJC_CLASS___NSNumber, "numberWithInteger:", a3));
  id v6 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v6, 1LL));
  -[PBSystemGestureRecipeBuilder _addRepeatingPressDescriptorForTypes:numberOfTaps:withActivationMask:]( self,  "_addRepeatingPressDescriptorForTypes:numberOfTaps:withActivationMask:",  v5,  0LL,  3LL);
}

@end
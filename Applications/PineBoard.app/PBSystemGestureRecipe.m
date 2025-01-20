@interface PBSystemGestureRecipe
+ (id)recipeForType:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isIndirect;
- (NSSet)deferringTargetSystemGestureTypes;
- (NSSet)systemGestureRecognizerDescriptors;
- (NSString)description;
- (PBSystemGestureFailurePolicy)failurePolicy;
- (PBSystemGestureRecipe)initWithType:(unint64_t)a3 parameters:(id)a4;
- (PBSystemGestureRecognitionPolicy)recognitionPolicy;
- (PBSystemGestureSimultaneousRecognitionPolicy)simultaneousRecognitionPolicy;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)level;
- (unint64_t)hash;
- (unint64_t)type;
@end

@implementation PBSystemGestureRecipe

+ (id)recipeForType:(unint64_t)a3
{
  v4 = -[PBSystemGestureRecipeBuilder initWithSystemGestureType:]( objc_alloc(&OBJC_CLASS___PBSystemGestureRecipeBuilder),  "initWithSystemGestureType:",  a3);
  v5 = v4;
  switch(a3)
  {
    case 1uLL:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:numberOfTaps:]( v4,  "addPressDescriptorForType:numberOfTaps:",  5LL,  3LL);
      v4 = v5;
      uint64_t v18 = 3LL;
      goto LABEL_35;
    case 2uLL:
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v19 menuLongPressDelayInSeconds];
      double v21 = v20;

      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForHomeWithMinimumPressDuration:activationMask:]( v5,  "addLongPressDescriptorForHomeWithMinimumPressDuration:activationMask:",  5LL,  v21);
      break;
    case 3uLL:
      goto LABEL_66;
    case 4uLL:
      uint64_t v18 = 2LL;
      goto LABEL_35;
    case 5uLL:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v22 menuLongPressDelayInSeconds];
      double v24 = v23;

      v25 = v5;
      uint64_t v26 = 5LL;
      goto LABEL_69;
    case 6uLL:
      goto LABEL_74;
    case 7uLL:
      goto LABEL_78;
    case 8uLL:
      uint64_t v27 = 8LL;
      goto LABEL_39;
    case 9uLL:
      uint64_t v27 = 9LL;
      goto LABEL_39;
    case 0xAuLL:
      uint64_t v27 = 10LL;
      goto LABEL_39;
    case 0xBuLL:
      uint64_t v9 = 11LL;
      goto LABEL_75;
    case 0xCuLL:
      uint64_t v10 = 11LL;
      goto LABEL_27;
    case 0xDuLL:
      uint64_t v9 = 12LL;
      goto LABEL_75;
    case 0xEuLL:
      uint64_t v10 = 12LL;
LABEL_27:
      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForType:withActivationMask:]( v4,  "addLongPressDescriptorForType:withActivationMask:",  v10,  13LL);
      break;
    case 0xFuLL:
      uint64_t v27 = 13LL;
      goto LABEL_39;
    case 0x10uLL:
      uint64_t v27 = 14LL;
      goto LABEL_39;
    case 0x11uLL:
      uint64_t v28 = 15LL;
      goto LABEL_33;
    case 0x12uLL:
      uint64_t v28 = 16LL;
LABEL_33:
      -[PBSystemGestureRecipeBuilder addRepeatingPressDescriptorForType:]( v4,  "addRepeatingPressDescriptorForType:",  v28);
      break;
    case 0x13uLL:
      uint64_t v11 = 6LL;
      uint64_t v12 = 5LL;
      goto LABEL_52;
    case 0x14uLL:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:numberOfTaps:]( v4,  "addPressDescriptorForType:numberOfTaps:",  5LL,  4LL);
      v4 = v5;
      uint64_t v18 = 4LL;
LABEL_35:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:numberOfTaps:]( v4,  "addPressDescriptorForType:numberOfTaps:",  101LL,  v18);
      break;
    case 0x15uLL:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v4, "addPressDescriptorForType:", 19LL);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v29 channelGuideLongPressDelayInSeconds];
      double v24 = v30;

      v25 = v5;
      uint64_t v26 = 19LL;
      goto LABEL_69;
    case 0x16uLL:
      uint64_t v9 = 21LL;
      goto LABEL_75;
    case 0x17uLL:
      uint64_t v9 = 104LL;
      goto LABEL_75;
    case 0x18uLL:
      goto LABEL_68;
    case 0x19uLL:
      uint64_t v27 = 20LL;
LABEL_39:
      -[PBSystemGestureRecipeBuilder addButtonDownPressDescriptorForType:]( v4,  "addButtonDownPressDescriptorForType:",  v27);
      break;
    case 0x1AuLL:
      uint64_t v11 = 102LL;
      goto LABEL_41;
    case 0x1BuLL:
      uint64_t v11 = 103LL;
LABEL_41:
      uint64_t v12 = 13LL;
      goto LABEL_52;
    case 0x1CuLL:
      v15 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureSwitchToATVSimultaneousRecognitionPolicy);
      -[PBSystemGestureRecipeBuilder setSimultaneousRecognitionPolicy:](v5, "setSimultaneousRecognitionPolicy:", v15);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForTypes:numberOfTaps:]( v5,  "addPressDescriptorForTypes:numberOfTaps:",  &off_1003FE6B0,  3LL);
      goto LABEL_49;
    case 0x1DuLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 12LL);
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      unsigned int v32 = [v31 allowPowerButtonToOpenControlCenter];

      if (v32) {
        -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 104LL);
      }
      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForTypes:]( v5,  "addLongPressDescriptorForTypes:",  &off_1003FE6B0);
      -[PBSystemGestureRecipeBuilder addGameControllerPressDescriptorForType:]( v5,  "addGameControllerPressDescriptorForType:",  101LL);
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v5, "addDeferringTargetSystemGesture:", 47LL);
      v33 = v5;
      uint64_t v34 = 55LL;
      goto LABEL_59;
    case 0x1EuLL:
      uint64_t v35 = 12LL;
      goto LABEL_71;
    case 0x1FuLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 12LL);
      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForTypes:]( v5,  "addLongPressDescriptorForTypes:",  &off_1003FE6B0);
      goto LABEL_72;
    case 0x20uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 2LL);
      v15 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureAppSwitcherFailurePolicy);
      -[PBSystemGestureRecipeBuilder setFailurePolicy:](v5, "setFailurePolicy:", v15);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 501LL);
      -[PBSystemGestureRecipeBuilder addButtonDownPressDescriptorForType:numberOfCompletedTapsRequired:]( v5,  "addButtonDownPressDescriptorForType:numberOfCompletedTapsRequired:",  101LL,  1LL);
      -[PBSystemGestureRecipeBuilder addButtonDownPressDescriptorForTypes:numberOfCompletedTapsRequired:]( v5,  "addButtonDownPressDescriptorForTypes:numberOfCompletedTapsRequired:",  &off_1003FE6B0,  1LL);
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v5, "addDeferringTargetSystemGesture:", 47LL);
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v5, "addDeferringTargetSystemGesture:", 34LL);
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v5, "addDeferringTargetSystemGesture:", 52LL);
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v5, "addDeferringTargetSystemGesture:", 55LL);
      goto LABEL_49;
    case 0x21uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 2LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 501LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 101LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:numberOfTaps:]( v5,  "addPressDescriptorForType:numberOfTaps:",  101LL,  2LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForTypes:numberOfTaps:]( v5,  "addPressDescriptorForTypes:numberOfTaps:",  &off_1003FE6B0,  1LL);
      break;
    case 0x22uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 6LL);
      goto LABEL_62;
    case 0x23uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 6LL);
      v4 = v5;
      uint64_t v11 = 6LL;
      uint64_t v12 = 4LL;
LABEL_52:
      -[PBSystemGestureRecipeBuilder addButtonDownPressDescriptorForType:withActivationMask:]( v4,  "addButtonDownPressDescriptorForType:withActivationMask:",  v11,  v12);
      break;
    case 0x24uLL:
      uint64_t v14 = 15LL;
      goto LABEL_65;
    case 0x25uLL:
      uint64_t v13 = 15LL;
      goto LABEL_77;
    case 0x26uLL:
      uint64_t v17 = 15LL;
      goto LABEL_55;
    case 0x27uLL:
      uint64_t v14 = 14LL;
      goto LABEL_65;
    case 0x28uLL:
      v15 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureSiriTapFailurePolicy);
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v5, "setLayoutLevel:", 6LL);
      goto LABEL_13;
    case 0x29uLL:
    case 0x2DuLL:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v6 microphoneLongPressDelayInSeconds];
      double v8 = v7;

      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForType:minimumPressDuration:withActivationMask:]( v5,  "addLongPressDescriptorForType:minimumPressDuration:withActivationMask:",  18LL,  13LL,  v8);
      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForType:minimumPressDuration:withActivationMask:]( v5,  "addLongPressDescriptorForType:minimumPressDuration:withActivationMask:",  504LL,  13LL,  v8);
      break;
    case 0x2AuLL:
      uint64_t v36 = 12LL;
      goto LABEL_61;
    case 0x2BuLL:
      v15 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureSiriTapFailurePolicy);
LABEL_13:
      -[PBSystemGestureRecipeBuilder setFailurePolicy:](v5, "setFailurePolicy:", v15);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 18LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 504LL);
      goto LABEL_49;
    case 0x2CuLL:
      v15 = objc_alloc_init(&OBJC_CLASS___PBSystemGestureSiriPreheatPolicy);
      -[PBSystemGestureRecipeBuilder setSimultaneousRecognitionPolicy:](v5, "setSimultaneousRecognitionPolicy:", v15);
      -[PBSystemGestureRecipeBuilder setFailurePolicy:](v5, "setFailurePolicy:", v15);
      -[PBSystemGestureRecipeBuilder addButtonDownPressDescriptorForType:]( v5,  "addButtonDownPressDescriptorForType:",  18LL);
LABEL_49:

      break;
    case 0x2EuLL:
      uint64_t v16 = 11LL;
      goto LABEL_58;
    case 0x2FuLL:
      uint64_t v36 = 7LL;
LABEL_61:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v36);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 5LL);
LABEL_62:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 101LL);
      goto LABEL_78;
    case 0x30uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 17LL);
      goto LABEL_66;
    case 0x31uLL:
      uint64_t v14 = 1LL;
LABEL_65:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v14);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 5LL);
LABEL_66:
      v4 = v5;
      uint64_t v9 = 101LL;
      goto LABEL_75;
    case 0x32uLL:
      uint64_t v16 = 10LL;
LABEL_58:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v16);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForTypes:](v5, "addPressDescriptorForTypes:", &off_1003FE6B0);
      v33 = v5;
      uint64_t v34 = 34LL;
LABEL_59:
      -[PBSystemGestureRecipeBuilder addDeferringTargetSystemGesture:](v33, "addDeferringTargetSystemGesture:", v34);
      break;
    case 0x33uLL:
      uint64_t v13 = 10LL;
      goto LABEL_77;
    case 0x35uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 21LL);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v5, "addPressDescriptorForType:", 104LL);
LABEL_68:
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
      [v37 powerLongPressDelayInSeconds];
      double v24 = v38;

      v25 = v5;
      uint64_t v26 = 104LL;
LABEL_69:
      -[PBSystemGestureRecipeBuilder addLongPressDescriptorForType:minimumPressDuration:]( v25,  "addLongPressDescriptorForType:minimumPressDuration:",  v26,  v24);
      break;
    case 0x36uLL:
      uint64_t v35 = 21LL;
LABEL_71:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v35);
      -[PBSystemGestureRecipeBuilder addPressDescriptorForTypes:](v5, "addPressDescriptorForTypes:", &off_1003FE6B0);
      goto LABEL_72;
    case 0x37uLL:
      uint64_t v13 = 1LL;
      goto LABEL_77;
    case 0x38uLL:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", 12LL);
LABEL_74:
      v4 = v5;
      uint64_t v9 = 5LL;
LABEL_75:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForType:](v4, "addPressDescriptorForType:", v9);
      break;
    case 0x39uLL:
      uint64_t v13 = 12LL;
LABEL_77:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v13);
LABEL_78:
      -[PBSystemGestureRecipeBuilder addPressDescriptorForTypes:](v5, "addPressDescriptorForTypes:", &off_1003FE6B0);
      break;
    case 0x3AuLL:
      uint64_t v17 = 12LL;
LABEL_55:
      -[PBSystemGestureRecipeBuilder setLayoutLevel:](v4, "setLayoutLevel:", v17);
LABEL_72:
      -[PBSystemGestureRecipeBuilder addGameControllerPressDescriptorForType:]( v5,  "addGameControllerPressDescriptorForType:",  101LL);
      break;
    default:
      break;
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureRecipeBuilder build](v5, "build"));

  return v39;
}

- (PBSystemGestureRecipe)initWithType:(unint64_t)a3 parameters:(id)a4
{
  id v7 = a4;
  Class v8 = NSClassFromString(@"PBSystemGestureRecipeParameters");
  if (!v7)
  {
    double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289C28(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x1001951B0LL);
  }

  if ((objc_opt_isKindOfClass(v7, v8) & 1) == 0)
  {
    double v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSystemGestureRecipeParametersClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100289C28(a2);
    }
    goto LABEL_11;
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBSystemGestureRecipe;
  uint64_t v9 = -[PBSystemGestureRecipe init](&v24, "init");
  if (v9)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 systemGestureRecognizerDescriptors]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v10));
    systemGestureRecognizerDescriptors = v9->_systemGestureRecognizerDescriptors;
    v9->_systemGestureRecognizerDescriptors = (NSSet *)v11;

    v9->_type = a3;
    v9->_level = (int64_t)[v7 level];
    uint64_t v13 = objc_claimAutoreleasedReturnValue([v7 recognitionPolicy]);
    recognitionPolicy = v9->_recognitionPolicy;
    v9->_recognitionPolicy = (PBSystemGestureRecognitionPolicy *)v13;

    uint64_t v15 = objc_claimAutoreleasedReturnValue([v7 simultaneousRecognitionPolicy]);
    simultaneousRecognitionPolicy = v9->_simultaneousRecognitionPolicy;
    v9->_simultaneousRecognitionPolicy = (PBSystemGestureSimultaneousRecognitionPolicy *)v15;

    uint64_t v17 = objc_claimAutoreleasedReturnValue([v7 failurePolicy]);
    failurePolicy = v9->_failurePolicy;
    v9->_failurePolicy = (PBSystemGestureFailurePolicy *)v17;

    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 deferringTargetSystemGestureTypes]);
    double v20 = (NSSet *)[v19 copy];
    deferringTargetSystemGestureTypes = v9->_deferringTargetSystemGestureTypes;
    v9->_deferringTargetSystemGestureTypes = v20;
  }

  return v9;
}

- (BOOL)isIndirect
{
  return -[NSSet count](self->_systemGestureRecognizerDescriptors, "count") == 0;
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureRecipe succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[BSDescriptionBuilder builderWithObject:]( &OBJC_CLASS___BSDescriptionBuilder,  "builderWithObject:",  self));
  v4 = sub_10006BC6C(self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 appendString:v5 withName:0];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecipe descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemGestureRecipe succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  [v5 setActiveMultilinePrefix:v4];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](self->_systemGestureRecognizerDescriptors, "allObjects"));
  [v5 appendArraySection:v6 withName:0 skipIfEmpty:0 objectTransformer:&stru_1003DABF0];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BSHashBuilder builder](&OBJC_CLASS___BSHashBuilder, "builder"));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = self->_systemGestureRecognizerDescriptors;
  id v5 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      Class v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = objc_unsafeClaimAutoreleasedReturnValue(objc_msgSend(v3, "appendObject:", *(void *)(*((void *)&v13 + 1)
                                                                                                 + 8LL * (void)v8), (void)v13));
        Class v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = -[NSSet countByEnumeratingWithState:objects:count:]( v4,  "countByEnumeratingWithState:objects:count:",  &v13,  v17,  16LL);
    }

    while (v6);
  }

  id v10 = [v3 appendUnsignedInteger:self->_type];
  id v11 = [v3 hash];

  return (unint64_t)v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = +[BSEqualsBuilder builderWithObject:ofExpectedClass:]( &OBJC_CLASS___BSEqualsBuilder,  "builderWithObject:ofExpectedClass:",  v4,  objc_opt_class(&OBJC_CLASS___PBSystemGestureRecipe));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  systemGestureRecognizerDescriptors = self->_systemGestureRecognizerDescriptors;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100195624;
  v19[3] = &unk_1003D2130;
  id v8 = v4;
  id v20 = v8;
  id v9 = [v6 appendObject:systemGestureRecognizerDescriptors counterpart:v19];
  unint64_t type = self->_type;
  __int128 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472LL;
  __int128 v16 = sub_100195640;
  uint64_t v17 = &unk_1003D2B80;
  id v18 = v8;
  id v11 = v8;
  id v12 = [v6 appendUnsignedInteger:type counterpart:&v14];
  LOBYTE(type) = objc_msgSend(v6, "isEqual", v14, v15, v16, v17);

  return type;
}

- (NSString)description
{
  return (NSString *)(id)objc_claimAutoreleasedReturnValue( -[PBSystemGestureRecipe descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL));
}

- (NSSet)systemGestureRecognizerDescriptors
{
  return self->_systemGestureRecognizerDescriptors;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)level
{
  return self->_level;
}

- (PBSystemGestureRecognitionPolicy)recognitionPolicy
{
  return self->_recognitionPolicy;
}

- (PBSystemGestureSimultaneousRecognitionPolicy)simultaneousRecognitionPolicy
{
  return self->_simultaneousRecognitionPolicy;
}

- (PBSystemGestureFailurePolicy)failurePolicy
{
  return self->_failurePolicy;
}

- (NSSet)deferringTargetSystemGestureTypes
{
  return self->_deferringTargetSystemGestureTypes;
}

- (void).cxx_destruct
{
}

@end
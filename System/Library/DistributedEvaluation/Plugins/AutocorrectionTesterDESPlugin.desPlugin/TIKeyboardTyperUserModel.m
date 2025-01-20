@interface TIKeyboardTyperUserModel
+ (id)defaultModel;
+ (id)modelWithName:(id)a3;
+ (id)typeVariantKeysModel;
- (BOOL)baseKeyForVariants;
- (BOOL)decomposeInputString;
- (BOOL)expectsAppendedSpaceToContinuousPath;
- (BOOL)prefersAutocorrectForApostrophes;
- (BOOL)prefersAutocorrectForCaps;
- (BOOL)prefersAutocorrectWithRevision;
- (BOOL)prefersContinuousPath;
- (BOOL)prefersInlineSelection;
- (BOOL)prefersManualRevisionForBadAutocorrect;
- (BOOL)prefersPredictionSelection;
- (BOOL)prefersSpaceBarDoubleTap;
- (BOOL)prefersToCorrectErrors;
- (BOOL)prefersTransliteration;
- (BOOL)spacesBetweenTransliterations;
- (BOOL)usePartialCandidates;
- (NSDictionary)parameters;
- (TIKeyboardTyperUserModel)initWithModel:(id)a3;
- (float)averageKeyTapsPerSecond;
- (float)probBeginCorrectingAfterWord;
- (float)probBeginCorrectingAfterWordTerminator;
- (float)probDoubleTapInitialLetter;
- (float)probDoubleTapLetter;
- (float)probExtraneousFinalKey;
- (float)probExtraneousInitialKey;
- (float)probExtraneousKey;
- (float)probRejectBadAutocorrection;
- (float)probSkipInitialLetter;
- (float)probSkipLetter;
- (float)probSkipRepeatLetter;
- (float)probSkipSpace;
- (float)probSubstituteInitialLetter;
- (float)probSubstituteLetter;
- (float)probSubstituteSpace;
- (float)probTransposeLetterAndSpace;
- (float)probTransposeLetters;
- (unint64_t)maxPriorSegmentsCheckedForErrors;
@end

@implementation TIKeyboardTyperUserModel

- (TIKeyboardTyperUserModel)initWithModel:(id)a3
{
  id v4 = a3;
  v102.receiver = self;
  v102.super_class = (Class)&OBJC_CLASS___TIKeyboardTyperUserModel;
  v5 = -[TIKeyboardTyperUserModel init](&v102, "init");
  if (v5)
  {
    id v6 = [v4 copy];
    v7 = (void *)*((void *)v5 + 13);
    *((void *)v5 + 13) = v6;

    v8 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_CONTINUOUS_PATH"]);
    v9 = v8;
    if (!v8) {
      v8 = @"NO";
    }
    v5[8] = -[__CFString BOOLValue](v8, "BOOLValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"CONTINUOUS_PATH_APPEND_SPACE"]);
    v11 = v10;
    if (!v10) {
      v10 = &__kCFBooleanFalse;
    }
    v5[9] = [v10 BOOLValue];

    v12 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"BASE_KEY_FOR_VARIANTS"]);
    v13 = v12;
    if (!v12) {
      v12 = @"YES";
    }
    v5[10] = -[__CFString BOOLValue](v12, "BOOLValue");

    v14 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_PREDICTION_SELECTION"]);
    v15 = v14;
    if (v14)
    {
      v5[11] = [v14 BOOLValue];
    }

    else
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_AUTOCORRECTION_LISTS"]);
      v17 = v16;
      if (!v16) {
        v16 = @"NO";
      }
      v5[11] = -[__CFString BOOLValue](v16, "BOOLValue");
    }

    v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_INLINE_SELECTION"]);
    v19 = v18;
    if (!v18) {
      v18 = @"NO";
    }
    v5[12] = -[__CFString BOOLValue](v18, "BOOLValue");

    v20 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_SPACEBAR_DOUBLETAP"]);
    v21 = v20;
    if (!v20) {
      v20 = @"NO";
    }
    v5[13] = -[__CFString BOOLValue](v20, "BOOLValue");

    v22 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_TO_CORRECT_ERRORS"]);
    v23 = v22;
    if (!v22) {
      v22 = @"NO";
    }
    v5[14] = -[__CFString BOOLValue](v22, "BOOLValue");

    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_AUTOCORRECT_FOR_CAPS"]);
    v25 = v24;
    if (!v24) {
      v24 = @"NO";
    }
    v5[16] = -[__CFString BOOLValue](v24, "BOOLValue");

    v26 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_AUTOCORRECT_FOR_APOSTROPHES"]);
    v27 = v26;
    if (!v26) {
      v26 = @"NO";
    }
    v5[17] = -[__CFString BOOLValue](v26, "BOOLValue");

    v28 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_MANUAL_REVISION_FOR_BAD_AUTOCORRECT"]);
    v29 = v28;
    if (!v28) {
      v28 = @"NO";
    }
    v5[22] = -[__CFString BOOLValue](v28, "BOOLValue");

    v30 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"DECOMPOSE_INPUT_STRING"]);
    v31 = v30;
    if (!v30) {
      v30 = @"NO";
    }
    v5[18] = -[__CFString BOOLValue](v30, "BOOLValue");

    v32 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_TRANSLITERATION"]);
    v33 = v32;
    if (!v32) {
      v32 = @"NO";
    }
    v5[19] = -[__CFString BOOLValue](v32, "BOOLValue");

    v34 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"TRANSLITERATE_WITH_SPACES"]);
    v35 = v34;
    if (!v34) {
      v34 = @"NO";
    }
    v5[20] = -[__CFString BOOLValue](v34, "BOOLValue");

    v36 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"USE_PARTIAL_CANDIDATES"]);
    v37 = v36;
    if (!v36) {
      v36 = @"0";
    }
    v5[21] = -[__CFString BOOLValue](v36, "BOOLValue");

    v38 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AVERAGE_KEY_TAPS_PER_SECOND"]);
    v39 = v38;
    if (!v38) {
      v38 = &off_8FF78;
    }
    [v38 floatValue];
    *((_DWORD *)v5 + 9) = v40;

    v41 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_BEGIN_CORRECTING_AFTER_WORD"]);
    v42 = v41;
    if (!v41) {
      v41 = &off_8FF88;
    }
    [v41 floatValue];
    *((_DWORD *)v5 + 6) = v43;

    v44 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_BEGIN_CORRECTING_AFTER_WORD_TERMINATOR"]);
    v45 = v44;
    if (!v44) {
      v44 = &off_8FF88;
    }
    [v44 floatValue];
    *((_DWORD *)v5 + 7) = v46;

    v47 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_REJECT_BAD_AUTOCORRECTION"]);
    v48 = v47;
    if (!v47) {
      v47 = &off_8FF88;
    }
    [v47 floatValue];
    *((_DWORD *)v5 + 8) = v49;

    v50 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"MAX_PRIOR_SEGMENTS_CHECKED_FOR_ERRORS"]);
    v51 = v50;
    if (!v50) {
      v50 = &off_8FF00;
    }
    *((void *)v5 + 12) = [v50 integerValue];

    v52 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_TRANSPOSE_LETTERS"]);
    v53 = v52;
    if (!v52) {
      v52 = &off_8FF88;
    }
    [v52 floatValue];
    *((_DWORD *)v5 + 10) = v54;

    v55 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_TRANSPOSE_LETTER_AND_SPACE"]);
    v56 = v55;
    if (!v55) {
      v55 = &off_8FF88;
    }
    [v55 floatValue];
    *((_DWORD *)v5 + 11) = v57;

    v58 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SKIP_LETTER"]);
    v59 = v58;
    if (!v58) {
      v58 = &off_8FF88;
    }
    [v58 floatValue];
    *((_DWORD *)v5 + 12) = v60;

    v61 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SKIP_INITIAL_LETTER"]);
    v62 = v61;
    if (!v61) {
      v61 = &off_8FF88;
    }
    [v61 floatValue];
    *((_DWORD *)v5 + 13) = v63;

    v64 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SKIP_REPEAT_LETTER"]);
    v65 = v64;
    if (!v64) {
      v64 = &off_8FF88;
    }
    [v64 floatValue];
    *((_DWORD *)v5 + 14) = v66;

    v67 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SKIP_SPACE"]);
    v68 = v67;
    if (!v67) {
      v67 = &off_8FF88;
    }
    [v67 floatValue];
    *((_DWORD *)v5 + 15) = v69;

    v70 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_DOUBLE_TAP_LETTER"]);
    v71 = v70;
    if (!v70) {
      v70 = &off_8FF88;
    }
    [v70 floatValue];
    *((_DWORD *)v5 + 16) = v72;

    v73 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_DOUBLE_TAP_INITIAL_LETTER"]);
    v74 = v73;
    if (!v73) {
      v73 = &off_8FF88;
    }
    [v73 floatValue];
    *((_DWORD *)v5 + 17) = v75;

    v76 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SUBSTITUTE_LETTER"]);
    v77 = v76;
    if (!v76) {
      v76 = &off_8FF88;
    }
    [v76 floatValue];
    *((_DWORD *)v5 + 18) = v78;

    v79 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SUBSTITUTE_INITIAL_LETTER"]);
    v80 = v79;
    if (!v79) {
      v79 = &off_8FF88;
    }
    [v79 floatValue];
    *((_DWORD *)v5 + 19) = v81;

    v82 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_SUBSTITUTE_SPACE"]);
    v83 = v82;
    if (!v82) {
      v82 = &off_8FF88;
    }
    [v82 floatValue];
    *((_DWORD *)v5 + 20) = v84;

    v85 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_EXTRANEOUS_KEY"]);
    v86 = v85;
    if (!v85) {
      v85 = &off_8FF88;
    }
    [v85 floatValue];
    *((_DWORD *)v5 + 21) = v87;

    v88 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_EXTRANEOUS_INITIAL_KEY"]);
    v89 = v88;
    if (!v88) {
      v88 = &off_8FF88;
    }
    [v88 floatValue];
    *((_DWORD *)v5 + 22) = v90;

    v91 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PROB_EXTRANEOUS_FINAL_KEY"]);
    v92 = v91;
    if (!v91) {
      v91 = &off_8FF88;
    }
    [v91 floatValue];
    *((_DWORD *)v5 + 23) = v93;

    v94 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"PREFERS_AUTOCORRECT_WITH_REVISION"]);
    v95 = v94;
    if (!v94) {
      v94 = @"NO";
    }
    v5[15] = -[__CFString BOOLValue](v94, "BOOLValue");

    if (v5[15] || TIIsRevision_Enabled())
    {
      v5[14] = 1;
      __asm { FMOV            V0.2S, #1.0 }

      *(void *)(v5 + 28) = _D0;
    }
  }

  return (TIKeyboardTyperUserModel *)v5;
}

+ (id)modelWithName:(id)a3
{
  id v3 = a3;
  id v4 = +[NSBundle bundleForClass:]( &OBJC_CLASS___NSBundle,  "bundleForClass:",  objc_opt_class(&OBJC_CLASS___TIKeyboardTyperUserModel));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 pathForResource:v3 ofType:@"plist"]);

  v7 = -[NSDictionary initWithContentsOfFile:](objc_alloc(&OBJC_CLASS___NSDictionary), "initWithContentsOfFile:", v6);
  v8 = -[TIKeyboardTyperUserModel initWithModel:]( objc_alloc(&OBJC_CLASS___TIKeyboardTyperUserModel),  "initWithModel:",  v7);

  return v8;
}

+ (id)defaultModel
{
  return +[TIKeyboardTyperUserModel modelWithName:]( &OBJC_CLASS___TIKeyboardTyperUserModel,  "modelWithName:",  @"DefaultModel");
}

+ (id)typeVariantKeysModel
{
  return +[TIKeyboardTyperUserModel modelWithName:]( &OBJC_CLASS___TIKeyboardTyperUserModel,  "modelWithName:",  @"TypeVariantKeys");
}

- (BOOL)prefersContinuousPath
{
  return self->_prefersContinuousPath;
}

- (BOOL)expectsAppendedSpaceToContinuousPath
{
  return self->_expectsAppendedSpaceToContinuousPath;
}

- (BOOL)baseKeyForVariants
{
  return self->_baseKeyForVariants;
}

- (BOOL)prefersPredictionSelection
{
  return self->_prefersPredictionSelection;
}

- (BOOL)prefersInlineSelection
{
  return self->_prefersInlineSelection;
}

- (BOOL)prefersSpaceBarDoubleTap
{
  return self->_prefersSpaceBarDoubleTap;
}

- (BOOL)prefersToCorrectErrors
{
  return self->_prefersToCorrectErrors;
}

- (BOOL)prefersAutocorrectWithRevision
{
  return self->_prefersAutocorrectWithRevision;
}

- (float)probBeginCorrectingAfterWord
{
  return self->_probBeginCorrectingAfterWord;
}

- (float)probBeginCorrectingAfterWordTerminator
{
  return self->_probBeginCorrectingAfterWordTerminator;
}

- (float)probRejectBadAutocorrection
{
  return self->_probRejectBadAutocorrection;
}

- (BOOL)prefersAutocorrectForCaps
{
  return self->_prefersAutocorrectForCaps;
}

- (BOOL)prefersAutocorrectForApostrophes
{
  return self->_prefersAutocorrectForApostrophes;
}

- (BOOL)decomposeInputString
{
  return self->_decomposeInputString;
}

- (BOOL)prefersTransliteration
{
  return self->_prefersTransliteration;
}

- (BOOL)spacesBetweenTransliterations
{
  return self->_spacesBetweenTransliterations;
}

- (BOOL)usePartialCandidates
{
  return self->_usePartialCandidates;
}

- (BOOL)prefersManualRevisionForBadAutocorrect
{
  return self->_prefersManualRevisionForBadAutocorrect;
}

- (float)averageKeyTapsPerSecond
{
  return self->_averageKeyTapsPerSecond;
}

- (unint64_t)maxPriorSegmentsCheckedForErrors
{
  return self->_maxPriorSegmentsCheckedForErrors;
}

- (float)probTransposeLetters
{
  return self->_probTransposeLetters;
}

- (float)probTransposeLetterAndSpace
{
  return self->_probTransposeLetterAndSpace;
}

- (float)probSkipLetter
{
  return self->_probSkipLetter;
}

- (float)probSkipInitialLetter
{
  return self->_probSkipInitialLetter;
}

- (float)probSkipRepeatLetter
{
  return self->_probSkipRepeatLetter;
}

- (float)probSkipSpace
{
  return self->_probSkipSpace;
}

- (float)probDoubleTapLetter
{
  return self->_probDoubleTapLetter;
}

- (float)probDoubleTapInitialLetter
{
  return self->_probDoubleTapInitialLetter;
}

- (float)probSubstituteLetter
{
  return self->_probSubstituteLetter;
}

- (float)probSubstituteInitialLetter
{
  return self->_probSubstituteInitialLetter;
}

- (float)probSubstituteSpace
{
  return self->_probSubstituteSpace;
}

- (float)probExtraneousKey
{
  return self->_probExtraneousKey;
}

- (float)probExtraneousInitialKey
{
  return self->_probExtraneousInitialKey;
}

- (float)probExtraneousFinalKey
{
  return self->_probExtraneousFinalKey;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
}

@end
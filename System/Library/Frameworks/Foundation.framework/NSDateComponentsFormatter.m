@interface NSDateComponentsFormatter
+ (NSString)localizedStringFromDateComponents:(NSDateComponents *)components unitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3;
- (BOOL)_updateFormatterCacheIfNeeded_locked:(id)a3 unitsStyle:(int64_t)a4;
- (BOOL)allowsFractionalUnits;
- (BOOL)collapsesLargestUnit;
- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error;
- (BOOL)includesApproximationPhrase;
- (BOOL)includesTimeRemainingPhrase;
- (NSCalendar)calendar;
- (NSCalendarUnit)allowedUnits;
- (NSDate)referenceDate;
- (NSDateComponentsFormatter)init;
- (NSDateComponentsFormatter)initWithCoder:(id)a3;
- (NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior;
- (NSFormattingContext)formattingContext;
- (NSInteger)maximumUnitCount;
- (NSString)stringForObjectValue:(id)obj;
- (NSString)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate;
- (NSString)stringFromDateComponents:(NSDateComponents *)components;
- (NSString)stringFromTimeInterval:(NSTimeInterval)ti;
- (id)_calendarFromDateComponents:(id)a3;
- (id)_calendarOrCanonicalCalendar;
- (id)_canonicalizedDateComponents:(id)a3 withCalendar:(id)a4 usedUnits:(unint64_t *)a5 withReferenceDate:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4;
- (void)_NSDateComponentsFormatter_commonInit;
- (void)_ensureUnitFormatterWithLocale:(id)a3;
- (void)_ensureUnitFormatterWithLocale_alreadyLocked:(id)a3;
- (void)_flushFormatterCache_locked;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)finalize;
- (void)receiveObservedValue:(id)a3;
- (void)setAllowedUnits:(NSCalendarUnit)allowedUnits;
- (void)setAllowsFractionalUnits:(BOOL)allowsFractionalUnits;
- (void)setCalendar:(NSCalendar *)calendar;
- (void)setCollapsesLargestUnit:(BOOL)collapsesLargestUnit;
- (void)setFormattingContext:(NSFormattingContext)formattingContext;
- (void)setIncludesApproximationPhrase:(BOOL)includesApproximationPhrase;
- (void)setIncludesTimeRemainingPhrase:(BOOL)includesTimeRemainingPhrase;
- (void)setMaximumUnitCount:(NSInteger)maximumUnitCount;
- (void)setReferenceDate:(NSDate *)referenceDate;
- (void)setUnitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle;
- (void)setZeroFormattingBehavior:(NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior;
@end

@implementation NSDateComponentsFormatter

- (void)_NSDateComponentsFormatter_commonInit
{
  self->_lock._os_unfair_lock_opaque = 0;
  self->_calendar = (NSCalendar *)(id)[MEMORY[0x189603F38] autoupdatingCurrentCalendar];
}

- (NSDateComponentsFormatter)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
  v2 = -[NSDateComponentsFormatter init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[NSDateComponentsFormatter _NSDateComponentsFormatter_commonInit](v2, "_NSDateComponentsFormatter_commonInit");
    v3->_zeroFormattingBehavior = 1LL;
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
  -[NSDateComponentsFormatter dealloc](&v3, sel_dealloc);
}

- (void)finalize
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
  -[NSDateComponentsFormatter finalize](&v4, sel_finalize);
}

- (void)_flushFormatterCache_locked
{
  if (self->_fmt)
  {
    uatmufmt_close();
    self->_fmt = 0LL;
  }

  self->_fmtLocaleIdent = 0LL;
  self->_unitFormatter = 0LL;
}

- (BOOL)_updateFormatterCacheIfNeeded_locked:(id)a3 unitsStyle:(int64_t)a4
{
  if (self->_fmt && -[NSString isEqualToString:](self->_fmtLocaleIdent, "isEqualToString:", a3)) {
    return 1;
  }
  os_unfair_lock_unlock(&self->_lock);
  [a3 UTF8String];
  if (a4 == 4)
  {
    unum_open();
    os_unfair_lock_lock(&self->_lock);
    -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  }

  else
  {
    os_unfair_lock_lock(&self->_lock);
    -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  }

  self->_fmt = (void *)uatmufmt_openWithNumberFormat();
  self->_fmtLocaleIdent = (NSString *)[a3 copy];
  return 1;
}

- (id)_canonicalizedDateComponents:(id)a3 withCalendar:(id)a4 usedUnits:(unint64_t *)a5 withReferenceDate:(id)a6
{
  id v8 = a4;
  uint64_t v76 = *MEMORY[0x1895F89C0];
  unint64_t allowedUnits = self->_allowedUnits;
  if (!allowedUnits)
  {
    uint64_t v12 = 4 * ([a3 year] != 0x7FFFFFFFFFFFFFFFLL);
    uint64_t v13 = v12 | (8 * ([a3 month] != 0x7FFFFFFFFFFFFFFFLL));
    unint64_t v14 = v13 | ((unint64_t)([a3 weekOfMonth] != 0x7FFFFFFFFFFFFFFFLL) << 12);
    uint64_t v15 = v14 | (16 * ([a3 day] != 0x7FFFFFFFFFFFFFFFLL));
    uint64_t v16 = v15 | (32 * ([a3 hour] != 0x7FFFFFFFFFFFFFFFLL));
    unint64_t v17 = v16 | ((unint64_t)([a3 minute] != 0x7FFFFFFFFFFFFFFFLL) << 6);
    unint64_t allowedUnits = v17 | ((unint64_t)([a3 second] != 0x7FFFFFFFFFFFFFFFLL) << 7);
    id v8 = a4;
  }

  int64_t unitsStyle = self->_unitsStyle;
  if (!unitsStyle)
  {
    int v19 = 0;
    int v20 = 0;
    do
    {
      if ((*(void *)((_BYTE *)&unk_1839428B8 + unitsStyle) & ~allowedUnits) != 0)
      {
        v20 |= v19;
      }

      else
      {
        if ((v19 & v20 & 1) != 0) {
          objc_exception_throw((id)objc_msgSend( MEMORY[0x189603F70],  "exceptionWithName:reason:userInfo:",  *MEMORY[0x189603A60],  @"Specifying positional units with gaps is ambiguous, and therefore unsupported",  0));
        }
        int v19 = 1;
      }

      unitsStyle += 8LL;
    }

    while (unitsStyle != 56);
  }

  if (!a6) {
    a6 = (id)[MEMORY[0x189603F50] dateWithTimeIntervalSinceReferenceDate:0.0];
  }
  uint64_t v21 = [v8 dateByAddingComponents:a3 toDate:a6 options:0];
  uint64_t v22 = [v8 components:allowedUnits fromDate:a6 toDate:v21 options:0];
  v23 = (void *)v22;
  if (self->_collapsesLargestUnit || self->_maximumUnitCount >= 1)
  {
    uint64_t v75 = 0LL;
    memset(v74, 0, sizeof(v74));
    uint64_t v73 = 0LL;
    memset(v72, 0, sizeof(v72));
    v70[0] = 0LL;
    v70[1] = v70;
    v70[2] = 0x2020000000LL;
    int v71 = 0;
    v69[0] = MEMORY[0x1895F87A8];
    v69[1] = 3221225472LL;
    v69[2] = __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke;
    v69[3] = &unk_189C9F688;
    v69[4] = v22;
    v69[5] = v70;
    v69[6] = v72;
    v69[7] = v74;
    forEachUnit(allowedUnits, (uint64_t)v69);
    v66 = a5;
    v68 = self;
    if (self->_collapsesLargestUnit)
    {
      uint64_t v24 = 0LL;
      uint64_t v25 = -1LL;
      do
      {
        if (!*((void *)v74 + v24)) {
          goto LABEL_28;
        }
        uint64_t v26 = *((void *)v72 + v24);
        if (!v26) {
          goto LABEL_28;
        }
        if (v26 == 1 && v25 == -1)
        {
          v28 = (char *)v74 + 8 * v24;
          uint64_t v29 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", *((void *)v28 + 1));
          v31 = (char *)v72 + 8 * v24;
          uint64_t v32 = *((void *)v31 + 1);
          double v33 = (double)v30 * 0.1;
          if (v33 <= (double)(unint64_t)(v32 - v29) && v33 <= (double)(v29 + v30 - v32))
          {
LABEL_27:
            uint64_t v25 = v24;
            goto LABEL_28;
          }

          allowedUnits &= ~*((void *)v74 + v24);
          v23 = (void *)[v8 components:allowedUnits fromDate:a6 toDate:v21 options:0];
          *((void *)v72 + v24) = 0LL;
          uint64_t v34 = [v23 valueForComponent:*((void *)v28 + 1)];
          uint64_t v25 = v24 + 1;
          *((void *)v31 + 1) = v34;
        }

        else if (v25 == -1)
        {
          goto LABEL_27;
        }

uint64_t __99__NSDateComponentsFormatter__canonicalizedDateComponents_withCalendar_usedUnits_withReferenceDate___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  *(void *)(*(void *)(a1 + 48) + 8LL * *(int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) = result;
  *(void *)(*(void *)(a1 + 56) + 8LL * (int)(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))++) = a2;
  return result;
}

- (id)_calendarOrCanonicalCalendar
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    if (qword_18C64DF40 != -1) {
      dispatch_once(&qword_18C64DF40, &__block_literal_global_33);
    }
    objc_super v4 = (NSCalendar *)(id)_MergedGlobals_6;
  }

  return v4;
}

uint64_t __57__NSDateComponentsFormatter__calendarOrCanonicalCalendar__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189603F38]);
  _MergedGlobals_6 = [v0 initWithCalendarIdentifier:*MEMORY[0x1896039C8]];
  return objc_msgSend( (id)_MergedGlobals_6,  "setLocale:",  objc_msgSend(MEMORY[0x189603F90], "localeWithLocaleIdentifier:", @"en_US_POSIX"));
}

- (id)_calendarFromDateComponents:(id)a3
{
  id result = (id)[a3 calendar];
  if (!result) {
    return -[NSDateComponentsFormatter _calendarOrCanonicalCalendar](self, "_calendarOrCanonicalCalendar");
  }
  return result;
}

- (NSString)stringFromDate:(NSDate *)startDate toDate:(NSDate *)endDate
{
  if (!startDate)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSDateComponentsFormatter.m",  318LL,  @"Invalid parameter not satisfying: %@",  @"startDate != nil");
    if (endDate) {
      goto LABEL_3;
    }
LABEL_11:
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSDateComponentsFormatter.m",  319LL,  @"Invalid parameter not satisfying: %@",  @"endDate != nil");
    goto LABEL_3;
  }

  if (!endDate) {
    goto LABEL_11;
  }
LABEL_3:
  id v8 = -[NSDateComponentsFormatter _calendarOrCanonicalCalendar](self, "_calendarOrCanonicalCalendar");
  if (self->_allowedUnits) {
    unint64_t allowedUnits = self->_allowedUnits;
  }
  else {
    unint64_t allowedUnits = 4348LL;
  }
  return (NSString *)-[NSDateComponentsFormatter stringForObjectValue:withReferenceDate:]( self,  "stringForObjectValue:withReferenceDate:",  [v8 components:allowedUnits fromDate:startDate toDate:endDate options:0],  startDate);
}

- (void)_ensureUnitFormatterWithLocale_alreadyLocked:(id)a3
{
  unitFormatter = self->_unitFormatter;
  if (!unitFormatter)
  {
    uint64_t v6 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
    self->_unitFormatter = v6;
    -[NSNumberFormatter setFormatterBehavior:](v6, "setFormatterBehavior:", 1040LL);
    -[NSNumberFormatter setPaddingCharacter:](self->_unitFormatter, "setPaddingCharacter:", @"0");
    -[NSNumberFormatter setMinimumFractionDigits:](self->_unitFormatter, "setMinimumFractionDigits:", 0LL);
    -[NSNumberFormatter setUsesGroupingSeparator:](self->_unitFormatter, "setUsesGroupingSeparator:", 1LL);
    -[NSNumberFormatter setRoundingMode:](self->_unitFormatter, "setRoundingMode:", 1LL);
    unitFormatter = self->_unitFormatter;
  }

  if (self->_unitsStyle == 4) {
    uint64_t v7 = 5LL;
  }
  else {
    uint64_t v7 = 1LL;
  }
  -[NSNumberFormatter setNumberStyle:](unitFormatter, "setNumberStyle:", v7);
  if (self->_allowsFractionalUnits) {
    uint64_t v8 = 3LL;
  }
  else {
    uint64_t v8 = 0LL;
  }
  -[NSNumberFormatter setMaximumFractionDigits:](self->_unitFormatter, "setMaximumFractionDigits:", v8);
  -[NSNumberFormatter setLocale:](self->_unitFormatter, "setLocale:", a3);
}

- (void)_ensureUnitFormatterWithLocale:(id)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSDateComponentsFormatter _ensureUnitFormatterWithLocale_alreadyLocked:]( self,  "_ensureUnitFormatterWithLocale_alreadyLocked:",  a3);
  os_unfair_lock_unlock(p_lock);
}

+ (NSString)localizedStringFromDateComponents:(NSDateComponents *)components unitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  id v6 = objc_alloc_init((Class)a1);
  [v6 setUnitsStyle:unitsStyle];
  uint64_t v7 = (NSString *)[v6 stringFromDateComponents:components];

  return v7;
}

- (NSString)stringFromTimeInterval:(NSTimeInterval)ti
{
  if ((*(void *)&ti & 0x7FFFFFFFFFFFFFFFuLL) >= 0x7FF0000000000000LL) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSDateComponentsFormatter.m",  484LL,  @"Invalid parameter not satisfying: %@",  @"isfinite(timeInterval) && !isnan(timeInterval)");
  }
  id v5 = objc_alloc_init(MEMORY[0x189603F58]);
  [v5 setSecond:(uint64_t)ti];
  [v5 setMinute:0];
  [v5 setHour:0];
  [v5 setDay:0];
  [v5 setWeekOfMonth:0];
  [v5 setMonth:0];
  [v5 setYear:0];
  id v6 = -[NSDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:", v5);

  return v6;
}

- (NSString)stringFromDateComponents:(NSDateComponents *)components
{
  if (!components) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSDateComponentsFormatter.m",  499LL,  @"Invalid parameter not satisfying: %@",  @"components != nil");
  }
  return -[NSDateComponentsFormatter stringForObjectValue:](self, "stringForObjectValue:", components);
}

- (NSString)stringForObjectValue:(id)obj
{
  return (NSString *)-[NSDateComponentsFormatter stringForObjectValue:withReferenceDate:]( self,  "stringForObjectValue:withReferenceDate:",  obj,  self->_referenceDate);
}

- (id)stringForObjectValue:(id)a3 withReferenceDate:(id)a4
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  if (!a3 || (objc_opt_isKindOfClass() & 1) == 0) {
    return 0LL;
  }
  context = (void *)MEMORY[0x186E1FF60]();
  id v7 = -[NSDateComponentsFormatter _calendarFromDateComponents:](self, "_calendarFromDateComponents:", a3);
  uint64_t v8 = (void *)[v7 locale];
  if (!v8) {
    uint64_t v8 = (void *)[MEMORY[0x189603F90] autoupdatingCurrentLocale];
  }
  if (!objc_msgSend((id)objc_msgSend(v8, "localeIdentifier"), "length")) {
    uint64_t v8 = (void *)[MEMORY[0x189603F90] autoupdatingCurrentLocale];
  }
  v98 = v8;
  v99 = (void *)[v8 localeIdentifier];
  [v99 UTF8String];
  unint64_t zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior == 1)
  {
    int v9 = 14;
    if (!self->_unitsStyle) {
      int v9 = 2;
    }
    LODWORD(zeroFormattingBehavior) = v9;
  }

  uint64_t v110 = 0LL;
  v100 = self;
  id v10 = -[NSDateComponentsFormatter _canonicalizedDateComponents:withCalendar:usedUnits:withReferenceDate:]( self,  "_canonicalizedDateComponents:withCalendar:usedUnits:withReferenceDate:",  a3,  v7,  &v110,  a4);
  uint64_t v139 = 0LL;
  memset(v138, 0, sizeof(v138));
  memset_pattern16(__b, &unk_183942910, 0x38uLL);
  v108[0] = 0LL;
  v108[1] = v108;
  v108[2] = 0x2020000000LL;
  int v109 = 0;
  uint64_t v11 = MEMORY[0x1895F87A8];
  v107[0] = MEMORY[0x1895F87A8];
  v107[1] = 3221225472LL;
  v107[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke;
  v107[3] = &unk_189C9F688;
  v107[4] = v10;
  v107[5] = v108;
  v107[6] = __b;
  v107[7] = v138;
  forEachUnit(v110, (uint64_t)v107);
  if ((zeroFormattingBehavior & 2) != 0)
  {
    for (uint64_t i = 0LL; i != 7; ++i)
    {
      uint64_t v13 = __b[i];
      if (v13 != 0x8000000000000000LL)
      {
        if (v13) {
          break;
        }
        __b[i] = 0x8000000000000000LL;
        *(void *)((char *)v138 + i * 8) = 0LL;
      }
    }
  }

  if ((zeroFormattingBehavior & 8) != 0)
  {
    for (uint64_t j = 6LL; j != -1; --j)
    {
      uint64_t v15 = __b[j];
      if (v15 != 0x8000000000000000LL)
      {
        if (v15) {
          break;
        }
        __b[j] = 0x8000000000000000LL;
        *(void *)((char *)v138 + j * 8) = 0LL;
      }
    }
  }

  if ((zeroFormattingBehavior & 4) != 0)
  {
    for (uint64_t k = 0LL; k != 7; ++k)
    {
      if (__b[k] != 0x8000000000000000LL) {
        break;
      }
    }

    for (int m = 6; m != -1; --m)
    {
      if (__b[m] != 0x8000000000000000LL) {
        break;
      }
    }

    if ((int)k < m)
    {
      unint64_t v18 = m - (unint64_t)k;
      int v19 = (void *)v138 + k;
      int v20 = &__b[k];
      do
      {
        if (!*v20)
        {
          *int v20 = 0x8000000000000000LL;
          *int v19 = 0LL;
        }

        ++v19;
        ++v20;
        --v18;
      }

      while (v18);
    }
  }

  uint64_t v21 = 0LL;
  unint64_t unitsStyle = self->_unitsStyle;
  while (!*(void *)((char *)v138 + v21))
  {
    v21 += 8LL;
    if (v21 == 56)
    {
      *(void *)&__int128 v117 = 0LL;
      *((void *)&v117 + 1) = &v117;
      __int128 v118 = 0x2020000000uLL;
      v106[0] = v11;
      v106[1] = 3221225472LL;
      v106[2] = __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2;
      v106[3] = &unk_189C9F6D0;
      v106[4] = v10;
      v106[5] = &v117;
      forEachUnit(v110, (uint64_t)v106);
      *(void *)&v138[0] = *(void *)(*((void *)&v117 + 1) + 24LL);
      __b[0] = 0LL;
      _Block_object_dispose(&v117, 8);
      break;
    }
  }

  if (unitsStyle)
  {
    uint64_t v102 = 0x8000000000000000LL;
    unint64_t v103 = 0x8000000000000000LL;
    uint64_t v101 = 0x8000000000000000LL;
    v23 = v8;
    uint64_t v24 = self;
  }

  else
  {
    uint64_t v26 = 0LL;
    uint64_t v101 = 0x8000000000000000LL;
    uint64_t v102 = 0x8000000000000000LL;
    unint64_t v103 = 0x8000000000000000LL;
    v23 = v8;
    uint64_t v24 = self;
    do
    {
      uint64_t v27 = *(void *)((char *)v138 + v26 * 8);
      switch(v27)
      {
        case 32LL:
          unint64_t v103 = __b[v26];
          break;
        case 64LL:
          uint64_t v102 = __b[v26];
          break;
        case 128LL:
          uint64_t v101 = __b[v26];
          break;
      }

      ++v26;
    }

    while (v26 != 7);
  }

  uint64_t v28 = 0LL;
  unint64_t v29 = 0LL;
  uint64_t v136 = 0LL;
  memset(v135, 0, sizeof(v135));
  uint64_t v134 = 0LL;
  memset(v133, 0, sizeof(v133));
  do
  {
    uint64_t v30 = *(void *)((char *)v138 + v28 * 8);
    if (v30)
    {
      *((void *)v135 + v29) = v30;
      *((void *)v133 + v29++) = __b[v28];
      *(void *)((char *)v138 + v28 * 8) = 0LL;
    }

    ++v28;
  }

  while (v28 != 7);
  if (v29 >= 2)
  {
    unint64_t v31 = v29 - 1;
    uint64_t v32 = (uint64_t *)v133 + 1;
    do
    {
      uint64_t v33 = *v32;
      if (*v32 < 0) {
        uint64_t v33 = -v33;
      }
      *v32++ = v33;
      --v31;
    }

    while (v31);
  }

  if (!unitsStyle)
  {
    os_unfair_lock_lock(&v24->_lock);
    -[NSDateComponentsFormatter _ensureUnitFormatterWithLocale_alreadyLocked:]( v24,  "_ensureUnitFormatterWithLocale_alreadyLocked:",  v23);
    id v35 = (id)-[NSNumberFormatter copy](v24->_unitFormatter, "copy");
    uint64_t v36 = v35;
    if ((zeroFormattingBehavior & 0x10000) != 0) {
      [v35 setMinimumIntegerDigits:2];
    }
    os_unfair_lock_unlock(&v24->_lock);
    BOOL v37 = v101 == 0x8000000000000000LL || v102 == 0x8000000000000000LL;
    int v38 = !v37;
    if (v37 || v103 == 0x8000000000000000LL)
    {
      if (v38)
      {
        uint64_t v42 = v101;
        if (v101 < 0) {
          uint64_t v42 = -v101;
        }
        uint64_t v101 = v42;
      }

      else
      {
        if (v102 == 0x8000000000000000LL || v103 == 0x8000000000000000LL)
        {
          v105 = 0LL;
          BOOL v70 = v103 == 0x8000000000000000LL && v102 == 0x8000000000000000LL && v101 == 0x8000000000000000LL;
          if (!v70 && v29 == 1)
          {
            if (!v24->_includesTimeRemainingPhrase && !v24->_includesApproximationPhrase)
            {
              v93 = objc_alloc(&OBJC_CLASS___NSNumber);
              uint64_t v94 = v101;
              if (v102 != 0x8000000000000000LL) {
                uint64_t v94 = v102;
              }
              if (v103 == 0x8000000000000000LL) {
                unint64_t v95 = v94;
              }
              else {
                unint64_t v95 = v103;
              }
              v96 = -[NSNumber initWithInteger:](v93, "initWithInteger:", v95);
              uint64_t v34 = (NSMutableString *)(id)objc_msgSend( (id)objc_msgSend(v36, "stringFromNumber:", v96),  "mutableCopy");

              goto LABEL_151;
            }

            v105 = 0LL;
            unint64_t v29 = 1LL;
            [0 insertString:@"{0} " atIndex:0];
            goto LABEL_108;
          }

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  *(void *)(*(void *)(a1 + 48) + 8LL * *(int *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) = result;
  *(void *)(*(void *)(a1 + 56) + 8LL * (int)(*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))++) = a2;
  return result;
}

uint64_t __68__NSDateComponentsFormatter_stringForObjectValue_withReferenceDate___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) valueForComponent:a2];
  if (result != 0x7FFFFFFFFFFFFFFFLL) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = a2;
  }
  return result;
}

- (void)setAllowedUnits:(NSCalendarUnit)allowedUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t allowedUnits = allowedUnits;
  os_unfair_lock_unlock(p_lock);
}

- (NSCalendarUnit)allowedUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSCalendarUnit allowedUnits = self->_allowedUnits;
  os_unfair_lock_unlock(p_lock);
  return allowedUnits;
}

- (void)setMaximumUnitCount:(NSInteger)maximumUnitCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_uint64_t maximumUnitCount = maximumUnitCount;
  os_unfair_lock_unlock(p_lock);
}

- (NSInteger)maximumUnitCount
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSInteger maximumUnitCount = self->_maximumUnitCount;
  os_unfair_lock_unlock(p_lock);
  return maximumUnitCount;
}

- (void)setAllowsFractionalUnits:(BOOL)allowsFractionalUnits
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_allowsFractionalUnits = allowsFractionalUnits;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)allowsFractionalUnits
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_allowsFractionalUnits;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setCollapsesLargestUnit:(BOOL)collapsesLargestUnit
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_collapsesLargestUnit = collapsesLargestUnit;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)collapsesLargestUnit
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_collapsesLargestUnit;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (NSCalendar)calendar
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_calendar;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCalendar:(NSCalendar *)calendar
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_calendar;
  if (v6 != calendar)
  {
    self->_calendar = (NSCalendar *)-[NSCalendar copy](calendar, "copy");
  }

  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(p_lock);
}

- (void)setUnitsStyle:(NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  if ((unint64_t)unitsStyle >= (NSDateComponentsFormatterUnitsStyleSpellOut|NSDateComponentsFormatterUnitsStyleShort)) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSDateComponentsFormatter.m",  914LL,  @"Invalid parameter not satisfying: %@",  @"unitsStyle == NSDateComponentsFormatterUnitsStyleSpellOut || unitsStyle == NSDateComponentsFormatterUnitsStyleFull || unitsStyle == NSDateComponentsFormatterUnitsStyleShort || unitsStyle == NSDateComponentsFormatterUnitsStyleAbbreviated || unitsStyle == NSDateComponentsFormatterUnitsStylePositional || unitsStyle == NSDateComponentsFormatterUnitsStyleBrief");
  }
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t unitsStyle = unitsStyle;
  -[NSDateComponentsFormatter _flushFormatterCache_locked](self, "_flushFormatterCache_locked");
  os_unfair_lock_unlock(&self->_lock);
}

- (NSDateComponentsFormatterUnitsStyle)unitsStyle
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateComponentsFormatterUnitsStyle unitsStyle = self->_unitsStyle;
  os_unfair_lock_unlock(p_lock);
  return unitsStyle;
}

- (void)setZeroFormattingBehavior:(NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t zeroFormattingBehavior = zeroFormattingBehavior;
  os_unfair_lock_unlock(p_lock);
}

- (NSDateComponentsFormatterZeroFormattingBehavior)zeroFormattingBehavior
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSDateComponentsFormatterZeroFormattingBehavior zeroFormattingBehavior = self->_zeroFormattingBehavior;
  os_unfair_lock_unlock(p_lock);
  return zeroFormattingBehavior;
}

- (void)setIncludesApproximationPhrase:(BOOL)includesApproximationPhrase
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesApproximationPhrase = includesApproximationPhrase;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)includesApproximationPhrase
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesApproximationPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIncludesTimeRemainingPhrase:(BOOL)includesTimeRemainingPhrase
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_includesTimeRemainingPhrase = includesTimeRemainingPhrase;
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)includesTimeRemainingPhrase
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_includesTimeRemainingPhrase;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setFormattingContext:(NSFormattingContext)formattingContext
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_formattingContext = formattingContext;
  os_unfair_lock_unlock(p_lock);
}

- (NSFormattingContext)formattingContext
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  NSFormattingContext formattingContext = self->_formattingContext;
  os_unfair_lock_unlock(p_lock);
  return formattingContext;
}

- (NSDate)referenceDate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_super v4 = self->_referenceDate;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setReferenceDate:(NSDate *)referenceDate
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = self->_referenceDate;
  if (v6 != referenceDate)
  {
    self->_referenceDate = (NSDate *)-[NSDate copy](referenceDate, "copy");
  }

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)getObjectValue:(id *)obj forString:(NSString *)string errorDescription:(NSString *)error
{
  if (getObjectValue_forString_errorDescription__onceToken != -1) {
    dispatch_once(&getObjectValue_forString_errorDescription__onceToken, &__block_literal_global_57);
  }
  return 0;
}

void __71__NSDateComponentsFormatter_getObjectValue_forString_errorDescription___block_invoke()
{
}

- (BOOL)_mayDecorateAttributedStringForObjectValue:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a3 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
    return -[NSFormatter _mayDecorateAttributedStringForObjectValue:]( &v9,  sel__mayDecorateAttributedStringForObjectValue_,  a3);
  }

  else
  {
    id v5 = (objc_class *)objc_opt_class();
    MethodImplementatiouint64_t n = class_getMethodImplementation(v5, sel_attributedStringForObjectValue_withDefaultAttributes_);
    id v7 = (objc_class *)objc_opt_class();
    return MethodImplementation != class_getMethodImplementation( v7,  sel_attributedStringForObjectValue_withDefaultAttributes_);
  }

- (NSDateComponentsFormatter)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDateComponentsFormatter cannot be decoded by non-keyed archivers" userInfo:0]);
  }

  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
  id v5 = -[NSFormatter initWithCoder:](&v8, sel_initWithCoder_, a3);
  id v6 = v5;
  if (v5)
  {
    -[NSDateComponentsFormatter _NSDateComponentsFormatter_commonInit](v5, "_NSDateComponentsFormatter_commonInit");
    v6->_NSCalendarUnit allowedUnits = [a3 decodeIntegerForKey:@"NS.allowedUnits"];
    v6->_allowsFractionalUnits = [a3 decodeBoolForKey:@"NS.allowsFractionalUnits"];
    v6->_calendar = (NSCalendar *)objc_msgSend( (id)objc_msgSend(a3, "decodeObjectForKey:", @"NS.calendar"),  "copy");
    v6->_collapsesLargestUnit = [a3 decodeBoolForKey:@"NS.collapsesLargestUnit"];
    v6->_includesApproximationPhrase = [a3 decodeBoolForKey:@"NS.includesApproximationPhrase"];
    v6->_includesTimeRemainingPhrase = [a3 decodeBoolForKey:@"NS.includesTimeRemainingPhrase"];
    v6->_NSInteger maximumUnitCount = [a3 decodeIntegerForKey:@"NS.maximumUnitCount"];
    v6->_NSDateComponentsFormatterUnitsStyle unitsStyle = [a3 decodeIntegerForKey:@"NS.unitsStyle"];
    v6->_NSDateComponentsFormatterZeroFormattingBehavior zeroFormattingBehavior = (int)[a3 decodeInt32ForKey:@"NS.zeroFormattingBehavior"];
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:@"NSDateComponentsFormatter cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  os_unfair_lock_lock(&self->_lock);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
  -[NSFormatter encodeWithCoder:](&v7, sel_encodeWithCoder_, a3);
  [a3 encodeInteger:self->_allowedUnits forKey:@"NS.allowedUnits"];
  if (self->_allowsFractionalUnits) {
    [a3 encodeBool:1 forKey:@"NS.allowsFractionalUnits"];
  }
  [a3 encodeObject:self->_calendar forKey:@"NS.calendar"];
  if (self->_collapsesLargestUnit) {
    [a3 encodeBool:1 forKey:@"NS.collapsesLargestUnit"];
  }
  if (self->_includesApproximationPhrase) {
    [a3 encodeBool:1 forKey:@"NS.includesApproximationPhrase"];
  }
  if (self->_includesTimeRemainingPhrase) {
    [a3 encodeBool:1 forKey:@"NS.includesTimeRemainingPhrase"];
  }
  int64_t maximumUnitCount = self->_maximumUnitCount;
  if (maximumUnitCount) {
    [a3 encodeInteger:maximumUnitCount forKey:@"NS.maximumUnitCount"];
  }
  [a3 encodeInteger:self->_unitsStyle forKey:@"NS.unitsStyle"];
  unint64_t zeroFormattingBehavior = self->_zeroFormattingBehavior;
  if (zeroFormattingBehavior != 1) {
    [a3 encodeInt32:zeroFormattingBehavior forKey:@"NS.zeroFormattingBehavior"];
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  [v6 setAllowedUnits:self->_allowedUnits];
  [v6 setAllowsFractionalUnits:self->_allowsFractionalUnits];
  [v6 setCalendar:self->_calendar];
  [v6 setCollapsesLargestUnit:self->_collapsesLargestUnit];
  [v6 setIncludesApproximationPhrase:self->_includesApproximationPhrase];
  [v6 setIncludesTimeRemainingPhrase:self->_includesTimeRemainingPhrase];
  [v6 setMaximumUnitCount:self->_maximumUnitCount];
  [v6 setUnitsStyle:self->_unitsStyle];
  [v6 setZeroFormattingBehavior:self->_zeroFormattingBehavior];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)receiveObservedValue:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSObservationFormatterSupport.m",  29LL,  @"Invalid parameter not satisfying: %@",  @"!value || [value isKindOfClass:STATIC_CLASS_REF(NSDateComponents)]");
    }
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
    -[NSDateComponentsFormatter receiveObservedValue:]( &v6,  sel_receiveObservedValue_,  -[NSDateComponentsFormatter stringFromDateComponents:](self, "stringFromDateComponents:", a3));
  }

  else
  {
    v7.receiver = self;
    v7.super_class = (Class)&OBJC_CLASS___NSDateComponentsFormatter;
    -[NSDateComponentsFormatter receiveObservedValue:](&v7, sel_receiveObservedValue_, 0LL);
  }

@end
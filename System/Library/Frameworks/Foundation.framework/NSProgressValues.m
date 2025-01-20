@interface NSProgressValues
+ (BOOL)supportsSecureCoding;
+ (id)_importantKeys;
+ (id)decodableClasses;
- (BOOL)isFinished;
- (BOOL)isIndeterminate;
- (NSProgressValues)init;
- (NSProgressValues)initWithCoder:(id)a3;
- (_NSProgressFraction)overallFraction;
- (double)fractionCompleted;
- (id)_indentedDescription:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)completedUnitCount;
- (int64_t)totalUnitCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCompletedUnitCount:(int64_t)a3;
- (void)setTotalUnitCount:(int64_t)a3;
@end

@implementation NSProgressValues

- (NSProgressValues)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProgressValues;
  result = -[NSProgressValues init](&v3, sel_init);
  if (result)
  {
    result->_isCancellable = 1;
    *(_OWORD *)&result->_selfFraction.overflowed = 0u;
    *(_OWORD *)&result->_childFraction.total = 0u;
    *(_OWORD *)&result->_selfFraction.completed = 0u;
    result->_childFraction.total = 1LL;
  }

  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v4 + 8) = -[NSMutableDictionary mutableCopy](self->_userInfo, "mutableCopy");
  uint64_t v5 = *(void *)&self->_selfFraction.overflowed;
  *(_OWORD *)(v4 + 16) = *(_OWORD *)&self->_selfFraction.completed;
  *(void *)(v4 + 32) = v5;
  __int128 v6 = *(_OWORD *)&self->_childFraction.completed;
  *(void *)(v4 + 56) = *(void *)&self->_childFraction.overflowed;
  *(_OWORD *)(v4 + 40) = v6;
  *(void *)(v4 + 72) = -[NSString copy](self->_localizedDescription, "copy");
  *(void *)(v4 + 80) = -[NSString copy](self->_localizedAdditionalDescription, "copy");
  *(_BYTE *)(v4 + 104) = self->_isCancellable;
  *(_BYTE *)(v4 + 105) = self->_isPausable;
  *(_BYTE *)(v4 + 106) = self->_isCancelled;
  *(_BYTE *)(v4 + 107) = self->_isPaused;
  *(void *)(v4 + 88) = -[NSString mutableCopy](self->_kind, "mutableCopy");
  *(_BYTE *)(v4 + 109) = self->_isPrioritizable;
  return (id)v4;
}

+ (id)_importantKeys
{
  return (id)objc_msgSend(MEMORY[0x189604010], "setWithObjects:", @"totalUnitCount", 0);
}

- (id)_indentedDescription:(unint64_t)a3
{
  v9[5] = *MEMORY[0x1895F89C0];
  uint64_t v5 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  for (i = +[NSString string](&OBJC_CLASS___NSMutableString, "string"); a3; --a3)
    -[NSString appendString:](i, "appendString:", @"  ");
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"%@self: %@",  i,  _NSProgressFractionDescription(&self->_selfFraction.completed));
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@children: %@",  i,  _NSProgressFractionDescription(&self->_childFraction.completed));
  -[NSString appendFormat:](v5, "appendFormat:", @"\n%@localizedDescription: %@", i, self->_localizedDescription);
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@localizedAdditionalDescription: %@",  i,  self->_localizedAdditionalDescription);
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@isCancellable: %@",  i,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isCancellable));
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@isPausable: %@",  i,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPausable));
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@isCancelled: %@",  i,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isCancelled));
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@isPaused: %@",  i,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPaused));
  -[NSString appendFormat:]( v5,  "appendFormat:",  @"\n%@isPrioritizable: %@",  i,  +[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", self->_isPrioritizable));
  -[NSString appendFormat:](v5, "appendFormat:", @"\n%@kind: %@", i, self->_kind);
  -[NSString appendFormat:](v5, "appendFormat:", @"\n%@userInfo: {", i);
  userInfo = self->_userInfo;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __41__NSProgressValues__indentedDescription___block_invoke;
  v9[3] = &unk_189C9A768;
  v9[4] = v5;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](userInfo, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSString deleteCharactersInRange:](v5, "deleteCharactersInRange:", -[NSString length](v5, "length") - 2, 2LL);
  -[NSString appendFormat:](v5, "appendFormat:", @"}");
  return v5;
}

uint64_t __41__NSProgressValues__indentedDescription___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@ : %@, ", a2, a3];
}

- (id)description
{
  return -[NSProgressValues _indentedDescription:](self, "_indentedDescription:", 0LL);
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSProgressValues;
  -[NSProgressValues dealloc](&v3, sel_dealloc);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)decodableClasses
{
  if (qword_18C496238 != -1) {
    dispatch_once(&qword_18C496238, &__block_literal_global_125);
  }
  return (id)qword_18C496240;
}

uint64_t __36__NSProgressValues_decodableClasses__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x189604010]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t result = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  qword_18C496240 = result;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  v11[6] = *MEMORY[0x1895F89C0];
  Class v5 = objc_lookUpClass("NSImage");
  userInfo = self->_userInfo;
  if (v5)
  {
    uint64_t v7 = -[NSMutableDictionary mutableCopy](userInfo, "mutableCopy");
    uint64_t v8 = self->_userInfo;
    v11[1] = 3221225472LL;
    v11[2] = __36__NSProgressValues_encodeWithCoder___block_invoke;
    v11[3] = &unk_189CA2930;
    v11[4] = v5;
    v11[5] = v7;
    v9 = (NSMutableDictionary *)v7;
    v11[0] = MEMORY[0x1895F87A8];
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  }

  else
  {
    v9 = userInfo;
  }

  objc_msgSend(a3, "encodeObject:forKey:", v9, @"userInfo", v9);
  [a3 encodeInt64:self->_selfFraction.completed forKey:@"selfFraction.completed"];
  [a3 encodeInt64:self->_selfFraction.total forKey:@"selfFraction.total"];
  [a3 encodeBool:self->_selfFraction.overflowed forKey:@"selfFraction.overflowed"];
  [a3 encodeInt64:self->_childFraction.completed forKey:@"childFraction.completed"];
  [a3 encodeInt64:self->_childFraction.total forKey:@"childFraction.total"];
  [a3 encodeBool:self->_childFraction.overflowed forKey:@"childFraction.overflowed"];
  [a3 encodeObject:self->_localizedDescription forKey:@"localizedDescription"];
  [a3 encodeObject:self->_localizedAdditionalDescription forKey:@"localizedAdditionalDescription"];
  [a3 encodeBool:self->_isCancellable forKey:@"cancellable"];
  [a3 encodeBool:self->_isPausable forKey:@"pausable"];
  [a3 encodeBool:self->_isCancelled forKey:@"cancelled"];
  [a3 encodeBool:self->_isPaused forKey:@"paused"];
  [a3 encodeObject:self->_kind forKey:@"kind"];
  [a3 encodeBool:self->_isPrioritizable forKey:@"prioritizable"];
}

uint64_t __36__NSProgressValues_encodeWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    [*(id *)(a1 + 40) removeObjectForKey:a2];
    uint64_t result = [a3 performSelector:sel_TIFFRepresentation];
    if (result) {
      return objc_msgSend( *(id *)(a1 + 40),  "setObject:forKey:",  result,  objc_msgSend(a2, "stringByAppendingString:", @".data"));
    }
  }

  return result;
}

- (NSProgressValues)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSProgressValues;
  uint64_t v4 = -[NSProgressValues init](&v6, sel_init);
  if (v4)
  {
    v4->_userInfo = (NSMutableDictionary *)(id)objc_msgSend( a3,  "decodeObjectOfClasses:forKey:",  objc_msgSend( (id)objc_msgSend(a3, "allowedClasses"),  "setByAddingObjectsFromSet:",  objc_msgSend((id)objc_opt_class(), "decodableClasses")),  @"userInfo");
    v4->_selfFraction.completed = [a3 decodeInt64ForKey:@"selfFraction.completed"];
    v4->_selfFraction.total = [a3 decodeInt64ForKey:@"selfFraction.total"];
    v4->_selfFraction.overflowed = [a3 decodeInt64ForKey:@"selfFraction.overflowed"] != 0;
    v4->_childFraction.completed = [a3 decodeInt64ForKey:@"childFraction.completed"];
    v4->_childFraction.total = [a3 decodeInt64ForKey:@"childFraction.total"];
    v4->_childFraction.overflowed = [a3 decodeInt64ForKey:@"childFraction.overflowed"] != 0;
    v4->_localizedDescription = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    v4->_localizedAdditionalDescription = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"localizedAdditionalDescription"];
    v4->_isCancellable = [a3 decodeBoolForKey:@"cancellable"];
    v4->_isPausable = [a3 decodeBoolForKey:@"pausable"];
    v4->_isCancelled = [a3 decodeBoolForKey:@"cancelled"];
    v4->_isPaused = [a3 decodeBoolForKey:@"paused"];
    v4->_kind = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    v4->_isPrioritizable = [a3 decodeBoolForKey:@"prioritizable"];
  }

  return v4;
}

- (BOOL)isIndeterminate
{
  int64_t completed = self->_selfFraction.completed;
  if (completed < 0) {
    return 1;
  }
  int64_t total = self->_selfFraction.total;
  BOOL v4 = (total | completed) == 0;
  return total < 0 || v4;
}

- (BOOL)isFinished
{
  int64_t completed = self->_selfFraction.completed;
  int64_t total = self->_selfFraction.total;
  BOOL v5 = completed > 0 && total == 0;
  return completed >= 1 && completed >= total && total > 0 || v5;
}

- (double)fractionCompleted
{
  double v2 = 0.0;
  if (self)
  {
    -[NSProgressValues overallFraction](self, "overallFraction");
    if ((v4 & 0x8000000000000000LL) == 0 && (*((void *)&v4 + 1) & 0x8000000000000000LL) == 0 && v4 != 0)
    {
      if (*((void *)&v4 + 1)) {
        return (double)(uint64_t)v4 / (double)*((uint64_t *)&v4 + 1);
      }
      else {
        return 1.0;
      }
    }
  }

  return v2;
}

- (int64_t)completedUnitCount
{
  return self->_selfFraction.completed;
}

- (void)setCompletedUnitCount:(int64_t)a3
{
  self->_selfFraction.int64_t completed = a3;
}

- (int64_t)totalUnitCount
{
  return self->_selfFraction.total;
}

- (void)setTotalUnitCount:(int64_t)a3
{
  self->_selfFraction.int64_t total = a3;
}

- (_NSProgressFraction)overallFraction
{
  *retstr = self->_selfFraction;
  return (_NSProgressFraction *)_NSProgressFractionAddFraction((uint64_t)retstr, &self->_childFraction.completed);
}

@end
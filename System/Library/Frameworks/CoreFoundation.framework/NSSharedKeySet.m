@interface NSSharedKeySet
+ (BOOL)supportsSecureCoding;
+ (NSSharedKeySet)keySetWithKeys:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (NSSharedKeySet)init;
- (NSSharedKeySet)initWithCoder:(id)a3;
- (NSSharedKeySet)initWithKeys:(id *)a3 count:(unint64_t)a4;
- (NSSharedKeySet)subSharedKeySet;
- (char)g;
- (id)allKeys;
- (id)debugDescription;
- (id)keyAtIndex:(unint64_t)a3;
- (id)keys;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexForKey:(id)a3;
- (unint64_t)keySetCount;
- (unint64_t)maximumIndex;
- (unsigned)M;
- (unsigned)factor;
- (unsigned)numKey;
- (unsigned)seeds;
- (unsigned)select;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)rankTable;
- (void)setFactor:(unsigned int)a3;
- (void)setG:(char *)a3;
- (void)setKeys:(id *)a3;
- (void)setM:(unsigned int)a3;
- (void)setNumKey:(unsigned int)a3;
- (void)setRankTable:(void *)a3;
- (void)setSeeds:(unsigned int *)a3;
- (void)setSelect:(unsigned __int8)a3;
- (void)setSubSharedKeySet:(id)a3;
@end

@implementation NSSharedKeySet

+ (NSSharedKeySet)keySetWithKeys:(id)a3
{
  v3 = a2;
  v20[1] = *MEMORY[0x1895F89C0];
  if (!a3)
  {
    uint64_t v18 = __CFExceptionProem((objc_class *)a1, a2);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, @"%@: keys cannot be nil", v18);
LABEL_12:
    v15 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v15);
LABEL_13:
    CFStringRef v16 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v3);
    v17 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v16,  0LL);
    CFRelease(v16);
    objc_exception_throw(v17);
  }

  if ((_NSIsNSArray((uint64_t)a3) & 1) == 0)
  {
    uint64_t v14 = __CFExceptionProem((objc_class *)a1, v3);
    uint64_t v19 = objc_opt_class();
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: keys must be a kind of NSArray instead of '%@'",  v14,  v19);
    goto LABEL_12;
  }

  unint64_t v6 = [a3 count];
  v3 = (const char *)v6;
  if (v6 >> 60) {
    goto LABEL_13;
  }
  if (v6 <= 1) {
    unint64_t v6 = 1LL;
  }
  unint64_t v8 = MEMORY[0x1895F8858](v6, v7);
  v10 = (char *)v20 - v9;
  if ((unint64_t)v3 >= 0x101)
  {
    v10 = (char *)_CFCreateArrayStorage(v8, 0, v20);
    v11 = v10;
  }

  else
  {
    v11 = 0LL;
  }

  objc_msgSend(a3, "getObjects:range:", v10, 0, v3);
  v12 = (NSSharedKeySet *)(id)[objc_alloc((Class)a1) initWithKeys:v10 count:v3];
  free(v11);
  return v12;
}

- (NSSharedKeySet)initWithKeys:(id *)a3 count:(unint64_t)a4
{
  uint64_t v140 = *MEMORY[0x1895F89C0];
  v133.receiver = self;
  v133.super_class = (Class)&OBJC_CLASS___NSSharedKeySet;
  unint64_t v6 = -[NSSharedKeySet init](&v133, sel_init);
  unint64_t v8 = v6;
  if (!v6) {
    return v8;
  }
  if (!a4)
  {
    v6->_numKey = 0;
    return v8;
  }

  if (!(a4 >> 60))
  {
    uint64_t v9 = MEMORY[0x1895F8858](v6, v7);
    v129 = (id *)((char *)&v123 - v11);
    uint64_t v126 = v12;
    if (a4 > 0x100)
    {
      v128 = (id *)_CFCreateArrayStorage(a4, 0, &v132);
      MEMORY[0x1895F8858](v128, v15);
      v13 = (char *)&v122;
      uint64_t v14 = (char *)_CFCreateArrayStorage(a4, 0, &v131);
      v129 = v128;
    }

    else
    {
      MEMORY[0x1895F8858](v9, v10);
      v13 = (char *)&v123 - ((8 * a4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
      v128 = 0LL;
      uint64_t v14 = 0LL;
    }

    v127 = v14;
    if (a4 >= 0x101) {
      CFStringRef v16 = v14;
    }
    else {
      CFStringRef v16 = v13;
    }
    v130 = (uint64_t *)malloc(8 * a4);
    if (a4 < 2)
    {
      id *v129 = *a3;
      uint64_t v39 = [*a3 hash];
      uint64_t v27 = 0LL;
      uint64_t *v130 = v39;
      size_t v31 = 1LL;
    }

    else
    {
      v17 = -[NSSet initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSSet), "initWithObjects:count:", a3, a4);
      uint64_t v18 = v16;
      size_t v19 = -[NSSet count](v17, "count");
      v20 = (uint64_t *)malloc(16 * v19);
      __int128 v135 = 0u;
      __int128 v136 = 0u;
      __int128 v137 = 0u;
      __int128 v138 = 0u;
      uint64_t v21 = -[NSSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v135,  v134,  16LL);
      if (v21)
      {
        int v22 = 0;
        uint64_t v23 = *(void *)v136;
        do
        {
          for (uint64_t i = 0LL; i != v21; ++i)
          {
            if (*(void *)v136 != v23) {
              objc_enumerationMutation(v17);
            }
            v25 = *(void **)(*((void *)&v135 + 1) + 8 * i);
            uint64_t v26 = (v22 + i);
            v20[2 * v26] = (uint64_t)v25;
            v20[2 * v26 + 1] = [v25 hash];
          }

          uint64_t v21 = -[NSSet countByEnumeratingWithState:objects:count:]( v17,  "countByEnumeratingWithState:objects:count:",  &v135,  v134,  16LL);
          v22 += i;
        }

        while (v21);
      }

      qsort(v20, v19, 0x10uLL, (int (__cdecl *)(const void *, const void *))compareHashesAscending);
      id *v129 = (id)*v20;
      uint64_t *v130 = v20[1];
      CFStringRef v16 = v18;
      uint64_t v27 = 0LL;
      if (v19 < 2)
      {
        size_t v31 = 1LL;
      }

      else
      {
        v28 = v20 + 1;
        unsigned int v29 = 2;
        uint64_t v30 = 1LL;
        size_t v31 = 1LL;
        do
        {
          v32 = &v20[2 * v30];
          uint64_t v35 = v32[1];
          v33 = v32 + 1;
          uint64_t v34 = v35;
          uint64_t v36 = *v28;
          v28 += 2;
          v37 = (void *)v20[2 * v30];
          if (v34 == v36)
          {
            *(void *)&v18[8 * v27++] = v37;
          }

          else
          {
            v129[v31] = v37;
            v130[v31++] = *v33;
          }

          uint64_t v30 = v29;
          BOOL v38 = v19 > v29++;
        }

        while (v38);
      }

      free(v20);
    }

    v8->_numKey = v31;
    v8->_algorithmType = 1;
    unsigned int v40 = vcvtpd_u64_f64((double)v31 * 2.125) >> 1;
    unsigned int v41 = (v40 + 1) | 1;
    if (v40 - 3 > 0xFFFFFFFD)
    {
LABEL_39:
      unsigned int v44 = v41;
    }

    else
    {
      do
      {
        if (-1431655765 * v41 >= 0x55555556)
        {
          if (v41 < 0x19) {
            goto LABEL_39;
          }
          int v42 = 11;
          while (v41 % (v42 - 6) && v41 % (v42 - 4))
          {
            unsigned int v43 = v42 * v42;
            v42 += 6;
            if (v43 > v41) {
              goto LABEL_39;
            }
          }
        }

        unsigned int v44 = v41 + 2;
        BOOL v38 = v41 > 1;
        v41 += 2;
      }

      while (v38);
    }

    v8->_unint64_t M = 2 * v44;
    v8->_unsigned int factor = v44;
    v124 = v16;
    uint64_t v125 = v27;
    if (2 * v44 > 0xFE)
    {
      if (2 * v44 > 0xFFFE) {
        char v45 = 2;
      }
      else {
        char v45 = 1;
      }
      v8->_int select = v45;
    }

    else
    {
      v8->_int select = 0;
    }

    int v46 = 0;
    v8->_seeds = (unsigned int *)calloc(2uLL, 4uLL);
    double v47 = 2.125;
    while (1)
    {
      arc4random_buf(v8->_seeds, 4uLL);
      arc4random_buf(v8->_seeds + 1, 4uLL);
      if (v46)
      {
        double v47 = v47 + 0.125;
        LODWORD(v48) = v8->_numKey;
        unsigned int v49 = vcvtpd_u64_f64(v47 * (double)v48) >> 1;
        unsigned int v50 = (v49 + 1) | 1;
        if (v49 - 3 > 0xFFFFFFFD)
        {
LABEL_58:
          unsigned int v53 = v50;
        }

        else
        {
          do
          {
            if (-1431655765 * v50 >= 0x55555556)
            {
              if (v50 < 0x19) {
                goto LABEL_58;
              }
              int v51 = 11;
              while (v50 % (v51 - 6) && v50 % (v51 - 4))
              {
                unsigned int v52 = v51 * v51;
                v51 += 6;
                if (v52 > v50) {
                  goto LABEL_58;
                }
              }
            }

            unsigned int v53 = v50 + 2;
            BOOL v38 = v50 > 1;
            v50 += 2;
          }

          while (v38);
        }

        unsigned int v54 = 2 * v53;
        v8->_unint64_t M = 2 * v53;
        v8->_unsigned int factor = v53;
        if (2 * v53 < 0xFFFF) {
          char v55 = 1;
        }
        else {
          char v55 = 2;
        }
        if (v54 >= 0xFF) {
          char v56 = v55;
        }
        else {
          char v56 = 0;
        }
        v8->_int select = v56;
      }

      v57 = -[__NSSKGraph initWithNumberOfVertices:numberOfEdges:]( objc_alloc(&OBJC_CLASS_____NSSKGraph),  "initWithNumberOfVertices:numberOfEdges:",  v8->_M,  v31);
      v58 = v130;
      uint64_t v59 = v31;
      if ((_DWORD)v31)
      {
        do
        {
          uint64_t v60 = *v58++;
          seeds = v8->_seeds;
          int v62 = *seeds - 559038729;
          HIDWORD(v63) = v62 + HIDWORD(v60);
          LODWORD(v63) = v62 + HIDWORD(v60);
          LODWORD(seeds) = ((v62 + seeds[1]) ^ (v62 + HIDWORD(v60))) - (v63 >> 18);
          HIDWORD(v63) = (_DWORD)seeds;
          LODWORD(v63) = (_DWORD)seeds;
          int v64 = (seeds ^ (v62 + v60)) - (v63 >> 21);
          HIDWORD(v63) = v64;
          LODWORD(v63) = v64;
          HIDWORD(v63) = (v64 ^ (v62 + HIDWORD(v60))) - (v63 >> 7);
          int v65 = HIDWORD(v63);
          LODWORD(v63) = HIDWORD(v63);
          LODWORD(seeds) = (HIDWORD(v63) ^ seeds) - (v63 >> 16);
          HIDWORD(v63) = (_DWORD)seeds;
          LODWORD(v63) = (_DWORD)seeds;
          HIDWORD(v63) = (seeds ^ v64) - (v63 >> 28);
          LODWORD(v63) = HIDWORD(v63);
          HIDWORD(v63) = (HIDWORD(v63) ^ v65) - (v63 >> 18);
          LODWORD(v63) = HIDWORD(v63);
          -[__NSSKGraph addEdgeWithH1:withH2:]( v57,  "addEdgeWithH1:withH2:",  2 * (((HIDWORD(v63) ^ seeds) - (v63 >> 8)) % v8->_factor),  (2 * (HIDWORD(v63) % v8->_factor)) | 1);
          --v59;
        }

        while (v59);
      }

      v66 = -[__NSSKGraph isAcyclic](v57, "isAcyclic");
      if (-[__NSSKGraph isEmpty](v57, "isEmpty")) {
        break;
      }
      free(v66);

      if (++v46 == 1000)
      {
        v57 = 0LL;
LABEL_86:

        unint64_t v8 = 0LL;
        v57 = 0LL;
        goto LABEL_134;
      }
    }

    if (!v66) {
      goto LABEL_86;
    }
    uint64_t v67 = -[__NSSKGraph numOfEdges](v57, "numOfEdges");
    v68 = calloc(v8->_M, 1uLL);
    memset(v68, 2, v8->_M);
    for (; v67; --v67)
    {
      v69 = v66[v67 - 1];
      unint64_t var2 = v69->var2;
      else {
        char v71 = 1 - *((_BYTE *)v68 + v69->var1[0]);
      }
      *((_BYTE *)v68 + var2) = v71 & 1;
    }

    v8->_g = (char *)v68;
    unint64_t M = v8->_M;
    int select = v8->_select;
    if (select == 2)
    {
      v78 = calloc(v8->_M, 4uLL);
      v75 = v78;
      if (!(_DWORD)M) {
        goto LABEL_105;
      }
      uint64_t v79 = 0LL;
      int v80 = 0;
      do
      {
        v78[v79] = v80;
        if (*((_BYTE *)v68 + v79) != 2) {
          ++v80;
        }
        ++v79;
      }

      while (M != v79);
    }

    else if (select == 1)
    {
      v81 = calloc(v8->_M, 2uLL);
      v75 = v81;
      if (!(_DWORD)M) {
        goto LABEL_105;
      }
      uint64_t v82 = 0LL;
      __int16 v83 = 0;
      do
      {
        v81[v82] = v83;
        if (*((_BYTE *)v68 + v82) != 2) {
          ++v83;
        }
        ++v82;
      }

      while (M != v82);
    }

    else if (v8->_select)
    {
      v75 = 0LL;
    }

    else
    {
      v74 = calloc(v8->_M, 1uLL);
      v75 = v74;
      if (!(_DWORD)M) {
        goto LABEL_105;
      }
      uint64_t v76 = 0LL;
      char v77 = 0;
      do
      {
        v74[v76] = v77;
        if (*((_BYTE *)v68 + v76) != 2) {
          ++v77;
        }
        ++v76;
      }

      while (M != v76);
    }

    if ((_DWORD)M)
    {
      unsigned int v84 = M - 1;
      do
      {
        uint64_t v85 = v84;
        if (*((_BYTE *)v68 + v84) == 2) {
          *((_BYTE *)v68 + v84) = 0;
        }
        --v84;
      }

      while (v85);
    }

- (NSSharedKeySet)init
{
  return -[NSSharedKeySet initWithKeys:count:](self, "initWithKeys:count:", 0LL, 0LL);
}

- (void)encodeWithCoder:(id)a3
{
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeInt64:self->_numKey forKey:@"NS.numKey"];
    if (self->_numKey)
    {
      [a3 encodeInt32:self->_select forKey:@"NS.select"];
      [a3 encodeInt64:self->_factor forKey:@"NS.factor"];
      [a3 encodeInt64:*self->_seeds forKey:@"NS.seed0"];
      [a3 encodeInt64:self->_seeds[1] forKey:@"NS.seed1"];
      [a3 encodeInt64:self->_M forKey:@"NS.M"];
      int select = self->_select;
      if (select == 2)
      {
        rankTable = self->_rankTable;
        uint64_t M = 4LL * self->_M;
      }

      else if (select == 1)
      {
        rankTable = self->_rankTable;
        uint64_t M = 2LL * self->_M;
      }

      else
      {
        if (self->_select)
        {
LABEL_11:
          [a3 encodeBytes:self->_g length:((unint64_t)self->_M >> 3) + 1 forKey:@"NS.g"];
          [a3 encodeObject:self->_subSharedKeySet forKey:@"NS.subskset"];
          objc_msgSend( a3,  "encodeObject:forKey:",  +[NSArray arrayWithObjects:count:]( NSArray,  "arrayWithObjects:count:",  self->_keys,  self->_numKey),  @"NS.keys");
          [a3 encodeInteger:self->_algorithmType & 1 forKey:@"NS.algorithmType"];
          return;
        }

        rankTable = self->_rankTable;
        uint64_t M = self->_M;
      }

      [a3 encodeBytes:rankTable length:M forKey:@"NS.rankTable"];
      goto LABEL_11;
    }
  }

  else
  {
    uint64_t v9 = __CFExceptionProem((objc_class *)self, a2);
    CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: this object can only be encoded by a keyed coder",  v9);
    uint64_t v10 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSInvalidArgumentException",  _CFAutoreleasePoolAddObject(),  0LL);
    objc_exception_throw(v10);
    +[NSSharedKeySet supportsSecureCoding](v11, v12);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSSharedKeySet)initWithCoder:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    uint64_t v31 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v9 = @"%@: this object can only be decoded by a keyed coder";
    goto LABEL_8;
  }

  objc_getClass("NSKeyedUnarchiver");
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0) {
    id v7 = a3;
  }
  else {
    id v7 = 0LL;
  }
  uint64_t v8 = [a3 decodeInt64ForKey:@"NS.numKey"];
  if (v8 >= 0x7FFFFFFF)
  {
    uint64_t v31 = __CFExceptionProem((objc_class *)self, a2);
    uint64_t v9 = @"%@: extreme number of keys";
LABEL_8:
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0LL, v9, v31, v32, block, v34, v35, v36, v37);
    uint64_t v10 = _CFAutoreleasePoolAddObject();

    [a3 failWithError:__archiveIsCorrupt_0(v10)];
    return 0LL;
  }

  uint64_t v12 = v8;
  if (!(_DWORD)v8) {
    return self;
  }
  if ((isKindOfClass & 1) != 0)
  {
    uint64_t v13 = objc_opt_new();
    if (!v13)
    {
      uint64_t v31 = __CFExceptionProem((objc_class *)self, a2);
      uint64_t v9 = @"%@: unable to unarchive - memory failure";
      goto LABEL_8;
    }

    uint64_t v14 = (void *)v13;
    [a3 replaceObject:self withObject:v13];
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.subskset"];
  if (v15)
  {
    uint64_t v16 = objc_opt_class();
    if (v16 != objc_opt_class())
    {
      uint64_t v17 = __CFExceptionProem((objc_class *)self, a2);
      uint64_t v18 = objc_opt_class();
      CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unexpected shared key set class: %@",  v17,  v18);
      uint64_t v19 = _CFAutoreleasePoolAddObject();

      [a3 failWithError:__archiveIsCorrupt_0(v19)];
      goto LABEL_21;
    }

    self->_subSharedKeySet = (NSSharedKeySet *)v15;
    if (v15 >= 1) {
      id v23 = (id)v15;
    }
LABEL_28:
    int v22 = 1;
    if (!v14) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }

  if (![a3 error])
  {
    self->_subSharedKeySet = 0LL;
    goto LABEL_28;
  }

  uint64_t v20 = __CFExceptionProem((objc_class *)self, a2);
  CFStringCreateWithFormat( (CFAllocatorRef)&__kCFAllocatorSystemDefault,  0LL,  @"%@: unable to unarchive - invalid class",  v20);
  uint64_t v21 = _CFAutoreleasePoolAddObject();

  [a3 failWithError:__archiveIsCorrupt_0(v21)];
LABEL_21:
  int v22 = 0;
  if (v14)
  {
LABEL_29:
    [v7 replaceObject:v14 withObject:self];
  }

id __32__NSSharedKeySet_initWithCoder___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  Class v2 = objc_lookUpClass("NSString");
  Class v3 = objc_lookUpClass("NSNumber");
  Class v4 = objc_lookUpClass("NSDate");
  initWithCoder__oPlistClasses_0 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v1,  v2,  v3,  v4,  objc_lookUpClass("NSURL"),  0LL);
  return (id)initWithCoder__oPlistClasses_0;
}

- (unint64_t)count
{
  for (unint64_t i = 0LL; self; self = self->_subSharedKeySet)
    i += self->_numKey;
  return i;
}

- (BOOL)isEmpty
{
  return self->_numKey == 0;
}

- (unint64_t)maximumIndex
{
  return -[NSSharedKeySet count](self, "count") - 1;
}

- (id)allKeys
{
  v19[1] = *MEMORY[0x1895F89C0];
  if (!self->_numKey) {
    return +[NSArray array](&OBJC_CLASS___NSArray, "array");
  }
  Class v2 = self;
  unint64_t v3 = -[NSSharedKeySet count](self, "count");
  if (v3 >> 60)
  {
    CFStringRef v16 = CFStringCreateWithFormat( 0LL,  0LL,  @"*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt",  v3);
    uint64_t v17 = +[NSException exceptionWithName:reason:userInfo:]( &OBJC_CLASS___NSException,  "exceptionWithName:reason:userInfo:",  @"NSGenericException",  v16,  0LL);
    CFRelease(v16);
    objc_exception_throw(v17);
    _Unwind_Resume(v18);
  }

  if (v3 <= 1) {
    unint64_t v3 = 1LL;
  }
  unint64_t v5 = MEMORY[0x1895F8858](v3, v4);
  id v7 = (char *)v19 - v6;
  if (v8 >= 0x101)
  {
    id v7 = (char *)_CFCreateArrayStorage(v5, 0, v19);
    uint64_t v9 = (id *)v7;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  LODWORD(v11) = 0;
  do
  {
    memmove(&v7[8 * v11], v2->_keys, 8LL * v2->_numKey);
    uint64_t v11 = (v2->_numKey + v11);
    Class v2 = v2->_subSharedKeySet;
  }

  while (v2);
  if (v9)
  {
    if ((_DWORD)v11)
    {
      uint64_t v12 = v9;
      uint64_t v13 = v11;
      do
      {
        id v14 = *v12++;
        --v13;
      }

      while (v13);
    }

    uint64_t v15 = -[NSArray _initByAdoptingBuffer:count:size:]( objc_alloc(&OBJC_CLASS___NSArray),  "_initByAdoptingBuffer:count:size:",  v9,  v11,  v11);
  }

  else
  {
    uint64_t v15 = -[NSArray initWithObjects:count:](objc_alloc(&OBJC_CLASS___NSArray), "initWithObjects:count:", v7, v11);
  }

  return v15;
}

- (unint64_t)indexForKey:(id)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (self->_numKey)
  {
    uint64_t v4 = self;
    unint64_t v5 = [a3 hash];
    int v6 = v5;
    unsigned int v7 = 0;
    unint64_t v8 = HIDWORD(v5);
    do
    {
      unint64_t numKey = v4->_numKey;
      if (!(_DWORD)numKey) {
        goto LABEL_24;
      }
      seeds = v4->_seeds;
      unsigned int factor = v4->_factor;
      if (v4->_algorithmType == 1)
      {
        int v15 = *seeds - 559038729;
        int v14 = v15 + seeds[1];
        int v13 = v15 + v8;
      }

      else
      {
        if (v4->_algorithmType) {
          __break(1u);
        }
        unsigned int v12 = seeds[1];
        int v13 = *seeds - 559038733;
        int v14 = v13 + v12;
        int v15 = v13;
      }

      HIDWORD(v16) = v13;
      LODWORD(v16) = v13;
      int v17 = (v14 ^ v13) - (v16 >> 18);
      HIDWORD(v16) = v17;
      LODWORD(v16) = v17;
      int v18 = ((v15 + v6) ^ v17) - (v16 >> 21);
      HIDWORD(v16) = v18;
      LODWORD(v16) = v18;
      int v19 = (v18 ^ v13) - (v16 >> 7);
      HIDWORD(v16) = v19;
      LODWORD(v16) = v19;
      int v20 = (v19 ^ v17) - (v16 >> 16);
      HIDWORD(v16) = v20;
      LODWORD(v16) = v20;
      HIDWORD(v16) = (v20 ^ v18) - (v16 >> 28);
      LODWORD(v16) = HIDWORD(v16);
      HIDWORD(v16) = (HIDWORD(v16) ^ v19) - (v16 >> 18);
      LODWORD(v16) = HIDWORD(v16);
      unint64_t v21 = 2 * (((HIDWORD(v16) ^ v20) - (v16 >> 8)) % factor);
      int v22 = HIDWORD(v16) % factor;
      unsigned int v23 = (2 * (HIDWORD(v16) % factor)) | 1;
      unint64_t v31 = __PAIR64__(v23, v21);
      unsigned int M = v4->_M;
      uint64_t v26 = *((unsigned int *)&v31
            + (((v4->_g[(unint64_t)(2 * v22) >> 3] >> (v23 & 7)) ^ (v4->_g[v21 >> 3] >> (v21 & 6))) & 1));
      int select = v4->_select;
      if (select == 2)
      {
        unint64_t v28 = *((unsigned int *)v4->_rankTable + v26);
      }

      else if (select == 1)
      {
        unint64_t v28 = *((unsigned __int16 *)v4->_rankTable + v26);
      }

      else
      {
        if (v4->_select) {
          goto LABEL_24;
        }
        unint64_t v28 = *((unsigned __int8 *)v4->_rankTable + v26);
      }

      if (v28 < numKey)
      {
        id v29 = v4->_keys[v28];
        if (v29)
        {
          if (v29 == a3 || (objc_msgSend(a3, "isEqual:", v31, v32) & 1) != 0) {
            return v28 + v7;
          }
          LODWORD(numKey) = v4->_numKey;
        }
      }

- (id)keyAtIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL || *((_DWORD *)self + 10) == 0 || self == 0LL) {
    return 0LL;
  }
  while (1)
  {
    unint64_t v5 = *((unsigned int *)self + 10);
    BOOL v6 = a3 >= v5;
    unint64_t v7 = a3 - v5;
    if (!v6) {
      break;
    }
    self = (id)*((void *)self + 8);
    a3 = v7;
    if (!self) {
      return self;
    }
  }

  return *(id *)(*((void *)self + 7) + 8 * a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t v9 = -[NSSharedKeySet count](self, "count");
  unint64_t var0 = a3->var0;
  if (a3->var0 == v9) {
    return 0LL;
  }
  unint64_t v11 = 0LL;
  if (a5)
  {
    unint64_t v12 = v9;
    if (var0 < v9)
    {
      unint64_t v11 = 0LL;
      do
      {
        unint64_t v13 = var0 + v11;
        a4[v11] = -[NSSharedKeySet keyAtIndex:](self, "keyAtIndex:", var0 + v11);
        ++v11;
      }

      while (v11 < a5 && v13 + 1 < v12);
      var0 += v11;
    }
  }

  a3->unint64_t var0 = var0;
  a3->var1 = a4;
  a3->unint64_t var2 = (unint64_t *)&countByEnumeratingWithState_objects_count__const_mu_8;
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  if (self == a3) {
    return 1;
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      unint64_t v5 = -[NSSharedKeySet count](self, "count");
      if (v5 == [a3 count])
      {
        unint64_t v6 = -[NSSharedKeySet keySetCount](self, "keySetCount");
        if (v6 == [a3 keySetCount])
        {
          id v7 = -[NSSharedKeySet allKeys](self, "allKeys");
          unint64_t v8 = (void *)[a3 allKeys];
          uint64_t v9 = [v7 count];
          if (v9 == [v8 count])
          {
            __int128 v33 = 0u;
            __int128 v34 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            uint64_t v10 = [v7 countByEnumeratingWithState:&v31 objects:v30 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v12 = 0LL;
              uint64_t v13 = *(void *)v32;
LABEL_9:
              uint64_t v14 = 0LL;
              v12 += v11;
              while (1)
              {
                if (*(void *)v32 != v13) {
                  objc_enumerationMutation(v7);
                }
                if ([a3 indexForKey:*(void *)(*((void *)&v31 + 1) + 8 * v14)] == 0x7FFFFFFFFFFFFFFFLL) {
                  break;
                }
                if (v11 == ++v14)
                {
                  uint64_t v11 = [v7 countByEnumeratingWithState:&v31 objects:v30 count:16];
                  if (v11) {
                    goto LABEL_9;
                  }
                  goto LABEL_18;
                }
              }
            }

            else
            {
              uint64_t v12 = 0LL;
LABEL_18:
              if (v12 == v5)
              {
                __int128 v28 = 0u;
                __int128 v29 = 0u;
                __int128 v26 = 0u;
                __int128 v27 = 0u;
                uint64_t v16 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
                if (v16)
                {
                  uint64_t v17 = v16;
                  uint64_t v18 = 0LL;
                  uint64_t v19 = *(void *)v27;
LABEL_21:
                  uint64_t v20 = 0LL;
                  v18 += v17;
                  while (1)
                  {
                    if (*(void *)v27 != v19) {
                      objc_enumerationMutation(v8);
                    }
                    if (-[NSSharedKeySet indexForKey:]( self,  "indexForKey:",  *(void *)(*((void *)&v26 + 1) + 8 * v20)) == 0x7FFFFFFFFFFFFFFFLL) {
                      break;
                    }
                    if (v17 == ++v20)
                    {
                      uint64_t v17 = [v8 countByEnumeratingWithState:&v26 objects:v25 count:16];
                      if (v17) {
                        goto LABEL_21;
                      }
                      goto LABEL_29;
                    }
                  }
                }

                else
                {
                  uint64_t v18 = 0LL;
LABEL_29:
                  if (v18 == v5)
                  {
                    unint64_t v21 = -[NSSharedKeySet maximumIndex](self, "maximumIndex");
                    if (v21 == [a3 maximumIndex])
                    {
                      uint64_t v22 = 0LL;
                      while (1)
                      {
                        unsigned int v23 = (void *)[a3 keyAtIndex:v22];
                        if ((objc_msgSend( v23,  "isEqual:",  -[NSSharedKeySet keyAtIndex:]( self,  "keyAtIndex:",  -[NSSharedKeySet indexForKey:](self, "indexForKey:", v23))) & 1) == 0) {
                          break;
                        }
                        if (++v22 > v21)
                        {
                          BOOL v24 = -[NSSharedKeySet isEmpty](self, "isEmpty");
                          return v24 ^ [a3 isEmpty] ^ 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  rankTable = self->_rankTable;
  if (rankTable) {
    free(rankTable);
  }
  g = self->_g;
  if (g) {
    free(g);
  }
  seeds = self->_seeds;
  if (seeds) {
    free(seeds);
  }
  keys = self->_keys;
  if (keys)
  {
    uint64_t numKey = self->_numKey;
    if ((_DWORD)numKey)
    {
      uint64_t v8 = 8 * numKey - 8;
      do
      {
        uint64_t v9 = *(uint64_t *)((char *)self->_keys + v8);
        if (v9 >= 1) {

        }
        v8 -= 8LL;
      }

      while (v8 != -8);
      keys = self->_keys;
    }

    free(keys);
  }

  subSharedKeySet = self->_subSharedKeySet;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSSharedKeySet;
  -[NSSharedKeySet dealloc](&v11, sel_dealloc);
}

- (unint64_t)keySetCount
{
  for (unint64_t i = 0LL; self; self = self->_subSharedKeySet)
    ++i;
  return i;
}

- (id)debugDescription
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unint64_t v3 = (void *)-[objc_class string](objc_lookUpClass("NSMutableString"), "string");
  [v3 appendFormat:@"<%@: %p>\n", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"  uint64_t numKey = %u\n", self->_numKey);
  objc_msgSend(v3, "appendFormat:", @"  unsigned int M = %u (should always be even)\n", self->_M);
  objc_msgSend(v3, "appendFormat:", @"  unsigned int factor = %u (should always be prime)\n", self->_factor);
  [v3 appendFormat:@"  keys = [\n"];
  if (self->_numKey)
  {
    unint64_t v4 = 0LL;
    do
    {
      id v5 = self->_keys[v4];
      [v3 appendFormat:@"    <%@: %p>, 0x%lx\n", objc_opt_class(), v5, objc_msgSend(v5, "hash")];
      ++v4;
    }

    while (v4 < self->_numKey);
  }

  [v3 appendFormat:@"  ]\n"];
  objc_msgSend(v3, "appendFormat:", @"  seeds[0] = 0x%xu\n", *self->_seeds);
  objc_msgSend(v3, "appendFormat:", @"  seeds[1] = 0x%xu\n", self->_seeds[1]);
  int select = self->_select;
  if (self->_select)
  {
    if (select == 1)
    {
      id v7 = @"unsigned short";
    }

    else
    {
      id v7 = @"unknown";
      if (select == 2) {
        id v7 = @"unsigned int";
      }
    }
  }

  else
  {
    id v7 = @"unsigned char";
  }

  [v3 appendFormat:@"  ranktable = %p (int select = %u (%@)) [\n", self->_rankTable, self->_select, v7];
  int v8 = self->_select;
  if (self->_select)
  {
    if (v8 == 1)
    {
      if (self->_M)
      {
        unint64_t v11 = 0LL;
        do
        {
          objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v11, *((unsigned __int16 *)self->_rankTable + v11));
          ++v11;
        }

        while (v11 < self->_M);
      }
    }

    else if (v8 == 2 && self->_M)
    {
      unint64_t v9 = 0LL;
      do
      {
        objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v9, *((unsigned int *)self->_rankTable + v9));
        ++v9;
      }

      while (v9 < self->_M);
    }
  }

  else if (self->_M)
  {
    unint64_t v10 = 0LL;
    do
    {
      objc_msgSend(v3, "appendFormat:", @"    %d - %u\n", v10, *((unsigned __int8 *)self->_rankTable + v10));
      ++v10;
    }

    while (v10 < self->_M);
  }

  [v3 appendFormat:@"  ]\n"];
  if (self->_algorithmType) {
    uint64_t v12 = @"use_full_hash_64";
  }
  else {
    uint64_t v12 = @"clamp_hash_to_32";
  }
  [v3 appendFormat:@"  algorithmType: %@\n", v12];
  objc_msgSend(v3, "appendFormat:", @"  g = %p\n", self->_g);
  [v3 appendFormat:@"    packed bits (binary):\n      "];
  unint64_t v13 = 0LL;
  do
  {
    int8x16_t v14 = (int8x16_t)vdupq_n_s32(self->_g[v13]);
    v15.i64[0] = 0x31003100310031LL;
    v15.i64[1] = 0x31003100310031LL;
    v16.i64[0] = 0x30003000300030LL;
    v16.i64[1] = 0x30003000300030LL;
    int8x16_t v21 = vbslq_s8( (int8x16_t)vuzp1q_s16( (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_180D7F900)),  (int16x8_t)vceqzq_s32((int32x4_t)vandq_s8(v14, (int8x16_t)xmmword_180D7F910))),  v16,  v15);
    [v3 appendFormat:@"%@ ", -[objc_class stringWithCharacters:length:]( objc_lookUpClass("NSString"), "stringWithCharacters:length:", &v21, 8)];
  }

  while (v13++ < (unint64_t)self->_M >> 3);
  [v3 appendFormat:@"\n"];
  if (self->_subSharedKeySet)
  {
    Class v18 = objc_lookUpClass("NSMutableString");
    [v3 appendFormat:@"  subSharedKeySet = %@\n", -[objc_class stringWithFormat:]( v18, "stringWithFormat:", @"<%@: %p>", objc_opt_class(), self->_subSharedKeySet)];
  }

  else
  {
    objc_msgSend(v3, "appendFormat:", @"  subSharedKeySet = nil\n", v20);
  }

  return v3;
}

- (char)g
{
  return self->_g;
}

- (void)setG:(char *)a3
{
  self->_g = a3;
}

- (unsigned)select
{
  return self->_select;
}

- (void)setSelect:(unsigned __int8)a3
{
  self->_int select = a3;
}

- (void)rankTable
{
  return self->_rankTable;
}

- (void)setRankTable:(void *)a3
{
  self->_rankTable = a3;
}

- (unsigned)M
{
  return self->_M;
}

- (void)setM:(unsigned int)a3
{
  self->_unsigned int M = a3;
}

- (unsigned)factor
{
  return self->_factor;
}

- (void)setFactor:(unsigned int)a3
{
  self->_unsigned int factor = a3;
}

- (unsigned)numKey
{
  return self->_numKey;
}

- (void)setNumKey:(unsigned int)a3
{
  self->_uint64_t numKey = a3;
}

- (unsigned)seeds
{
  return self->_seeds;
}

- (void)setSeeds:(unsigned int *)a3
{
  self->_seeds = a3;
}

- (id)keys
{
  return self->_keys;
}

- (void)setKeys:(id *)a3
{
  self->_keys = a3;
}

- (NSSharedKeySet)subSharedKeySet
{
  return (NSSharedKeySet *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setSubSharedKeySet:(id)a3
{
}

@end
@interface SMTNoiseSampler
- (SMTNoiseSampler)init;
- (SMTNoiseSampler)initWithUnigram:(float *)a3 ofSize:(unint64_t)a4;
- (SMTNoiseSampler)initWithZipfOfSize:(unint64_t)a3;
- (id).cxx_construct;
- (unint64_t)drawNoise;
@end

@implementation SMTNoiseSampler

- (SMTNoiseSampler)init
{
  return 0LL;
}

- (SMTNoiseSampler)initWithZipfOfSize:(unint64_t)a3
{
  if (a3)
  {
    if (a3 >> 62) {
      sub_1000040C8();
    }
    v5 = (char *)sub_1000041AC(a3);
    bzero(v5, 4 * a3);
    double v6 = log((double)(a3 + 1));
    unint64_t v7 = 0LL;
    float v8 = 0.0;
    do
    {
      float v9 = logf((float)v7 + 2.0);
      float v10 = (float)(v9 - logf((float)v7 + 1.0)) / v6;
      float v8 = v8 + v10;
      *(float *)&v5[4 * v7++] = v10;
    }

    while (a3 != v7);
    uint64_t v11 = 0LL;
    do
    {
      *(float *)&v5[4 * v11] = *(float *)&v5[4 * v11] / v8;
      ++v11;
    }

    while (a3 != v11);
    v12 = &v5[4 * a3];
  }

  else
  {
    v5 = 0LL;
    v12 = 0LL;
  }

  v13 = -[SMTNoiseSampler initWithUnigram:ofSize:](self, "initWithUnigram:ofSize:", v5, (v12 - v5) >> 2);
  if (v5) {
    operator delete(v5);
  }
  return v13;
}

- (SMTNoiseSampler)initWithUnigram:(float *)a3 ofSize:(unint64_t)a4
{
  v101.receiver = self;
  v101.super_class = (Class)&OBJC_CLASS___SMTNoiseSampler;
  double v6 = -[SMTNoiseSampler init](&v101, "init");
  if (!v6) {
    return v6;
  }
  v98 = v6;
  sub_1000041E0(&__token, "/dev/urandom");
  std::random_device::random_device(&v99, &__token);
  std::random_device::result_type v7 = std::random_device::operator()(&v99);
  LODWORD(__src[0]) = v7;
  for (uint64_t i = 1LL; i != 624; ++i)
  {
    std::random_device::result_type v7 = i + 1812433253 * (v7 ^ (v7 >> 30));
    *((_DWORD *)__src + i) = v7;
  }

  __src[312] = 0LL;
  memcpy(&v6->_generator, __src, sizeof(v6->_generator));
  std::random_device::~random_device(&v99);
  begin = v6->_unigram.__begin_;
  end = v6->_unigram.__end_;
  unint64_t v11 = end - begin;
  if (a4 <= v11)
  {
    if (a4 < v11) {
      v6->_unigram.__end_ = &begin[a4];
    }
  }

  else
  {
    value = v6->_unigram.__end_cap_.__value_;
    if (a4 - v11 <= value - end)
    {
      v26 = &end[a4 - v11];
      unint64_t v27 = 4 * a4 - 4 * v11;
      do
      {
        *end++ = 0.0;
        v27 -= 4LL;
      }

      while (v27);
      v6->_unigram.__end_ = v26;
    }

    else
    {
      if (a4 >> 62) {
        sub_1000040C8();
      }
      unint64_t v13 = (char *)value - (char *)begin;
      unint64_t v14 = ((char *)value - (char *)begin) >> 1;
      if (v14 <= a4) {
        unint64_t v14 = a4;
      }
      if (v13 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v15 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v15 = v14;
      }
      v16 = (char *)sub_1000041AC(v15);
      v18 = &v16[4 * v11];
      v19 = (float *)&v16[4 * a4];
      v20 = v18;
      unint64_t v21 = 4 * a4 - 4 * v11;
      do
      {
        *(_DWORD *)v20 = 0;
        v20 += 4;
        v21 -= 4LL;
      }

      while (v21);
      v22 = (float *)&v16[4 * v17];
      v23 = v6->_unigram.__begin_;
      for (j = v6->_unigram.__end_; j != v23; --j)
      {
        int v25 = *((_DWORD *)j - 1);
        *((_DWORD *)v18 - 1) = v25;
        v18 -= 4;
      }

      v6->_unigram.__begin_ = (float *)v18;
      v6->_unigram.__end_ = v19;
      v6->_unigram.__end_cap_.__value_ = v22;
      if (v23) {
        operator delete(v23);
      }
    }
  }

  v29 = v6->_alias.__begin_;
  v28 = v6->_alias.__end_;
  unint64_t v30 = v28 - v29;
  if (a4 <= v30)
  {
    if (a4 < v30) {
      v6->_alias.__end_ = &v29[a4];
    }
  }

  else
  {
    v31 = v6->_alias.__end_cap_.__value_;
    if (a4 - v30 <= v31 - v28)
    {
      v45 = &v28[a4 - v30];
      unint64_t v46 = 8 * a4 - 8 * v30;
      do
      {
        *v28++ = 0LL;
        v46 -= 8LL;
      }

      while (v46);
      v6->_alias.__end_ = v45;
    }

    else
    {
      if (a4 >> 61) {
        sub_1000040C8();
      }
      unint64_t v32 = (char *)v31 - (char *)v29;
      unint64_t v33 = ((char *)v31 - (char *)v29) >> 2;
      if (v33 <= a4) {
        unint64_t v33 = a4;
      }
      if (v32 >= 0x7FFFFFFFFFFFFFF8LL) {
        unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v34 = v33;
      }
      v35 = (char *)sub_1000040DC(v34);
      v37 = &v35[8 * v30];
      v38 = (unint64_t *)&v35[8 * a4];
      v39 = v37;
      unint64_t v40 = 8 * a4 - 8 * v30;
      do
      {
        *(void *)v39 = 0LL;
        v39 += 8;
        v40 -= 8LL;
      }

      while (v40);
      v41 = (unint64_t *)&v35[8 * v36];
      v42 = v6->_alias.__begin_;
      for (k = v6->_alias.__end_; k != v42; --k)
      {
        uint64_t v44 = *(k - 1);
        *((void *)v37 - 1) = v44;
        v37 -= 8;
      }

      v6->_alias.__begin_ = (unint64_t *)v37;
      v6->_alias.__end_ = v38;
      v6->_alias.__end_cap_.__value_ = v41;
      if (v42) {
        operator delete(v42);
      }
    }
  }

  if (!a4) {
    return v6;
  }
  v47 = 0LL;
  v48 = 0LL;
  v49 = 0LL;
  unint64_t v50 = 0LL;
  v51 = 0LL;
  unint64_t v52 = 0LL;
  uint64_t v53 = 0LL;
  v97 = a3;
  do
  {
    float v54 = a3[v53] * (float)a4;
    v6->_unigram.__begin_[v53] = v54;
    if (v54 >= 1.0)
    {
      if ((unint64_t)v48 < v52)
      {
        *(void *)v48 = v53;
        v48 += 8;
        goto LABEL_84;
      }

      uint64_t v59 = (v48 - v51) >> 3;
      unint64_t v60 = v59 + 1;
      if ((unint64_t)(v59 + 1) >> 61) {
LABEL_142:
      }
        sub_1000040C8();
      else {
        unint64_t v61 = v60;
      }
      if (v61) {
        unint64_t v61 = (unint64_t)sub_1000040DC(v61);
      }
      else {
        uint64_t v62 = 0LL;
      }
      v66 = (char *)(v61 + 8 * v59);
      *(void *)v66 = v53;
      v67 = v66 + 8;
      while (v48 != v51)
      {
        uint64_t v68 = *((void *)v48 - 1);
        v48 -= 8;
        *((void *)v66 - 1) = v68;
        v66 -= 8;
      }

      unint64_t v52 = v61 + 8 * v62;
      if (v51) {
        operator delete(v51);
      }
      v48 = v67;
      v51 = v66;
    }

    else
    {
      if ((unint64_t)v47 < v50)
      {
        *(void *)v47 = v53;
        v47 += 8;
        goto LABEL_84;
      }

      uint64_t v55 = (v47 - v49) >> 3;
      unint64_t v56 = v55 + 1;
      else {
        unint64_t v57 = v56;
      }
      if (v57) {
        unint64_t v57 = (unint64_t)sub_1000040DC(v57);
      }
      else {
        uint64_t v58 = 0LL;
      }
      v63 = (char *)(v57 + 8 * v55);
      *(void *)v63 = v53;
      v64 = v63 + 8;
      while (v47 != v49)
      {
        uint64_t v65 = *((void *)v47 - 1);
        v47 -= 8;
        *((void *)v63 - 1) = v65;
        v63 -= 8;
      }

      unint64_t v50 = v57 + 8 * v58;
      if (v49) {
        operator delete(v49);
      }
      v47 = v64;
      v49 = v63;
    }

    a3 = v97;
    double v6 = v98;
LABEL_84:
    ++v53;
  }

  while (v53 != a4);
  if (v47 != v49)
  {
    while (1)
    {
      if (v48 == v51)
      {
        if (v49 != v47)
        {
          unint64_t v88 = (v47 - v49) >> 3;
          v89 = v6->_unigram.__begin_;
          if (v88 <= 1) {
            unint64_t v88 = 1LL;
          }
          v90 = v49;
          do
          {
            uint64_t v91 = *(void *)v90;
            v90 += 8;
            v89[v91] = 1.0;
            --v88;
          }

          while (v88);
        }

        break;
      }

      v70 = v47 - 8;
      uint64_t v69 = *((void *)v47 - 1);
      v72 = v48 - 8;
      unint64_t v71 = *((void *)v48 - 1);
      v6->_alias.__begin_[v69] = v71;
      v73 = v6->_unigram.__begin_;
      float v74 = v73[v71] + -1.0 + v73[v69];
      v73[v71] = v74;
      if (v74 >= 1.0)
      {
        if ((unint64_t)v72 >= v52)
        {
          uint64_t v79 = (v72 - v51) >> 3;
          unint64_t v80 = v79 + 1;
          if ((unint64_t)(v79 + 1) >> 61) {
LABEL_143:
          }
            sub_1000040C8();
          else {
            unint64_t v81 = v80;
          }
          if (v81) {
            unint64_t v81 = (unint64_t)sub_1000040DC(v81);
          }
          else {
            uint64_t v82 = 0LL;
          }
          v85 = (unint64_t *)(v81 + 8 * v79);
          unint64_t *v85 = v71;
          v86 = (char *)(v85 + 1);
          while (v72 != v51)
          {
            unint64_t v87 = *((void *)v72 - 1);
            v72 -= 8;
            *--v85 = v87;
          }

          unint64_t v52 = v81 + 8 * v82;
          if (v51) {
            operator delete(v51);
          }
          v72 = v86;
          v51 = (char *)v85;
          v47 = v70;
          goto LABEL_122;
        }

        *(void *)v72 = v71;
        v72 = v48;
        v47 -= 8;
      }

      else
      {
        if ((unint64_t)v70 >= v50)
        {
          uint64_t v75 = (v70 - v49) >> 3;
          unint64_t v76 = v75 + 1;
          else {
            unint64_t v77 = v76;
          }
          if (v77) {
            unint64_t v77 = (unint64_t)sub_1000040DC(v77);
          }
          else {
            uint64_t v78 = 0LL;
          }
          v83 = (char *)(v77 + 8 * v75);
          *(void *)v83 = v71;
          v47 = v83 + 8;
          while (v70 != v49)
          {
            uint64_t v84 = *((void *)v70 - 1);
            v70 -= 8;
            *((void *)v83 - 1) = v84;
            v83 -= 8;
          }

          unint64_t v50 = v77 + 8 * v78;
          if (v49) {
            operator delete(v49);
          }
          v49 = v83;
LABEL_122:
          double v6 = v98;
          goto LABEL_123;
        }

        *(void *)v70 = v71;
      }

- (unint64_t)drawNoise
{
  p_generator = &self->_generator;
  int64_t v4 = (char *)self->_unigram.__end_ - (char *)self->_unigram.__begin_;
  uint64_t v5 = v4 >> 2;
  if (v4)
  {
    unint64_t v6 = v5 + 1;
    if (v5 == -1)
    {
      sub_100003F0C((uint64_t)v16, (uint64_t)p_generator, 0x40uLL);
      unint64_t v9 = sub_100003FF8((uint64_t)v16);
    }

    else
    {
      unint64_t v7 = __clz(v6);
      uint64_t v8 = 63LL;
      if (((v6 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0) {
        uint64_t v8 = 64LL;
      }
      sub_100003F0C((uint64_t)v16, (uint64_t)p_generator, v8 - v7);
      do
        unint64_t v9 = sub_100003FF8((uint64_t)v16);
      while (v9 >= v6);
    }

    uint64_t v5 = v9;
  }

  float v10 = self->_unigram.__begin_[v5];
  unint64_t v11 = self->_alias.__begin_[v5];
  double v12 = v10;
  double v13 = (double)sub_100003E6C((uint64_t)p_generator);
  else {
    unint64_t v14 = v5;
  }
  return (unint64_t)(float)v14;
}

- (void).cxx_destruct
{
  begin = self->_unigram.__begin_;
  if (begin)
  {
    self->_unigram.__end_ = begin;
    operator delete(begin);
  }

  int64_t v4 = self->_alias.__begin_;
  if (v4)
  {
    self->_alias.__end_ = v4;
    operator delete(v4);
  }

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  unsigned int v2 = 5489;
  *((_DWORD *)self + 14) = 5489;
  uint64_t v3 = 1LL;
  for (uint64_t i = 15LL; i != 638; ++i)
  {
    int v5 = 1812433253 * (v2 ^ (v2 >> 30));
    unsigned int v2 = v5 + v3;
    *((_DWORD *)self + i) = i + v5 - 14;
    ++v3;
  }

  *((void *)self + 319) = 0LL;
  return self;
}

@end
uint64_t Int8.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1;
  *v1 = result;
  return result;
}

uint64_t (*Int8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_BYTE *sub_188F5FB94@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_188F5FBA0(_BYTE *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1 = result;
  return result;
}

uint64_t (*Int16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_WORD *sub_188F5FBF8@<X0>(_WORD *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_188F5FC04(_WORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*Int32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_DWORD *sub_188F5FC5C@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_188F5FC68(_DWORD *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t Int64.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*Int64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_188F5FCC0@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F620F4(result, a2, a3);
}

unint64_t *sub_188F5FCC8(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_188F62178(result, a2, a3);
}

unint64_t *sub_188F5FCD0@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F621FC(result, a2, a3, a4);
}

uint64_t sub_188F5FCD8( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F622D0(a1, a2, a3, a4, a5);
}

uint64_t sub_188F5FCE0( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F623E4(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F5FD08( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F6264C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t *sub_188F5FD30@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F627A0(result, a2, a3, a4);
}

uint64_t *sub_188F5FD38@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62888(result, a2, a3, a4);
}

uint64_t *sub_188F5FD40@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62970(result, a2, a3, a4);
}

uint64_t *sub_188F5FD48@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62A58(result, a2, a3, a4);
}

uint64_t *sub_188F5FD50@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62B40(result, a2, a3, a4);
}

uint64_t UInt8.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1 = result;
  return result;
}

uint64_t (*UInt8.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int8 *sub_188F5FD78@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unsigned __int8 v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }

  if (!a2)
  {
    unsigned __int8 v3 = *result;
    goto LABEL_6;
  }

  result = (unsigned __int8 *)sub_188F6DD08();
  __break(1u);
  return result;
}

unsigned __int8 *sub_188F5FE00(unsigned __int8 *result, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int8 v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }

  else if (a3)
  {
    result = (unsigned __int8 *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    *a2 = v3;
  }

  return result;
}

unsigned __int8 *sub_188F5FE88@<X0>( unsigned __int8 *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      result = (unsigned __int8 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F5FF60(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int8 v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      uint64_t v8 = 1LL;
      goto LABEL_18;
    case 2LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    int v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

LABEL_17:
  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7 & 1;
  return v8;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  if (v7)
  {
    *a1 = v7;
    return v8;
  }

  else
  {
LABEL_21:
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

  uint64_t v8 = 0LL;
  __clrex();
LABEL_18:
  *a1 = v7;
  return v8;
}

      v10 = 0LL;
LABEL_18:
      if (!v7)
      {
        while (1)
        {
          sub_188F6DCFC();
          __break(1u);
LABEL_20:
          sub_188F6DC90();
          sub_188F6DD08();
          __break(1u);
        }
      }

      *a1 = v7;
      return v10;
    case 3LL:
      uint64_t v8 = *a2;
      int v7 = __ldxr(a4);
      if (v7 == v8) {
        goto LABEL_11;
      }
      goto LABEL_16;
    case 5LL:
      unsigned __int8 v6 = *a2;
LABEL_8:
      int v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_16;
      }
LABEL_11:
      if (!__stlxr(v5, a4)) {
        goto LABEL_15;
      }
      goto LABEL_17;
    default:
      goto LABEL_20;
  }

uint64_t sub_188F6007C( _BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int8 v7 = *a3;
  switch(a5)
  {
    case 0LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          uint64_t v9 = 1LL;
          goto LABEL_62;
        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 2LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 3LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 4LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 5LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
LABEL_61:
          uint64_t v9 = 1LL;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

LABEL_41:
          uint64_t v9 = 0LL;
          __clrex();
          goto LABEL_62;
        case 5LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
      }

          uint64_t v9 = 0LL;
          __clrex();
          goto LABEL_62;
        case 5LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
      }

          uint64_t v9 = 0LL;
          __clrex();
          goto LABEL_62;
        case 5LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
      }

          uint64_t v9 = 0LL;
          __clrex();
          goto LABEL_62;
        case 5LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
      }

        uint64_t v9 = 0LL;
        __clrex();
        goto LABEL_62;
      }

      do
      {
        int v8 = __ldaxr(a4);
        if (v8 != v6) {
          goto LABEL_41;
        }
      }

      while (__stlxr(v7, a4));
LABEL_61:
      uint64_t v9 = 1LL;
LABEL_62:
      if (v8)
      {
        *a1 = v8;
        return v9;
      }

LABEL_64:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }

      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }

      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }
}

uint64_t sub_188F602EC( _BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int8 v7 = *a3;
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 == 2) {
        goto LABEL_10;
      }
      if (a6) {
        goto LABEL_29;
      }
      int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 != 2 && a6) {
        goto LABEL_29;
      }
LABEL_10:
      int v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
LABEL_11:
      if (!__stxr(v7, a4)) {
        goto LABEL_28;
      }
      goto LABEL_26;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
      if (a6) {
        goto LABEL_29;
      }
      int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 4LL:
      if (a6 != 5 && a6 != 2) {
        goto LABEL_23;
      }
      goto LABEL_24;
    case 5LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
LABEL_23:
      if (!a6)
      {
LABEL_24:
        int v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            uint64_t v9 = 1LL;
            goto LABEL_27;
          }
        }

        else
        {
LABEL_20:
          __clrex();
        }

LABEL_26:
        uint64_t v9 = 0LL;
LABEL_27:
        *a1 = v8;
        return v9;
      }

        uint64_t v9 = 0LL;
LABEL_27:
        *a1 = v8;
        return v9;
      }

        uint64_t v9 = 0LL;
LABEL_27:
        *a1 = v8;
        return v9;
      }

        uint64_t v9 = 0LL;
LABEL_27:
        *a1 = v8;
        return v9;
      }

      uint64_t v9 = 0LL;
      if (v8)
      {
LABEL_27:
        *a1 = v8;
        return v9;
      }

LABEL_29:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }

      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }

      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }

      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_29;
  }

      sub_188F6DCFC();
      __break(1u);
LABEL_30:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_30;
  }

char *sub_188F60440@<X0>( char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (char *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

char *sub_188F6052C@<X0>( char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (char *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

char *sub_188F60618@<X0>( char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (char *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

char *sub_188F60704@<X0>( char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (char *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

char *sub_188F607F0@<X0>( char *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X8>)
{
  char v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (char *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t UInt16.AtomicRepresentation._storage.setter(uint64_t result)
{
  _WORD *v1 = result;
  return result;
}

uint64_t (*UInt16.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned __int16 *sub_188F608FC@<X0>( unsigned __int16 *result@<X0>, uint64_t a2@<X1>, unsigned __int16 *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unsigned __int16 v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }

  if (!a2)
  {
    unsigned __int16 v3 = *result;
    goto LABEL_6;
  }

  uint64_t result = (unsigned __int16 *)sub_188F6DD08();
  __break(1u);
  return result;
}

unsigned __int16 *sub_188F60984(unsigned __int16 *result, unsigned __int16 *a2, uint64_t a3)
{
  unsigned __int16 v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }

  else if (a3)
  {
    uint64_t result = (unsigned __int16 *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    *a2 = v3;
  }

  return result;
}

unsigned __int16 *sub_188F60A0C@<X0>( unsigned __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  unsigned __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (unsigned __int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F60AE4( _WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int16 v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      uint64_t v8 = 1LL;
      goto LABEL_18;
    case 2LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    int v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F60C00( _WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int16 v7 = *a3;
  switch(a5)
  {
    case 0LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          uint64_t v9 = 1LL;
          goto LABEL_62;
        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 2LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 3LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 4LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 5LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
LABEL_61:
          uint64_t v9 = 1LL;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2LL:
          while (1)
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

uint64_t sub_188F60E70( _WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned __int16 v7 = *a3;
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 == 2) {
        goto LABEL_10;
      }
      if (a6) {
        goto LABEL_29;
      }
      int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 != 2 && a6) {
        goto LABEL_29;
      }
LABEL_10:
      int v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
LABEL_11:
      if (!__stxr(v7, a4)) {
        goto LABEL_28;
      }
      goto LABEL_26;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
      if (a6) {
        goto LABEL_29;
      }
      int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 4LL:
      if (a6 != 5 && a6 != 2) {
        goto LABEL_23;
      }
      goto LABEL_24;
    case 5LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
LABEL_23:
      if (!a6)
      {
LABEL_24:
        int v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            uint64_t v9 = 1LL;
            goto LABEL_27;
          }
        }

        else
        {
LABEL_20:
          __clrex();
        }

__int16 *sub_188F60FC4@<X0>( __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (__int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

__int16 *sub_188F610B0@<X0>( __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (__int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

__int16 *sub_188F6119C@<X0>( __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (__int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

__int16 *sub_188F61288@<X0>( __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (__int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

__int16 *sub_188F61374@<X0>( __int16 *result@<X0>, unsigned __int16 *a2@<X1>, uint64_t a3@<X2>, unsigned __int16 *a4@<X8>)
{
  __int16 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int16 v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int16 v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (__int16 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t UInt32.AtomicRepresentation._storage.setter(uint64_t result)
{
  _DWORD *v1 = result;
  return result;
}

uint64_t (*UInt32.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unsigned int *sub_188F61480@<X0>(unsigned int *result@<X0>, uint64_t a2@<X1>, unsigned int *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unsigned int v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }

  if (!a2)
  {
    unsigned int v3 = *result;
    goto LABEL_6;
  }

  uint64_t result = (unsigned int *)sub_188F6DD08();
  __break(1u);
  return result;
}

unsigned int *sub_188F61508(unsigned int *result, unsigned int *a2, uint64_t a3)
{
  unsigned int v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }

  else if (a3)
  {
    uint64_t result = (unsigned int *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    *a2 = v3;
  }

  return result;
}

unsigned int *sub_188F61590@<X0>( unsigned int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  unsigned int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (unsigned int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F61668(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned int v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        unsigned int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      uint64_t v8 = 1LL;
      goto LABEL_18;
    case 2LL:
      while (1)
      {
        unsigned int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        unsigned int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        unsigned int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    unsigned int v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F61784(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned int v7 = *a3;
  switch(a5)
  {
    case 0LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            unsigned int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          uint64_t v9 = 1LL;
          goto LABEL_62;
        case 2LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 2LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 3LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unsigned int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 4LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 5LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
LABEL_61:
          uint64_t v9 = 1LL;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2LL:
          while (1)
          {
            unsigned int v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

uint64_t sub_188F619F4(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5, uint64_t a6)
{
  int v6 = *a2;
  unsigned int v7 = *a3;
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 == 2) {
        goto LABEL_10;
      }
      if (a6) {
        goto LABEL_29;
      }
      unsigned int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 != 2 && a6) {
        goto LABEL_29;
      }
LABEL_10:
      unsigned int v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
LABEL_11:
      if (!__stxr(v7, a4)) {
        goto LABEL_28;
      }
      goto LABEL_26;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
      if (a6) {
        goto LABEL_29;
      }
      unsigned int v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 4LL:
      if (a6 != 5 && a6 != 2) {
        goto LABEL_23;
      }
      goto LABEL_24;
    case 5LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
LABEL_23:
      if (!a6)
      {
LABEL_24:
        unsigned int v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            uint64_t v9 = 1LL;
            goto LABEL_27;
          }
        }

        else
        {
LABEL_20:
          __clrex();
        }

int *sub_188F61B48@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

int *sub_188F61C34@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

int *sub_188F61D20@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

int *sub_188F61E0C@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

int *sub_188F61EF8@<X0>(int *result@<X0>, unsigned int *a2@<X1>, uint64_t a3@<X2>, unsigned int *a4@<X8>)
{
  int v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned int v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned int v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (int *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t UInt64.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UInt64.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

uint64_t Int.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*Int.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

void *sub_188F62024@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_188F62030(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t *sub_188F6203C@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F620F4(result, a2, a3);
}

unint64_t *sub_188F62044(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  return sub_188F62178(result, a2, a3);
}

unint64_t *sub_188F6204C@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F621FC(result, a2, a3, a4);
}

uint64_t sub_188F62054( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F622D0(a1, a2, a3, a4, a5);
}

uint64_t sub_188F6205C( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F623E4(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F62084( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F6264C(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t *sub_188F620AC@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F627A0(result, a2, a3, a4);
}

uint64_t *sub_188F620B4@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62888(result, a2, a3, a4);
}

uint64_t *sub_188F620BC@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62970(result, a2, a3, a4);
}

uint64_t *sub_188F620C4@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62A58(result, a2, a3, a4);
}

uint64_t *sub_188F620CC@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F62B40(result, a2, a3, a4);
}

uint64_t UInt.AtomicRepresentation._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UInt.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

unint64_t *sub_188F620F4@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unint64_t v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }

  if (!a2)
  {
    unint64_t v3 = *result;
    goto LABEL_6;
  }

  uint64_t result = (unint64_t *)sub_188F6DD08();
  __break(1u);
  return result;
}

unint64_t *sub_188F62178(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }

  else if (a3)
  {
    uint64_t result = (unint64_t *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    *a2 = v3;
  }

  return result;
}

unint64_t *sub_188F621FC@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (unint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F622D0( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    unint64_t v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F623E4( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }

      goto LABEL_61;
    case 2LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }

      goto LABEL_61;
    case 3LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }

      goto LABEL_61;
    case 4LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_63;
      }

      goto LABEL_61;
    case 5LL:
      switch(a6)
      {
        case 0LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
LABEL_61:
          uint64_t v9 = 1LL;
LABEL_62:
          *a1 = v8;
          return v9;
        case 2LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

LABEL_63:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_63;
  }

uint64_t sub_188F6264C( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 == 2) {
        goto LABEL_10;
      }
      if (a6) {
        goto LABEL_29;
      }
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_11;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 != 2 && a6) {
        goto LABEL_29;
      }
LABEL_10:
      unint64_t v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
LABEL_11:
      if (!__stxr(v7, a4)) {
        goto LABEL_28;
      }
      goto LABEL_26;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
      if (a6) {
        goto LABEL_29;
      }
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 4LL:
      if (a6 != 5 && a6 != 2) {
        goto LABEL_23;
      }
      goto LABEL_24;
    case 5LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
LABEL_23:
      if (!a6)
      {
LABEL_24:
        unint64_t v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_25:
          if (!__stlxr(v7, a4))
          {
LABEL_28:
            uint64_t v9 = 1LL;
            goto LABEL_27;
          }
        }

        else
        {
LABEL_20:
          __clrex();
        }

uint64_t *sub_188F627A0@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v5 + v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 + v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (uint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t *sub_188F62888@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v5 - v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 - v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (uint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t *sub_188F62970@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v5 & v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 & v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (uint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t *sub_188F62A58@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v5 | v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 | v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (uint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t *sub_188F62B40@<X0>( uint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v5 ^ v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (uint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t DoubleWord.AtomicRepresentation._storage.setter(uint64_t result, uint64_t a2)
{
  void *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*DoubleWord.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_188F62C48()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

_UNKNOWN **sub_188F62C54()
{
  return &protocol witness table for Int8.AtomicRepresentation;
}

unint64_t sub_188F62C60(uint64_t a1)
{
  unint64_t result = sub_188F62C84();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62C84()
{
  unint64_t result = qword_18C75B2C0;
  if (!qword_18C75B2C0)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A378], MEMORY[0x18961A350]);
    atomic_store(result, (unint64_t *)&qword_18C75B2C0);
  }

  return result;
}

_UNKNOWN **sub_188F62CC8()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

_UNKNOWN **sub_188F62CD4()
{
  return &protocol witness table for Int16.AtomicRepresentation;
}

unint64_t sub_188F62CE0(uint64_t a1)
{
  unint64_t result = sub_188F62D04();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62D04()
{
  unint64_t result = qword_18C75B2C8;
  if (!qword_18C75B2C8)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A430], MEMORY[0x18961A408]);
    atomic_store(result, (unint64_t *)&qword_18C75B2C8);
  }

  return result;
}

_UNKNOWN **sub_188F62D48()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

_UNKNOWN **sub_188F62D54()
{
  return &protocol witness table for Int32.AtomicRepresentation;
}

unint64_t sub_188F62D60(uint64_t a1)
{
  unint64_t result = sub_188F62D84();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62D84()
{
  unint64_t result = qword_18C75B2D0;
  if (!qword_18C75B2D0)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A488], MEMORY[0x18961A458]);
    atomic_store(result, (unint64_t *)&qword_18C75B2D0);
  }

  return result;
}

_UNKNOWN **sub_188F62DC8()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

_UNKNOWN **sub_188F62DD4()
{
  return &protocol witness table for Int64.AtomicRepresentation;
}

unint64_t sub_188F62DE0(uint64_t a1)
{
  unint64_t result = sub_188F62E04();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62E04()
{
  unint64_t result = qword_18C75B2D8;
  if (!qword_18C75B2D8)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A4F8], MEMORY[0x18961A4C0]);
    atomic_store(result, (unint64_t *)&qword_18C75B2D8);
  }

  return result;
}

_UNKNOWN **sub_188F62E48()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

_UNKNOWN **sub_188F62E54()
{
  return &protocol witness table for UInt8.AtomicRepresentation;
}

unint64_t sub_188F62E60(uint64_t a1)
{
  unint64_t result = sub_188F62E84();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62E84()
{
  unint64_t result = qword_18C75B2E0;
  if (!qword_18C75B2E0)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A648], MEMORY[0x18961A610]);
    atomic_store(result, (unint64_t *)&qword_18C75B2E0);
  }

  return result;
}

_UNKNOWN **sub_188F62EC8()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

_UNKNOWN **sub_188F62ED4()
{
  return &protocol witness table for UInt16.AtomicRepresentation;
}

unint64_t sub_188F62EE0(uint64_t a1)
{
  unint64_t result = sub_188F62F04();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62F04()
{
  unint64_t result = qword_18C75B2E8;
  if (!qword_18C75B2E8)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A828], MEMORY[0x18961A800]);
    atomic_store(result, (unint64_t *)&qword_18C75B2E8);
  }

  return result;
}

_UNKNOWN **sub_188F62F48()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

_UNKNOWN **sub_188F62F54()
{
  return &protocol witness table for UInt32.AtomicRepresentation;
}

unint64_t sub_188F62F60(uint64_t a1)
{
  unint64_t result = sub_188F62F84();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F62F84()
{
  unint64_t result = qword_18C75B2F0;
  if (!qword_18C75B2F0)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A890], MEMORY[0x18961A860]);
    atomic_store(result, (unint64_t *)&qword_18C75B2F0);
  }

  return result;
}

_UNKNOWN **sub_188F62FC8()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

_UNKNOWN **sub_188F62FD4()
{
  return &protocol witness table for UInt64.AtomicRepresentation;
}

unint64_t sub_188F62FE0(uint64_t a1)
{
  unint64_t result = sub_188F63004();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F63004()
{
  unint64_t result = qword_18C75B2F8;
  if (!qword_18C75B2F8)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x18961A8F8], MEMORY[0x18961A8C8]);
    atomic_store(result, (unint64_t *)&qword_18C75B2F8);
  }

  return result;
}

_UNKNOWN **sub_188F63048()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

_UNKNOWN **sub_188F63054()
{
  return &protocol witness table for Int.AtomicRepresentation;
}

unint64_t sub_188F63060(uint64_t a1)
{
  unint64_t result = sub_188F63084();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F63084()
{
  unint64_t result = qword_18C75B300;
  if (!qword_18C75B300)
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x189618798], MEMORY[0x189618740]);
    atomic_store(result, (unint64_t *)&qword_18C75B300);
  }

  return result;
}

_UNKNOWN **sub_188F630C8()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

_UNKNOWN **sub_188F630D4()
{
  return &protocol witness table for UInt.AtomicRepresentation;
}

unint64_t sub_188F630E0(uint64_t a1)
{
  unint64_t result = sub_188F63104();
  *(void *)(a1 + 16) = result;
  return result;
}

unint64_t sub_188F63104()
{
  unint64_t result = qword_18C75B308[0];
  if (!qword_18C75B308[0])
  {
    unint64_t result = MEMORY[0x1895DB1B8](MEMORY[0x189618D00], MEMORY[0x189618CD8]);
    atomic_store(result, qword_18C75B308);
  }

  return result;
}

_UNKNOWN **sub_188F63148()
{
  return &protocol witness table for DoubleWord.AtomicRepresentation;
}

__n128 sub_188F63154@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result = *a1;
  *a2 = *a1;
  return result;
}

__n128 sub_188F63160@<Q0>(__n128 *a1@<X8>)
{
  __n128 result = *v1;
  *a1 = *v1;
  return result;
}

unsigned __int128 *sub_188F6316C@<X0>(unsigned __int128 *result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  switch(a2)
  {
    case 0LL:
      do
      {
        unsigned __int128 v6 = __ldxp(result);
        uint64_t v3 = *((void *)&v6 + 1);
        uint64_t v4 = v6;
      }

      while (__stxp(v6, result));
      goto LABEL_9;
    case 2LL:
      do
      {
        unsigned __int128 v5 = __ldaxp(result);
        uint64_t v3 = *((void *)&v5 + 1);
        uint64_t v4 = v5;
      }

      while (__stxp(v5, result));
LABEL_9:
      *a3 = v4;
      a3[1] = v3;
      return result;
    case 5LL:
      do
      {
        unsigned __int128 v7 = __ldaxp(result);
        uint64_t v3 = *((void *)&v7 + 1);
        uint64_t v4 = v7;
      }

      while (__stlxp(v7, result));
      goto LABEL_9;
  }

  __n128 result = (unsigned __int128 *)sub_188F6DD08();
  __break(1u);
  return result;
}

unint64_t *sub_188F63214(unint64_t *result, unsigned __int128 *a2, uint64_t a3)
{
  unint64_t v3 = *result;
  unint64_t v4 = result[1];
  if (a3 == 5)
  {
    do
      __ldaxp(a2);
    while (__stlxp(__PAIR128__(v4, v3), a2));
  }

  else if (a3 == 3)
  {
    do
      __ldxp(a2);
    while (__stlxp(__PAIR128__(v4, v3), a2));
  }

  else if (a3)
  {
    __n128 result = (unint64_t *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    do
      __ldxp(a2);
    while (__stxp(__PAIR128__(v4, v3), a2));
  }

  return result;
}

unint64_t *sub_188F632BC@<X0>( unint64_t *result@<X0>, unsigned __int128 *a2@<X1>, uint64_t a3@<X2>, void *a4@<X8>)
{
  unint64_t v4 = *result;
  unint64_t v5 = result[1];
  switch(a3)
  {
    case 0LL:
      do
      {
        unsigned __int128 v8 = __ldxp(a2);
        uint64_t v6 = *((void *)&v8 + 1);
        uint64_t v7 = v8;
      }

      while (__stxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 2LL:
      do
      {
        unsigned __int128 v10 = __ldaxp(a2);
        uint64_t v6 = *((void *)&v10 + 1);
        uint64_t v7 = v10;
      }

      while (__stxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 3LL:
      do
      {
        unsigned __int128 v11 = __ldxp(a2);
        uint64_t v6 = *((void *)&v11 + 1);
        uint64_t v7 = v11;
      }

      while (__stlxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 4LL:
      do
      {
        unsigned __int128 v9 = __ldaxp(a2);
        uint64_t v6 = *((void *)&v9 + 1);
        uint64_t v7 = v9;
      }

      while (__stlxp(__PAIR128__(v5, v4), a2));
      goto LABEL_11;
    case 5LL:
      do
      {
        unsigned __int128 v12 = __ldaxp(a2);
        uint64_t v6 = *((void *)&v12 + 1);
        uint64_t v7 = v12;
      }

      while (__stlxp(__PAIR128__(v5, v4), a2));
LABEL_11:
      *a4 = v7;
      a4[1] = v6;
      break;
    default:
      __n128 result = (unint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F63394(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  uint64_t v6 = *a2;
  uint64_t v5 = a2[1];
  unint64_t v7 = *a3;
  unint64_t v8 = a3[1];
  switch(a5)
  {
    case 0LL:
      do
      {
        while (1)
        {
          unsigned __int128 v13 = __ldxp(a4);
          uint64_t v9 = *((void *)&v13 + 1);
          uint64_t v10 = v13;
          int v14 = (void)v13 != v6;
          if (*((void *)&v13 + 1) != v5) {
            ++v14;
          }
          if (!v14) {
            break;
          }
          if (!__stxp(v13, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 2LL:
      do
      {
        while (1)
        {
          unsigned __int128 v15 = __ldaxp(a4);
          uint64_t v9 = *((void *)&v15 + 1);
          uint64_t v10 = v15;
          int v16 = (void)v15 != v6;
          if (*((void *)&v15 + 1) != v5) {
            ++v16;
          }
          if (!v16) {
            break;
          }
          if (!__stxp(v15, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 3LL:
      do
      {
        while (1)
        {
          unsigned __int128 v17 = __ldxp(a4);
          uint64_t v9 = *((void *)&v17 + 1);
          uint64_t v10 = v17;
          int v18 = (void)v17 != v6;
          if (*((void *)&v17 + 1) != v5) {
            ++v18;
          }
          if (!v18) {
            break;
          }
          if (!__stlxp(v17, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stlxp(__PAIR128__(v8, v7), a4));
      goto LABEL_29;
    case 4LL:
    case 5LL:
      goto LABEL_2;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  do
  {
    while (1)
    {
LABEL_2:
      unsigned __int128 v11 = __ldaxp(a4);
      uint64_t v9 = *((void *)&v11 + 1);
      uint64_t v10 = v11;
      int v12 = (void)v11 != v6;
      if (*((void *)&v11 + 1) != v5) {
        ++v12;
      }
      if (!v12) {
        break;
      }
      if (!__stlxp(v11, a4)) {
        goto LABEL_29;
      }
    }
  }

  while (__stlxp(__PAIR128__(v8, v7), a4));
LABEL_29:
  BOOL v20 = v10 == v6 && v9 == v5;
  *a1 = v10;
  a1[1] = v9;
  return v20;
}

uint64_t sub_188F634F0( void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v8 = *a3;
  unint64_t v9 = a3[1];
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_21;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
          unsigned __int128 v19 = __ldxp(a4);
          uint64_t v10 = *((void *)&v19 + 1);
          uint64_t v11 = v19;
          int v20 = (void)v19 != v7;
          if (*((void *)&v19 + 1) != v6) {
            ++v20;
          }
          if (!v20) {
            break;
          }
          if (!__stxp(v19, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_21;
      }
      if (a6 != 2 && a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
LABEL_12:
          unsigned __int128 v12 = __ldaxp(a4);
          uint64_t v10 = *((void *)&v12 + 1);
          uint64_t v11 = v12;
          int v13 = (void)v12 != v7;
          if (*((void *)&v12 + 1) != v6) {
            ++v13;
          }
          if (!v13) {
            break;
          }
          if (!__stxp(v12, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_21;
      }
      if (a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
          unsigned __int128 v21 = __ldxp(a4);
          uint64_t v10 = *((void *)&v21 + 1);
          uint64_t v11 = v21;
          int v22 = (void)v21 != v7;
          if (*((void *)&v21 + 1) != v6) {
            ++v22;
          }
          if (!v22) {
            break;
          }
          if (!__stlxp(v21, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stlxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 4LL:
    case 5LL:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_50;
      }
      break;
    default:
LABEL_50:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  do
  {
    while (1)
    {
LABEL_21:
      unsigned __int128 v14 = __ldaxp(a4);
      uint64_t v10 = *((void *)&v14 + 1);
      uint64_t v11 = v14;
      int v15 = (void)v14 != v7;
      if (*((void *)&v14 + 1) != v6) {
        ++v15;
      }
      if (!v15) {
        break;
      }
      if (!__stlxp(v14, a4)) {
        goto LABEL_27;
      }
    }
  }

  while (__stlxp(__PAIR128__(v9, v8), a4));
LABEL_27:
  BOOL v17 = v11 == v7 && v10 == v6;
  *a1 = v11;
  a1[1] = v10;
  return v17;
}

uint64_t sub_188F636A4( void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  unint64_t v8 = *a3;
  unint64_t v9 = a3[1];
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_21;
      }
      if (a6 == 2) {
        goto LABEL_12;
      }
      if (a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
          unsigned __int128 v19 = __ldxp(a4);
          uint64_t v10 = *((void *)&v19 + 1);
          uint64_t v11 = v19;
          int v20 = (void)v19 != v7;
          if (*((void *)&v19 + 1) != v6) {
            ++v20;
          }
          if (!v20) {
            break;
          }
          if (!__stxp(v19, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_21;
      }
      if (a6 != 2 && a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
LABEL_12:
          unsigned __int128 v12 = __ldaxp(a4);
          uint64_t v10 = *((void *)&v12 + 1);
          uint64_t v11 = v12;
          int v13 = (void)v12 != v7;
          if (*((void *)&v12 + 1) != v6) {
            ++v13;
          }
          if (!v13) {
            break;
          }
          if (!__stxp(v12, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_21;
      }
      if (a6) {
        goto LABEL_50;
      }
      do
      {
        while (1)
        {
          unsigned __int128 v21 = __ldxp(a4);
          uint64_t v10 = *((void *)&v21 + 1);
          uint64_t v11 = v21;
          int v22 = (void)v21 != v7;
          if (*((void *)&v21 + 1) != v6) {
            ++v22;
          }
          if (!v22) {
            break;
          }
          if (!__stlxp(v21, a4)) {
            goto LABEL_27;
          }
        }
      }

      while (__stlxp(__PAIR128__(v9, v8), a4));
      goto LABEL_27;
    case 4LL:
    case 5LL:
      if (a6 != 5 && a6 != 2 && a6) {
        goto LABEL_50;
      }
      break;
    default:
LABEL_50:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  do
  {
    while (1)
    {
LABEL_21:
      unsigned __int128 v14 = __ldaxp(a4);
      uint64_t v10 = *((void *)&v14 + 1);
      uint64_t v11 = v14;
      int v15 = (void)v14 != v7;
      if (*((void *)&v14 + 1) != v6) {
        ++v15;
      }
      if (!v15) {
        break;
      }
      if (!__stlxp(v14, a4)) {
        goto LABEL_27;
      }
    }
  }

  while (__stlxp(__PAIR128__(v9, v8), a4));
LABEL_27:
  BOOL v17 = v11 == v7 && v10 == v6;
  *a1 = v11;
  a1[1] = v10;
  return v17;
}

ValueMetadata *type metadata accessor for Int8.AtomicRepresentation()
{
  return &type metadata for Int8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int16.AtomicRepresentation()
{
  return &type metadata for Int16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int32.AtomicRepresentation()
{
  return &type metadata for Int32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int64.AtomicRepresentation()
{
  return &type metadata for Int64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt8.AtomicRepresentation()
{
  return &type metadata for UInt8.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt16.AtomicRepresentation()
{
  return &type metadata for UInt16.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt32.AtomicRepresentation()
{
  return &type metadata for UInt32.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt64.AtomicRepresentation()
{
  return &type metadata for UInt64.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for Int.AtomicRepresentation()
{
  return &type metadata for Int.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UInt.AtomicRepresentation()
{
  return &type metadata for UInt.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for DoubleWord.AtomicRepresentation()
{
  return &type metadata for DoubleWord.AtomicRepresentation;
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  v1,  AssociatedTypeWitness);
}

uint64_t AtomicOptionalRawRepresentableStorage._storage.setter(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( v1,  a1,  AssociatedTypeWitness);
}

uint64_t (*AtomicOptionalRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_188F63A2C@<X0>( void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v26 = a5;
  uint64_t v27 = a2;
  v28 = a1;
  uint64_t v29 = a6;
  uint64_t v9 = *(void *)(a3 - 8);
  uint64_t v10 = ((uint64_t (*)(void))MEMORY[0x1895F8858])();
  unsigned __int128 v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](v10);
  int v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  int v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1LL, v14) == 1) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a4 - 8) + 56LL))( v29,  1LL,  1LL,  a4);
  }
  uint64_t v25 = a3;
  uint64_t v24 = v26;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v24, v12, v25);
  }
  return result;
}

uint64_t sub_188F63BC4(uint64_t a1)
{
  return sub_188F63BD8(a1);
}

uint64_t sub_188F63BD8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v6 - v4, a1);
  return sub_188F6DCB4();
}

uint64_t sub_188F63C94@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v28 = a3;
  uint64_t v5 = a2[2];
  uint64_t v6 = sub_188F6DCE4();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)v25 - v8;
  v25[1] = a2[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v11);
  uint64_t v13 = (char *)v25 - v12;
  v25[2] = a2[4];
  uint64_t v14 = swift_getAssociatedTypeWitness();
  uint64_t v26 = *(void *)(v14 - 8);
  MEMORY[0x1895F8858](v14);
  uint64_t v16 = (char *)v25 - v15;
  uint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v27 = a1;
  v17(v9, a1, v6);
  uint64_t v18 = *(void *)(v5 - 8);
  uint64_t v19 = 1LL;
  int v20 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v9, 1LL, v5);
  uint64_t v21 = v7;
  uint64_t v22 = v6;
  if (v20 != 1)
  {
    sub_188F6DCA8();
    uint64_t v19 = 0LL;
    uint64_t v21 = v18;
    uint64_t v22 = v5;
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v22);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v13,  v19,  1LL,  AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))( v13,  v14,  AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v27, v6);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v16, v14);
}

uint64_t sub_188F63EB8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v21 = a2;
  uint64_t v3 = a1[4];
  uint64_t v20 = a1[3];
  uint64_t v4 = a1[2];
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v8 = (char *)&v18 - v7;
  uint64_t v9 = sub_188F6DCE4();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1895F8858](v9);
  uint64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  uint64_t v14 = v19;
  v13(v8, v19, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))( AssociatedTypeWitness,  AssociatedConformanceWitness);
  uint64_t v23 = v4;
  uint64_t v24 = v20;
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  sub_188F63A2C((void (*)(char *, char *))sub_188F65A5C, (uint64_t)v22, MEMORY[0x18961A520], v4, v16, v21);
  (*(void (**)(uint64_t, void *))(*(a1 - 1) + 8LL))(v14, a1);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_188F64060@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v17 = a2;
  uint64_t v18 = a4;
  uint64_t v6 = a3[2];
  uint64_t v7 = a3[3];
  swift_getAssociatedTypeWitness();
  uint64_t v8 = sub_188F6DCE4();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = a3[4];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))( a1,  v17,  AssociatedTypeWitness,  AssociatedConformanceWitness);
  uint64_t v20 = v6;
  uint64_t v21 = v7;
  uint64_t v22 = v12;
  uint64_t v23 = v6;
  sub_188F63A2C((void (*)(char *, char *))sub_188F65A10, (uint64_t)v19, MEMORY[0x18961A520], v6, v15, v18);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_188F641BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v24 = a2;
  uint64_t v25 = a3;
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = sub_188F6DCE4();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1895F8858](v6);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v11 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v11);
  uint64_t v13 = (char *)&v23 - v12;
  uint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v26 = a1;
  v14(v9, a1, v6);
  uint64_t v15 = *(void *)(v5 - 8);
  uint64_t v16 = 1LL;
  int v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1LL, v5);
  uint64_t v18 = v7;
  uint64_t v19 = v6;
  if (v17 != 1)
  {
    sub_188F6DCA8();
    uint64_t v16 = 0LL;
    uint64_t v18 = v15;
    uint64_t v19 = v5;
  }

  (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v19);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v13,  v16,  1LL,  AssociatedTypeWitness);
  uint64_t v20 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))( v13,  v24,  v25,  v20,  AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v26, v6);
}

uint64_t sub_188F6439C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v35 = a2;
  uint64_t v36 = a3;
  uint64_t v37 = a5;
  uint64_t v7 = a4[2];
  uint64_t v8 = sub_188F6DCE4();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v33 - v10;
  uint64_t v39 = a4[3];
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v13 = sub_188F6DCE4();
  uint64_t v33 = *(void *)(v13 - 8);
  uint64_t v34 = v13;
  uint64_t v14 = MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v14);
  uint64_t v18 = (char *)&v33 - v17;
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  uint64_t v38 = a1;
  v19(v11, a1, v8);
  uint64_t v20 = *(void *)(v7 - 8);
  uint64_t v21 = 1LL;
  int v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v11, 1LL, v7);
  uint64_t v23 = v9;
  uint64_t v24 = v8;
  if (v22 != 1)
  {
    sub_188F6DCA8();
    uint64_t v21 = 0LL;
    uint64_t v23 = v20;
    uint64_t v24 = v7;
  }

  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v24);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL))( v16,  v21,  1LL,  AssociatedTypeWitness);
  uint64_t v25 = a4[4];
  uint64_t v26 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))( v16,  v35,  v36,  v26,  AssociatedConformanceWitness);
  MEMORY[0x1895F8858](v28);
  uint64_t v29 = v39;
  *(&v33 - 4) = v7;
  *(&v33 - 3) = v29;
  *(&v33 - 2) = v25;
  *(&v33 - 1) = v7;
  uint64_t v30 = v34;
  sub_188F63A2C( (void (*)(char *, char *))sub_188F65A5C,  (uint64_t)(&v33 - 6),  MEMORY[0x18961A520],  v7,  v31,  v37);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v38, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v18, v30);
}

uint64_t sub_188F64620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v58 = a4;
  uint64_t v59 = a5;
  uint64_t v67 = a3;
  uint64_t v61 = a1;
  uint64_t v8 = *(void *)(a6 + 16);
  uint64_t v9 = sub_188F6DCE4();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x1895F8858](v9);
  v52 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v11);
  uint64_t v14 = (char *)&v51 - v13;
  uint64_t v56 = a6;
  uint64_t v15 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v17 = sub_188F6DCE4();
  uint64_t v55 = *(void *)(v17 - 8);
  uint64_t v18 = MEMORY[0x1895F8858](v17);
  v54 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v18);
  uint64_t v21 = (char *)&v51 - v20;
  uint64_t v60 = v22;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v57 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v23 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  v53 = (char *)&v51 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v23);
  v65 = (char *)&v51 - v25;
  uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v26(v14, a2, v9);
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
  int v29 = v28(v14, 1LL, v8);
  uint64_t v64 = v15;
  uint64_t v51 = v27;
  if (v29 == 1)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v30(v21, 1LL, 1LL, AssociatedTypeWitness);
  }

  else
  {
    sub_188F6DCA8();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v8);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v30(v21, 0LL, 1LL, AssociatedTypeWitness);
  }

  uint64_t v31 = v21;
  v32 = v52;
  v26(v52, v67, v9);
  uint64_t v33 = 1LL;
  int v34 = v28(v32, 1LL, v8);
  uint64_t v62 = v10;
  uint64_t v63 = v9;
  uint64_t v35 = v54;
  if (v34 != 1)
  {
    sub_188F6DCA8();
    uint64_t v33 = 0LL;
    uint64_t v10 = v51;
    uint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v32, v9);
  v30(v35, v33, 1LL, AssociatedTypeWitness);
  uint64_t v36 = v65;
  uint64_t v37 = v8;
  uint64_t v38 = TupleTypeMetadata2;
  uint64_t v39 = &v65[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v40 = *(void *)(v56 + 32);
  uint64_t v41 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v41) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 56))( v39,  v31,  v35,  v58,  v59,  v41,  AssociatedConformanceWitness);
  uint64_t v43 = v55;
  v44 = *(void (**)(char *, uint64_t))(v55 + 8);
  uint64_t v45 = v60;
  v44(v31, v60);
  *uint64_t v36 = v41 & 1;
  v46 = &v53[*(int *)(v38 + 48)];
  _BYTE *v53 = v41 & 1;
  uint64_t v47 = (*(uint64_t (**)(char *, char *, uint64_t))(v43 + 16))(v46, v39, v45);
  MEMORY[0x1895F8858](v47);
  uint64_t v48 = v64;
  *(&v51 - 4) = v37;
  *(&v51 - 3) = v48;
  *(&v51 - 2) = v40;
  *(&v51 - 1) = v37;
  sub_188F63A2C( (void (*)(char *, char *))sub_188F65A5C,  (uint64_t)(&v51 - 6),  MEMORY[0x18961A520],  v37,  v49,  v61);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v67, v63);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v65, TupleTypeMetadata2);
  v44(v46, v45);
  return v41 & 1;
}

uint64_t sub_188F64A4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = a5;
  uint64_t v61 = a6;
  uint64_t v59 = a4;
  uint64_t v69 = a3;
  uint64_t v63 = a1;
  uint64_t v9 = *(void *)(a7 + 16);
  uint64_t v10 = sub_188F6DCE4();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v53 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v57 = a7;
  uint64_t v16 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v18 = sub_188F6DCE4();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v18);
  uint64_t v55 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  uint64_t v22 = (char *)&v52 - v21;
  uint64_t v62 = v23;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v58 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  v54 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v24);
  uint64_t v67 = (char *)&v52 - v26;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v27(v15, a2, v10);
  uint64_t v28 = *(void *)(v9 - 8);
  int v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v15, 1LL, v9);
  uint64_t v66 = v16;
  uint64_t v52 = v28;
  if (v30 == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v31(v22, 1LL, 1LL, AssociatedTypeWitness);
  }

  else
  {
    sub_188F6DCA8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v9);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v31(v22, 0LL, 1LL, AssociatedTypeWitness);
  }

  v32 = v22;
  uint64_t v33 = v53;
  v27(v53, v69, v10);
  uint64_t v34 = 1LL;
  int v35 = v29(v33, 1LL, v9);
  uint64_t v64 = v11;
  uint64_t v65 = v10;
  uint64_t v36 = v55;
  if (v35 != 1)
  {
    sub_188F6DCA8();
    uint64_t v34 = 0LL;
    uint64_t v11 = v52;
    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v33, v10);
  v31(v36, v34, 1LL, AssociatedTypeWitness);
  uint64_t v37 = v67;
  uint64_t v38 = v9;
  uint64_t v39 = TupleTypeMetadata2;
  uint64_t v40 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v41 = *(void *)(v57 + 32);
  uint64_t v42 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v42) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))( v40,  v32,  v36,  v59,  v60,  v61,  v42,  AssociatedConformanceWitness);
  uint64_t v44 = v56;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v56 + 8);
  uint64_t v46 = v62;
  v45(v32, v62);
  *uint64_t v37 = v42 & 1;
  uint64_t v47 = &v54[*(int *)(v39 + 48)];
  _BYTE *v54 = v42 & 1;
  uint64_t v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v44 + 16))(v47, v40, v46);
  MEMORY[0x1895F8858](v48);
  uint64_t v49 = v66;
  *(&v52 - 4) = v38;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v41;
  *(&v52 - 1) = v38;
  sub_188F63A2C( (void (*)(char *, char *))sub_188F65A5C,  (uint64_t)(&v52 - 6),  MEMORY[0x18961A520],  v38,  v50,  v63);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v69, v65);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v67, TupleTypeMetadata2);
  v45(v47, v46);
  return v42 & 1;
}

uint64_t sub_188F64E80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v60 = a5;
  uint64_t v61 = a6;
  uint64_t v59 = a4;
  uint64_t v69 = a3;
  uint64_t v63 = a1;
  uint64_t v9 = *(void *)(a7 + 16);
  uint64_t v10 = sub_188F6DCE4();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = MEMORY[0x1895F8858](v10);
  v53 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v15 = (char *)&v52 - v14;
  uint64_t v57 = a7;
  uint64_t v16 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v18 = sub_188F6DCE4();
  uint64_t v56 = *(void *)(v18 - 8);
  uint64_t v19 = MEMORY[0x1895F8858](v18);
  uint64_t v55 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v19);
  uint64_t v22 = (char *)&v52 - v21;
  uint64_t v62 = v23;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v58 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v24 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  v54 = (char *)&v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v24);
  uint64_t v67 = (char *)&v52 - v26;
  uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v27(v15, a2, v10);
  uint64_t v28 = *(void *)(v9 - 8);
  int v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  int v30 = v29(v15, 1LL, v9);
  uint64_t v66 = v16;
  uint64_t v52 = v28;
  if (v30 == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v10);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v31(v22, 1LL, 1LL, AssociatedTypeWitness);
  }

  else
  {
    sub_188F6DCA8();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v9);
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
    v31(v22, 0LL, 1LL, AssociatedTypeWitness);
  }

  v32 = v22;
  uint64_t v33 = v53;
  v27(v53, v69, v10);
  uint64_t v34 = 1LL;
  int v35 = v29(v33, 1LL, v9);
  uint64_t v64 = v11;
  uint64_t v65 = v10;
  uint64_t v36 = v55;
  if (v35 != 1)
  {
    sub_188F6DCA8();
    uint64_t v34 = 0LL;
    uint64_t v11 = v52;
    uint64_t v10 = v9;
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v33, v10);
  v31(v36, v34, 1LL, AssociatedTypeWitness);
  uint64_t v37 = v67;
  uint64_t v38 = v9;
  uint64_t v39 = TupleTypeMetadata2;
  uint64_t v40 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
  uint64_t v41 = *(void *)(v57 + 32);
  uint64_t v42 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  LOBYTE(v42) = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))( v40,  v32,  v36,  v59,  v60,  v61,  v42,  AssociatedConformanceWitness);
  uint64_t v44 = v56;
  uint64_t v45 = *(void (**)(char *, uint64_t))(v56 + 8);
  uint64_t v46 = v62;
  v45(v32, v62);
  *uint64_t v37 = v42 & 1;
  uint64_t v47 = &v54[*(int *)(v39 + 48)];
  _BYTE *v54 = v42 & 1;
  uint64_t v48 = (*(uint64_t (**)(char *, char *, uint64_t))(v44 + 16))(v47, v40, v46);
  MEMORY[0x1895F8858](v48);
  uint64_t v49 = v66;
  *(&v52 - 4) = v38;
  *(&v52 - 3) = v49;
  *(&v52 - 2) = v41;
  *(&v52 - 1) = v38;
  sub_188F63A2C( (void (*)(char *, char *))sub_188F65A5C,  (uint64_t)(&v52 - 6),  MEMORY[0x18961A520],  v38,  v50,  v63);
  (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v69, v65);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v67, TupleTypeMetadata2);
  v45(v47, v46);
  return v42 & 1;
}

uint64_t sub_188F652B4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_188F652BC()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_188F6535C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(void *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }

  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }

  return a1;
}

uint64_t sub_188F6541C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))( a1,  AssociatedTypeWitness);
}

uint64_t sub_188F6548C(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F65510(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F65594(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F65618(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F6569C(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(void *)(v5 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if ((_DWORD)v6) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if ((_DWORD)v7)
  {
    __asm { BR              X11 }
  }

  return (v6 + v11 + 1);
}

void sub_188F6580C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    unsigned int v9 = 0u;
  }

  else if (v8 <= 3)
  {
    unsigned int v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      unsigned int v9 = 4u;
    }

    else if (v11 >= 0x100)
    {
      unsigned int v9 = 2;
    }

    else
    {
      unsigned int v9 = v11 > 1;
    }
  }

  else
  {
    unsigned int v9 = 1u;
  }

  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }

        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }

        else
        {
          *a1 = v12;
        }
      }
    }

    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for AtomicOptionalRawRepresentableStorage( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for AtomicOptionalRawRepresentableStorage);
}

uint64_t sub_188F65A10(uint64_t a1)
{
  return sub_188F63BD8(a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1895DB1A0](a1, v6, a5);
}

uint64_t sub_188F65A5C(uint64_t a1)
{
  return sub_188F65A10(a1);
}

uint64_t _concurrencyWindow.getter()
{
  return 20LL;
}

  ;
}

uint64_t _AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (a2)
  {
    sub_188F6DCF0();
    sub_188F6DC9C();
    DoubleWord.description.getter();
    sub_188F6DC9C();
    swift_bridgeObjectRelease();
    uint64_t result = sub_188F6DD08();
    __break(1u);
  }

  return result;
}

uint64_t sub_188F65B44(unint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  if ((a1 & 0x8000000000000000LL) == 0 && !HIDWORD(a1)) {
    return a3(a2, a1);
  }
  uint64_t result = sub_188F6DCFC();
  __break(1u);
  return result;
}

uint64_t static _AtomicReferenceStorage.atomicExchange(_:at:)(unint64_t a1, unsigned __int128 *a2)
{
  v10[0] = sub_188F66CDC(a2, 0LL, 0LL, 1);
  v10[1] = v4;
  if ((sub_188F66DB8(v10, a1, a2) & 1) != 0)
  {
    uint64_t v6 = v5;
  }

  else
  {
    do
    {
      char v7 = sub_188F66DB8(v10, a1, a2);
      uint64_t v6 = v8;
      swift_unknownObjectRelease();
    }

    while ((v7 & 1) == 0);
  }

  swift_unknownObjectRelease();
  return v6;
}

uint64_t static _AtomicReferenceStorage.atomicCompareExchange(expected:desired:at:)( uint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  char v3 = sub_188F670B4(a1, a2, a3);
  swift_unknownObjectRelease();
  return v3 & 1;
}

uint64_t AtomicReferenceStorage._storage.setter(uint64_t result, uint64_t a2)
{
  void *v2 = result;
  v2[1] = a2;
  return result;
}

uint64_t (*AtomicReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

  ;
}

uint64_t AtomicReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (_AtomicReferenceStorage.dispose()(a1, a2))
  {
    swift_unknownObjectRetain();
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_unknownObjectRelease();
      return a1;
    }
  }

  else
  {
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

void sub_188F65E00(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = 0LL;
}

uint64_t sub_188F65E28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AtomicReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = result;
  return result;
}

uint64_t sub_188F65E58@<X0>(unsigned __int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0(a1);
  if (v3)
  {
    uint64_t v4 = v3;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      *a2 = v4;
      return result;
    }
  }

  else
  {
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F65F6C(unint64_t *a1, unsigned __int128 *a2)
{
  unint64_t v3 = *a1;
  swift_unknownObjectRetain();
  v7[0] = sub_188F66CDC(a2, 0LL, 0LL, 1);
  v7[1] = v4;
  if ((sub_188F66DB8(v7, v3, a2) & 1) == 0)
  {
    do
    {
      char v5 = sub_188F66DB8(v7, v3, a2);
      swift_unknownObjectRelease();
    }

    while ((v5 & 1) == 0);
  }

  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_188F66018@<X0>(unint64_t *a1@<X0>, unsigned __int128 *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_188F66CDC(a2, 0LL, 0LL, 1);
  v12[1] = v6;
  if ((sub_188F66DB8(v12, v5, a2) & 1) != 0)
  {
    uint64_t v8 = v7;
  }

  else
  {
    do
    {
      char v9 = sub_188F66DB8(v12, v5, a2);
      uint64_t v8 = v10;
      swift_unknownObjectRelease();
    }

    while ((v9 & 1) == 0);
  }

  swift_unknownObjectRelease();
  if (v8)
  {
    v12[0] = v8;
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      uint64_t result = swift_unknownObjectRelease();
      *a3 = v8;
      return result;
    }
  }

  else
  {
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F661BC(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_188F670B4(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }

  else
  {
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F66314(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  return sub_188F66364(a1, a2, a3, a4) & 1;
}

uint64_t sub_188F6633C(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  return sub_188F66364(a1, a2, a3, a4) & 1;
}

uint64_t sub_188F66364(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_188F670B4(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (v10)
  {
    swift_unknownObjectRetain_n();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      *a1 = v10;
      return v8 & 1;
    }
  }

  else
  {
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t (*AtomicOptionalReferenceStorage._storage.modify())()
{
  return nullsub_1;
}

  ;
}

uint64_t AtomicOptionalReferenceStorage.dispose()(uint64_t a1, __int16 a2)
{
  if (!_AtomicReferenceStorage.dispose()(a1, a2)) {
    return a1;
  }
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    return a1;
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

void sub_188F66588(void *a1@<X8>)
{
  *a1 = v2;
  a1[1] = 0LL;
}

uint64_t sub_188F665B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t result = AtomicOptionalReferenceStorage.dispose()(*v1, v1[1]);
  *a1 = v3;
  return result;
}

uint64_t sub_188F665E8@<X0>(unsigned __int128 *a1@<X0>, uint64_t *a2@<X8>)
{
  do
  {
    unsigned __int128 v6 = __ldxp(a1);
    unint64_t v5 = *((void *)&v6 + 1);
    unint64_t v4 = v6;
  }

  while (__stxp(v6, a1));
  if ((void)v6)
  {
    while ((_WORD)v5 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          unsigned __int128 v7 = __ldaxp(a1);
          int v8 = (void)v7 != v4;
          if (*((void *)&v7 + 1) != v5) {
            ++v8;
          }
          if (!v8) {
            break;
          }
          if (!__stxp(v7, a1)) {
            goto LABEL_10;
          }
        }
      }

      while (__stxp(__PAIR128__(v5 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v5 + 1), v4), a1));
LABEL_10:
      if ((void)v7 == v4 && *((void *)&v7 + 1) == v5)
      {
        unint64_t v5 = v5 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v5 + 1);
        goto LABEL_18;
      }

      unint64_t v5 = *((void *)&v7 + 1);
      unint64_t v4 = v7;
      if (!(void)v7) {
        goto LABEL_18;
      }
    }

    sub_188F6DD08();
    __break(1u);
    goto LABEL_23;
  }

  __dmb(9u);
LABEL_18:
  uint64_t result = sub_188F66B0C(v4, v5, a1);
  uint64_t v11 = result;
  if (!result)
  {
LABEL_21:
    *a2 = v11;
    return result;
  }

  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    uint64_t result = swift_unknownObjectRelease();
    goto LABEL_21;
  }

LABEL_23:
  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F66774@<X0>(unint64_t *a1@<X0>, unsigned __int128 *a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v5 = *a1;
  swift_unknownObjectRetain_n();
  v12[0] = sub_188F66CDC(a2, 0LL, 0LL, 1);
  v12[1] = v6;
  if ((sub_188F66DB8(v12, v5, a2) & 1) != 0)
  {
    uint64_t v8 = v7;
  }

  else
  {
    do
    {
      char v9 = sub_188F66DB8(v12, v5, a2);
      uint64_t v8 = v10;
      swift_unknownObjectRelease();
    }

    while ((v9 & 1) == 0);
  }

  swift_unknownObjectRelease();
  if (!v8) {
    goto LABEL_7;
  }
  v12[0] = v8;
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_7:
    uint64_t result = swift_unknownObjectRelease();
    *a3 = v8;
    return result;
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F668D8(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_188F670B4(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (!v10) {
    goto LABEL_4;
  }
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F669F4(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  swift_unknownObjectRetain();
  char v8 = sub_188F670B4(v6, v7, a4);
  uint64_t v10 = v9;
  swift_unknownObjectRelease();
  if (!v10) {
    goto LABEL_4;
  }
  swift_unknownObjectRetain_n();
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
LABEL_4:
    swift_unknownObjectRelease();
    *a1 = v10;
    return v8 & 1;
  }

  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F66B0C(unint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  if (!a1) {
    return a1;
  }
  swift_unknownObjectRetain();
  unint64_t v6 = a1;
  unint64_t v7 = a2;
  while ((_WORD)v7)
  {
    do
    {
      while (1)
      {
        unsigned __int128 v8 = __ldaxp(a3);
        int v9 = (void)v8 != v6;
        if (*((void *)&v8 + 1) != v7) {
          ++v9;
        }
        if (!v9) {
          break;
        }
        if (!__stlxp(v8, a3)) {
          goto LABEL_10;
        }
      }
    }

    while (__stlxp(__PAIR128__(v7 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v7 - 1), v6), a3));
LABEL_10:
    if ((void)v8 == v6 && *((void *)&v8 + 1) == v7) {
      return a1;
    }
    if ((void)v8) {
      BOOL v11 = (void)v8 == a1;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      unint64_t v7 = *((void *)&v8 + 1);
      unint64_t v6 = v8;
      if ((*((void *)&v8 + 1) ^ a2) < 0x10000) {
        continue;
      }
    }

    swift_unknownObjectRelease();
    return a1;
  }

  uint64_t result = sub_188F6DD08();
  __break(1u);
  return result;
}

uint64_t _s15AtomicsInternal23_AtomicReferenceStorageV10atomicLoad2atyXlSgSpyACG_tFZ_0(unsigned __int128 *a1)
{
  do
  {
    unsigned __int128 v4 = __ldxp(a1);
    unint64_t v3 = *((void *)&v4 + 1);
    unint64_t v2 = v4;
  }

  while (__stxp(v4, a1));
  if ((void)v4)
  {
    while ((_WORD)v3 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          unsigned __int128 v5 = __ldaxp(a1);
          int v6 = (void)v5 != v2;
          if (*((void *)&v5 + 1) != v3) {
            ++v6;
          }
          if (!v6) {
            break;
          }
          if (!__stxp(v5, a1)) {
            goto LABEL_10;
          }
        }
      }

      while (__stxp(__PAIR128__(v3 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v3 + 1), v2), a1));
LABEL_10:
      if ((void)v5 == v2 && *((void *)&v5 + 1) == v3)
      {
        unint64_t v3 = v3 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(v3 + 1);
        return sub_188F66B0C(v2, v3, a1);
      }

      unint64_t v3 = *((void *)&v5 + 1);
      unint64_t v2 = v5;
      if (!(void)v5) {
        return sub_188F66B0C(v2, v3, a1);
      }
    }

    uint64_t result = sub_188F6DD08();
    __break(1u);
  }

  else
  {
    __dmb(9u);
    return sub_188F66B0C(v2, v3, a1);
  }

  return result;
}

uint64_t sub_188F66CDC(unsigned __int128 *a1, unint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)
  {
    do
    {
      unsigned __int128 v4 = __ldxp(a1);
      a3 = *((void *)&v4 + 1);
      a2 = v4;
    }

    while (__stxp(v4, a1));
  }

  if (a2)
  {
    while ((_WORD)a3 != 0xFFFF)
    {
      do
      {
        while (1)
        {
          unsigned __int128 v5 = __ldaxp(a1);
          int v6 = (void)v5 != a2;
          if (*((void *)&v5 + 1) != a3) {
            ++v6;
          }
          if (!v6) {
            break;
          }
          if (!__stxp(v5, a1)) {
            goto LABEL_11;
          }
        }
      }

      while (__stxp(__PAIR128__(a3 & 0xFFFFFFFFFFFF0000LL | (unsigned __int16)(a3 + 1), a2), a1));
LABEL_11:
      if ((void)v5 != a2 || *((void *)&v5 + 1) != a3)
      {
        a3 = *((void *)&v5 + 1);
        a2 = v5;
        if ((void)v5) {
          continue;
        }
      }

      return a2;
    }

    uint64_t result = sub_188F6DD08();
    __break(1u);
  }

  else
  {
    __dmb(9u);
    return a2;
  }

  return result;
}

uint64_t sub_188F66DB8(uint64_t *a1, unint64_t a2, unsigned __int128 *a3)
{
  uint64_t v6 = *a1;
  uint64_t v7 = a1[1];
  unint64_t v8 = (v7 & 0xFFFFFFFFFFFF0000LL) + 0x10000;
  if (!*a1)
  {
    do
    {
      while (1)
      {
        unsigned __int128 v22 = __ldaxp(a3);
        uint64_t v21 = *((void *)&v22 + 1);
        unint64_t v20 = v22;
        int v23 = (void)v22 != 0LL;
        if (*((void *)&v22 + 1) != v7) {
          ++v23;
        }
        if (!v23) {
          break;
        }
        if (!__stlxp(v22, a3)) {
          goto LABEL_22;
        }
      }
    }

    while (__stlxp(__PAIR128__(v8, a2), a3));
LABEL_22:
    int v29 = a3;
LABEL_48:
    uint64_t v32 = sub_188F66CDC(v29, v20, v21, 0);
    uint64_t result = 0LL;
    *a1 = v32;
    a1[1] = v34;
    return result;
  }

  uint64_t v9 = (unsigned __int16)a1[1];
  uint64_t v10 = v9 + 20;
  sub_188F65B44(v9 + 20, v6, _sa_retain_n);
  BOOL v11 = a3;
  do
  {
    while (1)
    {
      unsigned __int128 v14 = __ldaxp(a3);
      uint64_t v12 = *((void *)&v14 + 1);
      uint64_t v13 = v14;
      int v15 = (void)v14 != v6;
      if (*((void *)&v14 + 1) != v7) {
        ++v15;
      }
      if (!v15) {
        break;
      }
      if (!__stlxp(v14, a3)) {
        goto LABEL_10;
      }
    }
  }

  while (__stlxp(__PAIR128__(v8, a2), a3));
LABEL_10:
  if (*((void *)&v14 + 1) == v7 && (void)v14 == v6)
  {
    uint64_t v17 = v6;
    unint64_t v18 = v14;
    LOWORD(v19) = WORD4(v14);
    goto LABEL_50;
  }

  if (((unint64_t)v7 ^ *((void *)&v14 + 1)) >> 16)
  {
    uint64_t v19 = *((void *)&v14 + 1);
    unint64_t v18 = v14;
LABEL_47:
    uint64_t v30 = v6;
    uint64_t v31 = v11;
    sub_188F65B44(v10 + 1, v30, (uint64_t (*)(uint64_t, unint64_t))_sa_release_n);
    int v29 = v31;
    unint64_t v20 = v18;
    uint64_t v21 = v19;
    goto LABEL_48;
  }

  uint64_t v24 = v6;
  while (1)
  {
    if (!v13) {
      goto LABEL_59;
    }
    if (v13 != v24) {
      goto LABEL_59;
    }
    uint64_t v9 = (unsigned __int16)v12;
    if (!(_WORD)v12) {
      goto LABEL_59;
    }
    if (v10 < (unsigned __int16)v12)
    {
      _sa_retain_n(v6, (unsigned __int16)v12 + 20LL - v10);
      uint64_t v10 = (unsigned __int16)v12 + 20LL;
      BOOL v11 = a3;
    }

    *a1 = v13;
    a1[1] = v12;
    do
    {
      while (1)
      {
        unsigned __int128 v25 = __ldaxp(v11);
        uint64_t v19 = *((void *)&v25 + 1);
        unint64_t v18 = v25;
        int v26 = (void)v25 != v13;
        if (*((void *)&v25 + 1) != v12) {
          ++v26;
        }
        if (!v26) {
          break;
        }
        if (!__stlxp(v25, v11)) {
          goto LABEL_39;
        }
      }
    }

    while (__stlxp(__PAIR128__(v8, a2), v11));
LABEL_39:
    if (*((void *)&v25 + 1) == v12 && (void)v25 == v13) {
      break;
    }
    unint64_t v28 = v12 ^ *((void *)&v25 + 1);
    uint64_t v24 = v13;
    uint64_t v12 = *((void *)&v25 + 1);
    uint64_t v13 = v25;
    if (v28 >= 0x10000) {
      goto LABEL_47;
    }
  }

  uint64_t v17 = v13;
LABEL_50:
  if ((unsigned __int16)v19 != v9 || (v18 ? (BOOL v35 = v18 == v17) : (BOOL v35 = 0), !v35 || v10 < (unsigned __int16)v19))
  {
    while (1)
    {
LABEL_59:
      sub_188F6DD08();
      __break(1u);
LABEL_60:
      sub_188F6DCFC();
      __break(1u);
    }
  }

  sub_188F65B44(v10 - (unsigned __int16)v19 + 1, v6, (uint64_t (*)(uint64_t, unint64_t))_sa_release_n);
  return 1LL;
}

uint64_t sub_188F670B4(uint64_t a1, unint64_t a2, unsigned __int128 *a3)
{
  unint64_t v6 = sub_188F66CDC(a3, 0LL, 0LL, 1);
  unint64_t v10 = v6;
  unint64_t v11 = v7;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_2:
  if (a1 && v6 == a1)
  {
    while ((sub_188F66DB8((uint64_t *)&v10, a2, a3) & 1) == 0)
    {
      swift_unknownObjectRelease();
      unint64_t v6 = v10;
      if (v10) {
        goto LABEL_2;
      }
LABEL_5:
      if (a1) {
        goto LABEL_9;
      }
    }

    if (v8)
    {
      if (!a1 || v8 != a1) {
        goto LABEL_18;
      }
    }

    else if (a1)
    {
LABEL_18:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    }

    return 1LL;
  }

LABEL_9:
  if (a2) {
    swift_unknownObjectRelease();
  }
  sub_188F66B0C(v6, v11, a3);
  return 0LL;
}

ValueMetadata *type metadata accessor for _AtomicReferenceStorage()
{
  return &type metadata for _AtomicReferenceStorage;
}

uint64_t sub_188F671E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for AtomicReferenceStorage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for AtomicReferenceStorage);
}

uint64_t type metadata accessor for AtomicOptionalReferenceStorage( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for AtomicOptionalReferenceStorage);
}

uint64_t sub_188F67208()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t Bool.AtomicRepresentation._storage.setter(uint64_t result)
{
  _BYTE *v1 = result;
  return result;
}

uint64_t (*Bool.AtomicRepresentation._storage.modify())()
{
  return nullsub_1;
}

_UNKNOWN **sub_188F67244()
{
  return &protocol witness table for Bool.AtomicRepresentation;
}

void sub_188F67250(_BYTE *a1@<X8>)
{
  *a1 = *v1 & 1;
}

unsigned __int8 *sub_188F67260@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unsigned __int8 v3 = atomic_load(result);
LABEL_6:
    *a3 = v3 & 1;
    return result;
  }

  if (!a2)
  {
    unsigned __int8 v3 = *result;
    goto LABEL_6;
  }

  uint64_t result = (unsigned __int8 *)sub_188F6DD08();
  __break(1u);
  return result;
}

unsigned __int8 *sub_188F672EC@<X0>( unsigned __int8 *result@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  unsigned __int8 v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unsigned __int8 v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unsigned __int8 v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5 & 1;
      break;
    default:
      uint64_t result = (unsigned __int8 *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F673C8(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  int v5 = *a2;
  unsigned __int8 v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      uint64_t v8 = 1LL;
      goto LABEL_18;
    case 2LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        int v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        int v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    int v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F674E8(_BYTE *a1, _BYTE *a2, _BYTE *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  if ((*a2 & 1) != 0)
  {
    if (*a3)
    {
      int v6 = 1;
      switch(a5)
      {
        case 0LL:
          unsigned __int8 v7 = 1;
          if (!a6) {
            goto LABEL_97;
          }
          if (a6 != 2) {
            goto LABEL_76;
          }
          goto LABEL_19;
        case 2LL:
          goto LABEL_35;
        case 3LL:
          unsigned __int8 v10 = 1;
          if (!a6) {
            goto LABEL_101;
          }
          if (a6 != 2) {
            goto LABEL_80;
          }
          goto LABEL_68;
        case 4LL:
          goto LABEL_41;
        default:
          goto LABEL_22;
      }
    }

    switch(a5)
    {
      case 0LL:
        int v6 = 1;
        if (a6) {
          goto LABEL_18;
        }
        unsigned __int8 v7 = 0;
        goto LABEL_97;
      case 2LL:
        int v6 = 1;
        if (!a6) {
          goto LABEL_89;
        }
        goto LABEL_61;
      case 3LL:
        int v6 = 1;
        if (a6) {
          goto LABEL_67;
        }
        unsigned __int8 v10 = 0;
        goto LABEL_101;
      case 4LL:
        int v6 = 1;
        if (!a6) {
          goto LABEL_85;
        }
        goto LABEL_49;
      case 5LL:
        int v6 = 1;
        if (a6) {
          goto LABEL_72;
        }
        unsigned __int8 v9 = 0;
        goto LABEL_105;
      default:
        goto LABEL_110;
    }
  }

  if ((*a3 & 1) != 0)
  {
    int v6 = 0;
    switch(a5)
    {
      case 0LL:
        int v6 = 0;
        unsigned __int8 v7 = 1;
        if (a6 == 5) {
          goto LABEL_77;
        }
        if (a6 == 2) {
          goto LABEL_19;
        }
        if (a6) {
          goto LABEL_110;
        }
        goto LABEL_97;
      case 2LL:
        int v6 = 0;
LABEL_35:
        unsigned __int8 v11 = 1;
        if (!a6)
        {
          LOBYTE(a6) = 1;
          goto LABEL_89;
        }

        if (a6 != 2) {
          goto LABEL_62;
        }
        goto LABEL_37;
      case 3LL:
        int v6 = 0;
        unsigned __int8 v10 = 1;
        if (a6 == 5) {
          goto LABEL_81;
        }
        if (a6 == 2) {
          goto LABEL_68;
        }
        if (a6) {
          goto LABEL_110;
        }
        goto LABEL_101;
      case 4LL:
        int v6 = 0;
LABEL_41:
        unsigned __int8 v12 = 1;
        if (!a6)
        {
          LOBYTE(a6) = 1;
          goto LABEL_85;
        }

        if (a6 != 2) {
          goto LABEL_50;
        }
        break;
      default:
LABEL_22:
        if (a5 != 5) {
          goto LABEL_110;
        }
        unsigned __int8 v9 = 1;
        if (a6 == 5) {
          goto LABEL_93;
        }
        if (a6 == 2) {
          goto LABEL_73;
        }
        if (a6) {
          goto LABEL_110;
        }
        goto LABEL_105;
    }

LABEL_43:
    while (1)
    {
      int v8 = __ldaxr(a4);
      if (v8 != v6) {
        break;
      }
      if (!__stlxr(v12, a4)) {
        goto LABEL_107;
      }
    }

LABEL_108:
    uint64_t v13 = 0LL;
    __clrex();
  }

  else
  {
    switch(a5)
    {
      case 0LL:
        int v6 = 0;
        if (a6)
        {
LABEL_18:
          unsigned __int8 v7 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_19:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stxr(v7, a4));
          }

          else
          {
LABEL_76:
            if (a6 != 5) {
              goto LABEL_110;
            }
            do
            {
LABEL_77:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v7, a4));
          }

          break;
        }

        unsigned __int8 v7 = 0;
        do
        {
LABEL_97:
          int v8 = __ldxr(a4);
          if (v8 != v6) {
            goto LABEL_108;
          }
        }

        while (__stxr(v7, a4));
        uint64_t v13 = 1LL;
        goto LABEL_109;
      case 2LL:
        int v6 = 0;
        if (a6)
        {
LABEL_61:
          unsigned __int8 v11 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_37:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stxr(v11, a4));
          }

          else
          {
LABEL_62:
            if (a6 != 5) {
              goto LABEL_110;
            }
            do
            {
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v11, a4));
          }
        }

        else
        {
          do
          {
LABEL_89:
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_108;
            }
          }

          while (__stxr(a6, a4));
        }

        break;
      case 3LL:
        int v6 = 0;
        if (a6)
        {
LABEL_67:
          unsigned __int8 v10 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_68:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v10, a4));
          }

          else
          {
LABEL_80:
            if (a6 != 5) {
              goto LABEL_110;
            }
            do
            {
LABEL_81:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v10, a4));
          }
        }

        else
        {
          unsigned __int8 v10 = 0;
          do
          {
LABEL_101:
            int v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_108;
            }
          }

          while (__stlxr(v10, a4));
        }

        break;
      case 4LL:
        int v6 = 0;
        if (a6)
        {
LABEL_49:
          unsigned __int8 v12 = 0;
          if (a6 == 2) {
            goto LABEL_43;
          }
LABEL_50:
          if (a6 != 5) {
            goto LABEL_110;
          }
          do
          {
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_108;
            }
          }

          while (__stlxr(v12, a4));
        }

        else
        {
          do
          {
LABEL_85:
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_108;
            }
          }

          while (__stlxr(a6, a4));
        }

        break;
      case 5LL:
        int v6 = 0;
        if (a6)
        {
LABEL_72:
          unsigned __int8 v9 = 0;
          if (a6 == 2)
          {
            do
            {
LABEL_73:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v9, a4));
          }

          else
          {
            if (a6 != 5)
            {
LABEL_110:
              sub_188F6DC90();
              uint64_t result = sub_188F6DD08();
              __break(1u);
              return result;
            }

            do
            {
LABEL_93:
              int v8 = __ldaxr(a4);
              if (v8 != v6) {
                goto LABEL_108;
              }
            }

            while (__stlxr(v9, a4));
          }
        }

        else
        {
          unsigned __int8 v9 = 0;
          do
          {
LABEL_105:
            int v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_108;
            }
          }

          while (__stlxr(v9, a4));
        }

        break;
      default:
        goto LABEL_110;
    }

LABEL_107:
    uint64_t v13 = 1LL;
  }

LABEL_109:
  *a1 = v8 & 1;
  return v13;
}

uint64_t sub_188F6790C(_BYTE *a1, _BYTE *a2, _BYTE *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6)
{
  if ((*a2 & 1) != 0)
  {
    if (*a3)
    {
      int v6 = 1;
      switch(a5)
      {
        case 0LL:
          int v7 = 1;
          if (!a6) {
            goto LABEL_17;
          }
          goto LABEL_47;
        case 2LL:
          goto LABEL_38;
        case 3LL:
          goto LABEL_41;
        case 4LL:
          goto LABEL_33;
        default:
          goto LABEL_19;
      }
    }

    switch(a5)
    {
      case 0LL:
        LOBYTE(v6) = 0;
        int v7 = 1;
        if (!a6) {
          goto LABEL_17;
        }
        goto LABEL_47;
      case 2LL:
        LOBYTE(v6) = 0;
LABEL_38:
        int v7 = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_47;
      case 3LL:
        LOBYTE(v6) = 0;
LABEL_41:
        int v7 = 1;
        if (a6) {
          goto LABEL_42;
        }
        goto LABEL_56;
      case 4LL:
        LOBYTE(v6) = 0;
LABEL_33:
        int v7 = 1;
        if (!a6) {
          goto LABEL_52;
        }
        goto LABEL_42;
      case 5LL:
        unsigned __int8 v9 = 0;
        int v6 = 1;
        if (!a6) {
          goto LABEL_61;
        }
        goto LABEL_59;
      default:
        goto LABEL_67;
    }
  }

  if ((*a3 & 1) != 0)
  {
    int v6 = 0;
    switch(a5)
    {
      case 0LL:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5) {
          goto LABEL_52;
        }
        if (a6 == 2) {
          goto LABEL_48;
        }
        if (a6) {
          goto LABEL_67;
        }
        goto LABEL_17;
      case 2LL:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_48;
        }
        goto LABEL_47;
      case 3LL:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (a6 == 5 || a6 == 2) {
          goto LABEL_52;
        }
        if (a6) {
          goto LABEL_67;
        }
        goto LABEL_56;
      case 4LL:
        int v7 = 0;
        LOBYTE(v6) = 1;
        if (!a6) {
          goto LABEL_52;
        }
        goto LABEL_42;
      default:
LABEL_19:
        if (a5 != 5) {
          goto LABEL_67;
        }
        unsigned __int8 v9 = 1;
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_67;
        }
        goto LABEL_61;
    }
  }

  switch(a5)
  {
    case 0LL:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_47;
      }
LABEL_17:
      int v8 = __ldxr(a4);
      if (v8 == v7) {
        goto LABEL_49;
      }
      goto LABEL_64;
    case 2LL:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_48;
      }
LABEL_47:
      if (a6 != 2) {
        goto LABEL_51;
      }
LABEL_48:
      int v8 = __ldaxr(a4);
      if (v8 != v7) {
        goto LABEL_64;
      }
LABEL_49:
      if (!__stxr(v6, a4)) {
        goto LABEL_63;
      }
      goto LABEL_65;
    case 3LL:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (a6) {
        goto LABEL_42;
      }
LABEL_56:
      int v8 = __ldxr(a4);
      if (v8 == v7) {
        goto LABEL_53;
      }
      goto LABEL_64;
    case 4LL:
      LOBYTE(v6) = 0;
      int v7 = 0;
      if (!a6) {
        goto LABEL_52;
      }
LABEL_42:
      if (a6 == 2) {
        goto LABEL_52;
      }
LABEL_51:
      if (a6 != 5) {
        goto LABEL_67;
      }
LABEL_52:
      int v8 = __ldaxr(a4);
      if (v8 != v7) {
        goto LABEL_64;
      }
LABEL_53:
      if (!__stlxr(v6, a4)) {
        goto LABEL_63;
      }
      goto LABEL_65;
    case 5LL:
      unsigned __int8 v9 = 0;
      int v6 = 0;
      if (!a6) {
        goto LABEL_61;
      }
LABEL_59:
      if (a6 == 2 || a6 == 5)
      {
LABEL_61:
        int v8 = __ldaxr(a4);
        if (v8 == v6)
        {
          if (!__stlxr(v9, a4))
          {
LABEL_63:
            uint64_t v10 = 1LL;
LABEL_66:
            *a1 = v8 & 1;
            return v10;
          }
        }

        else
        {
LABEL_64:
          __clrex();
        }

LABEL_65:
        uint64_t v10 = 0LL;
        goto LABEL_66;
      }

      uint64_t result = sub_188F6DCFC();
      __break(1u);
      return result;
    default:
      goto LABEL_64;
  }

LABEL_67:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_67;
  }

ValueMetadata *type metadata accessor for Bool.AtomicRepresentation()
{
  return &type metadata for Bool.AtomicRepresentation;
}

uint64_t sub_188F67BF8@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }

  else
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

unint64_t *sub_188F67C64@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F67FD0(result, a2, a3);
}

unint64_t *sub_188F67C70@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F68130(result, a2, a3, a4);
}

uint64_t sub_188F67C78( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F68258(a1, a2, a3, a4, a5);
}

uint64_t sub_188F67C80( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F683E0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67CA8( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F686BC(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67CD4@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }

  else
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

unint64_t *sub_188F67D40@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F67FD0(result, a2, a3);
}

unint64_t *sub_188F67D48@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F68130(result, a2, a3, a4);
}

uint64_t sub_188F67D50( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F68258(a1, a2, a3, a4, a5);
}

uint64_t sub_188F67D58( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F683E0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67D80( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F686BC(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67DAC@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }

  else
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

unint64_t *sub_188F67E18@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F67FD0(result, a2, a3);
}

unint64_t *sub_188F67E20@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F68130(result, a2, a3, a4);
}

uint64_t sub_188F67E28( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F68258(a1, a2, a3, a4, a5);
}

uint64_t sub_188F67E30( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F683E0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67E58( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F686BC(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67E84@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }

  else
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

unint64_t *sub_188F67EF0@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F67FD0(result, a2, a3);
}

unint64_t *sub_188F67EF8@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F68130(result, a2, a3, a4);
}

uint64_t sub_188F67F00( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F68258(a1, a2, a3, a4, a5);
}

uint64_t sub_188F67F08( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F683E0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67F30( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F686BC(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F67F5C@<X0>(void *a1@<X8>)
{
  if (*v1)
  {
    *a1 = *v1;
  }

  else
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  return result;
}

unint64_t *sub_188F67FC8@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  return sub_188F67FD0(result, a2, a3);
}

unint64_t *sub_188F67FD0@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unint64_t v3 = atomic_load(result);
    if (v3)
    {
LABEL_4:
      *a3 = v3;
      return result;
    }

    goto LABEL_7;
  }

  if (!a2)
  {
    unint64_t v3 = *result;
    if (*result) {
      goto LABEL_4;
    }
LABEL_7:
    sub_188F6DCFC();
    __break(1u);
  }

  uint64_t result = (unint64_t *)sub_188F6DD08();
  __break(1u);
  return result;
}

unint64_t *sub_188F680A0(unint64_t *result, unint64_t *a2, uint64_t a3)
{
  unint64_t v3 = *result;
  if (a3 == 5 || a3 == 3)
  {
    atomic_store(v3, a2);
  }

  else if (a3)
  {
    uint64_t result = (unint64_t *)sub_188F6DD08();
    __break(1u);
  }

  else
  {
    *a2 = v3;
  }

  return result;
}

unint64_t *sub_188F68128@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  return sub_188F68130(result, a2, a3, a4);
}

unint64_t *sub_188F68130@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      if (!v5) {
        goto LABEL_14;
      }
      *a4 = v5;
      break;
    default:
      sub_188F6DD08();
      __break(1u);
LABEL_14:
      uint64_t result = (unint64_t *)sub_188F6DCFC();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F68250( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F68258(a1, a2, a3, a4, a5);
}

uint64_t sub_188F68258( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      sub_188F6DD08();
      __break(1u);
      goto LABEL_21;
  }

  while (1)
  {
    unint64_t v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F683B8( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F683E0(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F683E0( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 2LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 3LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 4LL:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_41;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_64;
      }

      goto LABEL_61;
    case 5LL:
      if (a6)
      {
        if (a6 == 2)
        {
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
        }

        else
        {
          if (a6 != 5)
          {
LABEL_64:
            sub_188F6DD08();
            __break(1u);
            goto LABEL_65;
          }

          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_61;
            }
          }
        }

uint64_t sub_188F68694( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  return sub_188F686BC(a1, a2, a3, a4, a5, a6) & 1;
}

uint64_t sub_188F686BC( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  switch(a5)
  {
    case 0LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 == 2) {
        goto LABEL_13;
      }
      if (a6) {
        goto LABEL_30;
      }
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_14;
    case 2LL:
      if (a6 == 5) {
        goto LABEL_24;
      }
      if (a6 != 2 && a6) {
        goto LABEL_30;
      }
LABEL_13:
      unint64_t v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
LABEL_14:
      if (!__stxr(v7, a4)) {
        goto LABEL_28;
      }
      goto LABEL_26;
    case 3LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
      if (a6) {
        goto LABEL_30;
      }
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_20;
      }
      goto LABEL_25;
    case 4LL:
      if (a6 != 5 && a6 != 2) {
        goto LABEL_23;
      }
      goto LABEL_24;
    case 5LL:
      if (a6 == 5 || a6 == 2) {
        goto LABEL_24;
      }
LABEL_23:
      if (a6) {
        goto LABEL_30;
      }
LABEL_24:
      unint64_t v8 = __ldaxr(a4);
      if (v8 == v6)
      {
LABEL_25:
        if (!__stlxr(v7, a4))
        {
LABEL_28:
          uint64_t v9 = 1LL;
          if (v8) {
            goto LABEL_27;
          }
          goto LABEL_29;
        }
      }

      else
      {
LABEL_20:
        __clrex();
      }

_UNKNOWN **sub_188F68884()
{
  return &protocol witness table for UnsafeRawPointer.AtomicRepresentation;
}

_UNKNOWN **sub_188F68890()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicRepresentation;
}

void sub_188F6889C()
{
}

void sub_188F688AC()
{
}

void sub_188F688BC()
{
}

_UNKNOWN **sub_188F688CC()
{
  return &protocol witness table for UnsafeRawPointer.AtomicOptionalRepresentation;
}

_UNKNOWN **sub_188F688D8()
{
  return &protocol witness table for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

void sub_188F688E4()
{
}

uint64_t sub_188F688F4(uint64_t a1)
{
  uint64_t result = MEMORY[0x1895DB1B8](&protocol conformance descriptor for UnsafePointer<A>);
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_188F68920()
{
}

uint64_t sub_188F68930(uint64_t a1)
{
  uint64_t result = MEMORY[0x1895DB1B8](&protocol conformance descriptor for UnsafeMutablePointer<A>);
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_188F6895C()
{
}

uint64_t sub_188F6896C(uint64_t a1)
{
  uint64_t result = MEMORY[0x1895DB1B8](&protocol conformance descriptor for Unmanaged<A>);
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t *sub_188F68998@<X0>( unint64_t *result@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  if (a2 == 5 || a2 == 2)
  {
    unint64_t v3 = atomic_load(result);
LABEL_6:
    *a3 = v3;
    return result;
  }

  if (!a2)
  {
    unint64_t v3 = *result;
    goto LABEL_6;
  }

  uint64_t result = (unint64_t *)sub_188F6DD08();
  __break(1u);
  return result;
}

unint64_t *sub_188F68A20@<X0>( unint64_t *result@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  unint64_t v4 = *result;
  switch(a3)
  {
    case 0LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 2LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stxr(v4, a2));
      goto LABEL_11;
    case 3LL:
      do
        unint64_t v5 = __ldxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 4LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
      goto LABEL_11;
    case 5LL:
      do
        unint64_t v5 = __ldaxr(a2);
      while (__stlxr(v4, a2));
LABEL_11:
      *a4 = v5;
      break;
    default:
      uint64_t result = (unint64_t *)sub_188F6DD08();
      __break(1u);
      break;
  }

  return result;
}

uint64_t sub_188F68AF8( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  unint64_t v6 = *a3;
  switch(a5)
  {
    case 0LL:
      do
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
      }

      while (__stxr(v6, a4));
      goto LABEL_16;
    case 2LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 3LL:
      while (1)
      {
        unint64_t v7 = __ldxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 4LL:
      while (1)
      {
        unint64_t v7 = __ldaxr(a4);
        if (v7 != v5) {
          goto LABEL_17;
        }
        if (!__stlxr(v6, a4)) {
          goto LABEL_16;
        }
      }

    case 5LL:
      break;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  while (1)
  {
    unint64_t v7 = __ldaxr(a4);
    if (v7 != v5) {
      break;
    }
    if (!__stlxr(v6, a4))
    {
LABEL_16:
      uint64_t v8 = 1LL;
      goto LABEL_18;
    }
  }

uint64_t sub_188F68C10( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0LL:
        goto LABEL_8;
      case 2LL:
        goto LABEL_24;
      case 3LL:
        goto LABEL_32;
      case 4LL:
        goto LABEL_16;
      case 5LL:
        if (a6 == 5) {
          goto LABEL_65;
        }
        if (a6 == 2) {
          goto LABEL_42;
        }
        if (a6) {
          goto LABEL_69;
        }
        goto LABEL_45;
      default:
        goto LABEL_69;
    }
  }

  switch(a5)
  {
    case 0LL:
LABEL_8:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_67;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }

      goto LABEL_67;
    case 2LL:
LABEL_24:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
            if (!__stxr(v7, a4)) {
              goto LABEL_67;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }

      goto LABEL_67;
    case 3LL:
LABEL_32:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_67;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }

      goto LABEL_67;
    case 4LL:
LABEL_16:
      switch(a6)
      {
        case 0LL:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_67;
            }
          }

        case 2LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        case 5LL:
          do
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
          break;
        default:
          goto LABEL_69;
      }

      goto LABEL_67;
    case 5LL:
      switch(a6)
      {
        case 0LL:
          do
          {
LABEL_45:
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
          }

          while (__stlxr(v7, a4));
LABEL_67:
          uint64_t v9 = 1LL;
LABEL_68:
          *a1 = v8;
          return v9;
        case 2LL:
LABEL_42:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              break;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_67;
            }
          }

LABEL_39:
          uint64_t v9 = 0LL;
          __clrex();
          goto LABEL_68;
        case 5LL:
LABEL_65:
          while (1)
          {
            unint64_t v8 = __ldaxr(a4);
            if (v8 != v6) {
              goto LABEL_39;
            }
            if (!__stlxr(v7, a4)) {
              goto LABEL_67;
            }
          }
      }

LABEL_69:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_69;
  }

uint64_t sub_188F68EB8( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *a2;
  unint64_t v7 = *a3;
  if (*a3)
  {
    switch(a5)
    {
      case 0LL:
        if (a6 == 5) {
          goto LABEL_32;
        }
        if (a6 == 2) {
          goto LABEL_27;
        }
        if (a6) {
          goto LABEL_42;
        }
        goto LABEL_35;
      case 2LL:
        if (a6 == 5) {
          goto LABEL_32;
        }
        if (a6 != 2 && a6) {
          goto LABEL_42;
        }
        goto LABEL_27;
      case 3LL:
        if (a6 == 5 || a6 == 2) {
          goto LABEL_32;
        }
        if (a6) {
          goto LABEL_42;
        }
        goto LABEL_38;
      case 4LL:
      case 5LL:
        if (a6 != 5 && a6 != 2 && a6) {
          goto LABEL_42;
        }
        goto LABEL_32;
      default:
        goto LABEL_42;
    }
  }

  switch(a5)
  {
    case 0LL:
      if (a6)
      {
        if (a6 != 2) {
          goto LABEL_31;
        }
        goto LABEL_27;
      }

LABEL_35:
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_39;
      }
      goto LABEL_36;
    case 2LL:
      if (a6 && a6 != 2) {
        goto LABEL_31;
      }
LABEL_27:
      unint64_t v8 = __ldaxr(a4);
      if (v8 != v6) {
        goto LABEL_39;
      }
LABEL_36:
      if (!__stxr(v7, a4)) {
        goto LABEL_37;
      }
      goto LABEL_40;
    case 3LL:
      if (a6) {
        goto LABEL_30;
      }
LABEL_38:
      unint64_t v8 = __ldxr(a4);
      if (v8 != v6) {
        goto LABEL_39;
      }
      goto LABEL_33;
    case 4LL:
    case 5LL:
      if (!a6) {
        goto LABEL_32;
      }
LABEL_30:
      if (a6 == 2) {
        goto LABEL_32;
      }
LABEL_31:
      if (a6 == 5)
      {
LABEL_32:
        unint64_t v8 = __ldaxr(a4);
        if (v8 == v6)
        {
LABEL_33:
          if (!__stlxr(v7, a4))
          {
LABEL_37:
            uint64_t v9 = 1LL;
LABEL_41:
            *a1 = v8;
            return v9;
          }
        }

        else
        {
LABEL_39:
          __clrex();
        }

LABEL_40:
        uint64_t v9 = 0LL;
        goto LABEL_41;
      }

LABEL_42:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
    default:
      goto LABEL_42;
  }

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafePointer.AtomicRepresentation);
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafeMutablePointer.AtomicRepresentation);
}

uint64_t type metadata accessor for Unmanaged.AtomicRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Unmanaged.AtomicRepresentation);
}

ValueMetadata *type metadata accessor for UnsafeRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeRawPointer.AtomicOptionalRepresentation;
}

ValueMetadata *type metadata accessor for UnsafeMutableRawPointer.AtomicOptionalRepresentation()
{
  return &type metadata for UnsafeMutableRawPointer.AtomicOptionalRepresentation;
}

uint64_t type metadata accessor for UnsafePointer.AtomicOptionalRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafePointer.AtomicOptionalRepresentation);
}

uint64_t type metadata accessor for UnsafeMutablePointer.AtomicOptionalRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafeMutablePointer.AtomicOptionalRepresentation);
}

uint64_t type metadata accessor for Unmanaged.AtomicOptionalRepresentation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for Unmanaged.AtomicOptionalRepresentation);
}

uint64_t sub_188F690FC(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  unsigned __int8 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0LL:
      int v7 = __ldxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
      goto LABEL_7;
    case 2LL:
      int v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
LABEL_7:
      if (!__stxr(v5, a4)) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 3LL:
      int v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 4LL:
    case 5LL:
      int v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          uint64_t v8 = 1LL;
          goto LABEL_14;
        }
      }

      else
      {
LABEL_12:
        __clrex();
      }

LABEL_13:
      uint64_t v8 = 0LL;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

      uint64_t v8 = 0LL;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

      uint64_t v8 = 0LL;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

      uint64_t v8 = 0LL;
LABEL_14:
      *a1 = v7;
      return v8;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

uint64_t sub_188F691EC( _WORD *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4, uint64_t a5)
{
  unsigned __int16 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0LL:
      int v7 = __ldxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
      goto LABEL_7;
    case 2LL:
      int v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
LABEL_7:
      if (!__stxr(v5, a4)) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 3LL:
      int v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 4LL:
    case 5LL:
      int v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          uint64_t v8 = 1LL;
          goto LABEL_14;
        }
      }

      else
      {
LABEL_12:
        __clrex();
      }

uint64_t sub_188F692DC(unsigned int *a1, int *a2, unsigned int *a3, unsigned int *a4, uint64_t a5)
{
  unsigned int v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0LL:
      unsigned int v7 = __ldxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
      goto LABEL_7;
    case 2LL:
      unsigned int v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
LABEL_7:
      if (!__stxr(v5, a4)) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 3LL:
      unsigned int v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 4LL:
    case 5LL:
      unsigned int v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          uint64_t v8 = 1LL;
          goto LABEL_14;
        }
      }

      else
      {
LABEL_12:
        __clrex();
      }

uint64_t sub_188F693CC( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  switch(a5)
  {
    case 0LL:
      unint64_t v7 = __ldxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
      goto LABEL_7;
    case 2LL:
      unint64_t v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_12;
      }
LABEL_7:
      if (!__stxr(v5, a4)) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 3LL:
      unint64_t v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_10;
      }
      goto LABEL_12;
    case 4LL:
    case 5LL:
      unint64_t v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stlxr(v5, a4))
        {
LABEL_11:
          uint64_t v8 = 1LL;
          goto LABEL_14;
        }
      }

      else
      {
LABEL_12:
        __clrex();
      }

uint64_t sub_188F694BC(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  unint64_t v6 = a3[1];
  uint64_t v8 = *a2;
  uint64_t v7 = a2[1];
  switch(a5)
  {
    case 0LL:
      do
      {
        while (1)
        {
          unsigned __int128 v13 = __ldxp(a4);
          uint64_t v9 = *((void *)&v13 + 1);
          uint64_t v10 = v13;
          int v14 = (void)v13 != v8;
          if (*((void *)&v13 + 1) != v7) {
            ++v14;
          }
          if (!v14) {
            break;
          }
          if (!__stxp(v13, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 2LL:
      do
      {
        while (1)
        {
          unsigned __int128 v15 = __ldaxp(a4);
          uint64_t v9 = *((void *)&v15 + 1);
          uint64_t v10 = v15;
          int v16 = (void)v15 != v8;
          if (*((void *)&v15 + 1) != v7) {
            ++v16;
          }
          if (!v16) {
            break;
          }
          if (!__stxp(v15, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 3LL:
      do
      {
        while (1)
        {
          unsigned __int128 v17 = __ldxp(a4);
          uint64_t v9 = *((void *)&v17 + 1);
          uint64_t v10 = v17;
          int v18 = (void)v17 != v8;
          if (*((void *)&v17 + 1) != v7) {
            ++v18;
          }
          if (!v18) {
            break;
          }
          if (!__stlxp(v17, a4)) {
            goto LABEL_29;
          }
        }
      }

      while (__stlxp(__PAIR128__(v6, v5), a4));
      goto LABEL_29;
    case 4LL:
    case 5LL:
      goto LABEL_2;
    default:
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

  do
  {
    while (1)
    {
LABEL_2:
      unsigned __int128 v11 = __ldaxp(a4);
      uint64_t v9 = *((void *)&v11 + 1);
      uint64_t v10 = v11;
      int v12 = (void)v11 != v8;
      if (*((void *)&v11 + 1) != v7) {
        ++v12;
      }
      if (!v12) {
        break;
      }
      if (!__stlxp(v11, a4)) {
        goto LABEL_29;
      }
    }
  }

  while (__stlxp(__PAIR128__(v6, v5), a4));
LABEL_29:
  BOOL v20 = v10 == v8 && v9 == v7;
  *a1 = v10;
  a1[1] = v9;
  return v20;
}

uint64_t sub_188F69618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v69 = a4;
  uint64_t v72 = a1;
  uint64_t v10 = *(void *)(a6 + 16);
  uint64_t v80 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v12 = sub_188F6DCE4();
  uint64_t v68 = *(void *)(v12 - 8);
  uint64_t v13 = MEMORY[0x1895F8858](v12);
  v75 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  v77 = (char *)&v61 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v71 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v16 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v64 = (char *)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v16);
  uint64_t v67 = (char *)&v61 - v18;
  uint64_t v19 = sub_188F6DCE4();
  uint64_t v20 = MEMORY[0x1895F8858](v19);
  unsigned __int128 v22 = (char *)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v23 = MEMORY[0x1895F8858](v20);
  unsigned __int128 v25 = (char *)&v61 - v24;
  MEMORY[0x1895F8858](v23);
  uint64_t v78 = v27;
  uint64_t v79 = v26;
  unint64_t v28 = *(void (**)(void))(v27 + 16);
  v76 = (char *)&v61 - v29;
  v28();
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    uint64_t v65 = a6;
    uint64_t v73 = v12;
    uint64_t v74 = a3;
    unint64_t v70 = a5;
    uint64_t v30 = qword_188F6E8D0[a5];
    uint64_t v31 = a2;
    uint64_t v32 = v79;
    ((void (*)(char *, uint64_t, uint64_t))v28)(v25, v31, v79);
    uint64_t v33 = *(void *)(v10 - 8);
    uint64_t v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
    int v35 = v34(v25, 1LL, v10);
    uint64_t v62 = v33;
    uint64_t v63 = v30;
    if (v35 == 1)
    {
      uint64_t v36 = v78;
      (*(void (**)(char *, uint64_t))(v78 + 8))(v25, v32);
      uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
      v37(v77, 1LL, 1LL, AssociatedTypeWitness);
    }

    else
    {
      uint64_t v38 = v77;
      sub_188F6DCA8();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v10);
      uint64_t v37 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 56LL);
      v37(v38, 0LL, 1LL, AssociatedTypeWitness);
      uint64_t v36 = v78;
    }

    uint64_t v39 = AssociatedTypeWitness;
    ((void (*)(char *, char *, uint64_t))v28)(v22, v76, v32);
    uint64_t v40 = 1LL;
    if (v34(v22, 1LL, v10) != 1)
    {
      sub_188F6DCA8();
      uint64_t v40 = 0LL;
      uint64_t v36 = v62;
      uint64_t v32 = v10;
    }

    (*(void (**)(char *, uint64_t))(v36 + 8))(v22, v32);
    uint64_t v41 = v75;
    v37(v75, v40, 1LL, v39);
    uint64_t v43 = TupleTypeMetadata2;
    uint64_t v42 = v67;
    uint64_t v44 = &v67[*(int *)(TupleTypeMetadata2 + 48)];
    uint64_t v45 = *(void *)(v65 + 32);
    uint64_t v46 = swift_getAssociatedTypeWitness();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    uint64_t v48 = v77;
    LOBYTE(v46) = (*(uint64_t (**)(char *, char *, char *, uint64_t, unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))( v44,  v77,  v41,  v69,  v70,  v63,  v46,  AssociatedConformanceWitness);
    uint64_t v49 = v68;
    v75 = *(char **)(v68 + 8);
    uint64_t v50 = v73;
    ((void (*)(char *, uint64_t))v75)(v48, v73);
    uint64_t v51 = v46 & 1;
    *uint64_t v42 = v46 & 1;
    uint64_t v52 = &v64[*(int *)(v43 + 48)];
    *uint64_t v64 = v46 & 1;
    uint64_t v53 = (*(uint64_t (**)(_BYTE *, char *, uint64_t))(v49 + 16))(v52, v44, v50);
    MEMORY[0x1895F8858](v53);
    uint64_t v54 = v80;
    *(&v61 - 4) = v10;
    *(&v61 - 3) = v54;
    uint64_t v59 = v45;
    uint64_t v60 = v10;
    sub_188F63A2C( (void (*)(char *, char *))sub_188F6AB48,  (uint64_t)(&v61 - 6),  MEMORY[0x18961A520],  v10,  v55,  v72);
    uint64_t v56 = v79;
    uint64_t v57 = *(void (**)(uint64_t, uint64_t))(v78 + 8);
    v57(v74, v79);
    (*(void (**)(_BYTE *, uint64_t))(v71 + 8))(v42, v43);
    v57((uint64_t)v76, v56);
    ((void (*)(_BYTE *, uint64_t))v75)(v52, v50);
    return v51;
  }

  else
  {
    uint64_t result = sub_188F6DD08();
    __break(1u);
  }

  return result;
}

uint64_t sub_188F69B1C(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  if ((unint64_t)(a5 - 2) >= 4 && a5 != 0)
  {
    sub_188F6DD08();
    __break(1u);
LABEL_9:
    sub_188F6DCFC();
    __break(1u);
    goto LABEL_10;
  }

  unint64_t v8 = *a3;
  uint64_t v9 = *a2;
  swift_unknownObjectRetain_n();
  char v10 = sub_188F670B4(v9, v8, a4);
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  if (!v12) {
    goto LABEL_9;
  }
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast())
  {
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }

LABEL_10:
  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F69CD8(void *a1, uint64_t *a2, unint64_t *a3, unsigned __int128 *a4, uint64_t a5)
{
  if ((unint64_t)(a5 - 2) < 4 || a5 == 0)
  {
    unint64_t v8 = *a3;
    uint64_t v9 = *a2;
    swift_unknownObjectRetain_n();
    char v10 = sub_188F670B4(v9, v8, a4);
    uint64_t v12 = v11;
    swift_unknownObjectRelease();
    if (v12)
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_10;
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    *a1 = v12;
    return v10 & 1;
  }

  sub_188F6DD08();
  __break(1u);
LABEL_10:
  uint64_t result = sub_188F6DD14();
  __break(1u);
  return result;
}

uint64_t sub_188F69E58(_BYTE *a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5)
{
  unsigned __int8 v5 = *a3;
  int v6 = *a2;
  switch(a5)
  {
    case 0LL:
      int v7 = __ldxr(a4);
      if (v7 != v6) {
        goto LABEL_13;
      }
      if (__stxr(v5, a4)) {
        goto LABEL_14;
      }
      goto LABEL_12;
    case 2LL:
      int v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_13;
      }
      if (!__stxr(v5, a4)) {
        goto LABEL_12;
      }
      goto LABEL_14;
    case 3LL:
      int v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 4LL:
    case 5LL:
      int v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_11:
        if (!__stlxr(v5, a4))
        {
LABEL_12:
          uint64_t v8 = 1LL;
          goto LABEL_15;
        }
      }

      else
      {
LABEL_13:
        __clrex();
      }

LABEL_14:
      uint64_t v8 = 0LL;
LABEL_15:
      *a1 = v7 & 1;
      return v8;
    default:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

uint64_t sub_188F69F60( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F69F70(a1, a2, a3, a4, a5);
}

uint64_t sub_188F69F68( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F69F70(a1, a2, a3, a4, a5);
}

uint64_t sub_188F69F70( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  switch(a5)
  {
    case 0LL:
      unint64_t v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_10;
      }
      goto LABEL_14;
    case 2LL:
    case 4LL:
      if (a5 == 4 || a5 == 3) {
        goto LABEL_4;
      }
      if (a5 != 2) {
        goto LABEL_18;
      }
      unint64_t v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_10:
        if (!__stxr(v5, a4))
        {
LABEL_11:
          uint64_t v8 = 1LL;
          goto LABEL_16;
        }
      }

      else
      {
LABEL_14:
        __clrex();
      }

LABEL_15:
      uint64_t v8 = 0LL;
LABEL_16:
      if (!v7)
      {
        while (1)
        {
          sub_188F6DCFC();
          __break(1u);
LABEL_18:
          sub_188F6DC90();
          sub_188F6DD08();
          __break(1u);
        }
      }

      *a1 = v7;
      return v8;
    case 3LL:
      unint64_t v7 = __ldxr(a4);
      if (v7 == v6) {
        goto LABEL_7;
      }
      goto LABEL_14;
    case 5LL:
LABEL_4:
      unint64_t v7 = __ldaxr(a4);
      if (v7 != v6) {
        goto LABEL_14;
      }
LABEL_7:
      if (!__stlxr(v5, a4)) {
        goto LABEL_11;
      }
      goto LABEL_15;
    default:
      goto LABEL_18;
  }

uint64_t sub_188F6A108( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F6A120(a1, a2, a3, a4, a5);
}

uint64_t sub_188F6A110( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F6A120(a1, a2, a3, a4, a5);
}

uint64_t sub_188F6A118( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  return sub_188F6A120(a1, a2, a3, a4, a5);
}

uint64_t sub_188F6A120( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  switch(a5)
  {
    case 0LL:
      uint64_t v9 = *a2;
      unint64_t v7 = __ldxr(a4);
      if (v7 == v9) {
        goto LABEL_14;
      }
      goto LABEL_16;
    case 2LL:
    case 4LL:
      uint64_t v6 = *a2;
      if (a5 == 4 || a5 == 3) {
        goto LABEL_8;
      }
      if (a5 != 2) {
        goto LABEL_20;
      }
      unint64_t v7 = __ldaxr(a4);
      if (v7 == v6)
      {
LABEL_14:
        if (!__stxr(v5, a4))
        {
LABEL_15:
          uint64_t v10 = 1LL;
          goto LABEL_18;
        }
      }

      else
      {
LABEL_16:
        __clrex();
      }

uint64_t sub_188F6A2CC( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = *a2;
  uint64_t v7 = 2LL;
  switch(a5)
  {
    case 0LL:
      unint64_t v8 = __ldxr(a4);
      if (v8 == v6)
      {
LABEL_17:
        if (!__stxr(v5, a4))
        {
LABEL_22:
          uint64_t v9 = 1LL;
          goto LABEL_26;
        }
      }

      else
      {
LABEL_24:
        __clrex();
      }

LABEL_25:
      uint64_t v9 = 0LL;
LABEL_26:
      *a1 = v8;
      return v9;
    case 2LL:
    case 4LL:
      goto LABEL_6;
    case 3LL:
      uint64_t v7 = 0LL;
      goto LABEL_6;
    case 5LL:
      uint64_t v7 = 5LL;
LABEL_6:
      if (v5)
      {
        switch(a5)
        {
          case 2LL:
            if (v7 != 5) {
              goto LABEL_16;
            }
            goto LABEL_20;
          case 3LL:
            if (v7 != 5 && v7 != 2) {
              goto LABEL_23;
            }
            goto LABEL_20;
          case 4LL:
          case 5LL:
            goto LABEL_20;
          default:
            goto LABEL_27;
        }
      }

      switch(a5)
      {
        case 2LL:
          if (v7 && v7 != 2) {
            goto LABEL_20;
          }
LABEL_16:
          unint64_t v8 = __ldaxr(a4);
          if (v8 == v6) {
            goto LABEL_17;
          }
          goto LABEL_24;
        case 3LL:
          if (v7) {
            goto LABEL_20;
          }
LABEL_23:
          unint64_t v8 = __ldxr(a4);
          if (v8 != v6) {
            goto LABEL_24;
          }
          goto LABEL_21;
        case 4LL:
        case 5LL:
LABEL_20:
          unint64_t v8 = __ldaxr(a4);
          if (v8 != v6) {
            goto LABEL_24;
          }
LABEL_21:
          if (!__stlxr(v5, a4)) {
            goto LABEL_22;
          }
          goto LABEL_25;
        default:
          goto LABEL_27;
      }

    default:
LABEL_27:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

      uint64_t v10 = 0LL;
LABEL_26:
      *a1 = v8;
      return v10;
    case 2LL:
    case 4LL:
      goto LABEL_6;
    case 3LL:
      uint64_t v6 = 0LL;
      goto LABEL_6;
    case 5LL:
      uint64_t v6 = 5LL;
LABEL_6:
      uint64_t v9 = *a2;
      if (v5)
      {
        switch(a5)
        {
          case 2LL:
            if (v6 != 5) {
              goto LABEL_16;
            }
            goto LABEL_20;
          case 3LL:
            if (v6 != 5 && v6 != 2) {
              goto LABEL_23;
            }
            goto LABEL_20;
          case 4LL:
          case 5LL:
            goto LABEL_20;
          default:
            goto LABEL_27;
        }
      }

      switch(a5)
      {
        case 2LL:
          if (v6 && v6 != 2) {
            goto LABEL_20;
          }
LABEL_16:
          unint64_t v8 = __ldaxr(a4);
          if (v8 == v9) {
            goto LABEL_17;
          }
          goto LABEL_24;
        case 3LL:
          if (v6) {
            goto LABEL_20;
          }
LABEL_23:
          unint64_t v8 = __ldxr(a4);
          if (v8 != v9) {
            goto LABEL_24;
          }
          goto LABEL_21;
        case 4LL:
        case 5LL:
LABEL_20:
          unint64_t v8 = __ldaxr(a4);
          if (v8 != v9) {
            goto LABEL_24;
          }
LABEL_21:
          if (!__stlxr(v5, a4)) {
            goto LABEL_22;
          }
          goto LABEL_25;
        default:
          goto LABEL_27;
      }

    default:
LABEL_27:
      sub_188F6DC90();
      uint64_t result = sub_188F6DD08();
      __break(1u);
      return result;
  }

uint64_t sub_188F6A4CC( unint64_t *a1, uint64_t *a2, unint64_t *a3, unint64_t *a4, uint64_t a5)
{
  unint64_t v5 = *a3;
  uint64_t v6 = 2LL;
  switch(a5)
  {
    case 0LL:
      uint64_t v7 = *a2;
      unint64_t v8 = __ldxr(a4);
      if (v8 == v7)
      {
LABEL_17:
        if (!__stxr(v5, a4))
        {
LABEL_22:
          uint64_t v10 = 1LL;
          goto LABEL_26;
        }
      }

      else
      {
LABEL_24:
        __clrex();
      }

uint64_t sub_188F6A6CC( uint64_t a1, char *a2, uint64_t a3, void (*a4)(char *, uint64_t), unint64_t a5, uint64_t a6)
{
  uint64_t v60 = a4;
  uint64_t v57 = a2;
  uint64_t v64 = a1;
  uint64_t v9 = *(void *)(a6 + 16);
  uint64_t v10 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v10);
  uint64_t v62 = (char *)&v50 - v11;
  uint64_t v55 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v59 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v53 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v50 - v15;
  uint64_t v18 = v17;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v61 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v20 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v56 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  uint64_t v54 = (char *)&v50 - v23;
  uint64_t v24 = MEMORY[0x1895F8858](v22);
  uint64_t v26 = (char *)&v50 - v25;
  MEMORY[0x1895F8858](v24);
  unint64_t v28 = (char *)&v50 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v58 = v29;
  uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  uint64_t v63 = a3;
  v30(v28, a3, v9);
  if (a5 <= 5 && ((0x3Du >> a5) & 1) != 0)
  {
    uint64_t v51 = qword_188F6E8D0[a5];
    uint64_t v52 = TupleTypeMetadata2;
    uint64_t v31 = *(int *)(TupleTypeMetadata2 + 48);
    uint64_t v65 = v26;
    uint64_t v32 = &v26[v31];
    unint64_t v50 = a5;
    uint64_t v33 = swift_getAssociatedTypeWitness();
    sub_188F6DCA8();
    uint64_t v34 = v53;
    sub_188F6DCA8();
    uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    char v36 = (*(uint64_t (**)(char *, char *, char *, void (*)(char *, uint64_t), unint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))( v32,  v16,  v34,  v60,  v50,  v51,  v33,  AssociatedConformanceWitness);
    uint64_t v57 = v28;
    uint64_t v37 = v52;
    uint64_t v38 = v59;
    uint64_t v39 = v16;
    uint64_t v40 = v18;
    uint64_t v60 = *(void (**)(char *, uint64_t))(v59 + 8);
    v60(v39, v18);
    uint64_t v41 = v36 & 1;
    _BYTE *v65 = v36 & 1;
    uint64_t v42 = *(int *)(v37 + 48);
    uint64_t v43 = v54;
    uint64_t v44 = &v54[v42];
    _BYTE *v54 = v36 & 1;
    uint64_t v45 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
    v45(&v43[v42], v32, v40);
    v45(&v56[*(int *)(v37 + 48)], v32, v40);
    uint64_t v46 = v62;
    sub_188F6DCB4();
    uint64_t v47 = v58;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v58 + 48))(v46, 1LL, v9) != 1)
    {
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
      v48(v63, v9);
      (*(void (**)(_BYTE *, uint64_t))(v61 + 8))(v65, v37);
      v48((uint64_t)v57, v9);
      (*(void (**)(uint64_t, char *, uint64_t))(v47 + 32))(v64, v46, v9);
      v60(v44, v40);
      return v41;
    }
  }

  else
  {
    sub_188F6DD08();
    __break(1u);
  }

  uint64_t result = sub_188F6DCFC();
  __break(1u);
  return result;
}

uint64_t sub_188F6AB48(uint64_t a1)
{
  return sub_188F63BC4(a1);
}

uint64_t UnsafeAtomicLazyReference.Storage._storage.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*UnsafeAtomicLazyReference.Storage._storage.modify())()
{
  return nullsub_1;
}

uint64_t UnsafeAtomicLazyReference.Storage.init()()
{
  return 0LL;
}

uint64_t UnsafeAtomicLazyReference.Storage.dispose()()
{
  uint64_t result = *v0;
  uint64_t *v0 = 0LL;
  return result;
}

uint64_t static UnsafeAtomicLazyReference.create()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = type metadata accessor for UnsafeAtomicLazyReference.Storage(0LL, a1, a3, a4);
  uint64_t v5 = sub_188F6DCD8();
  uint64_t v7 = 0LL;
  (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)(v4 - 8) + 32LL))(v5, &v7, v4);
  return v5;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference.Storage( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafeAtomicLazyReference.Storage);
}

uint64_t sub_188F6AC08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32LL))(a2, a1);
}

uint64_t UnsafeAtomicLazyReference.destroy()(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *a1;
  *a1 = 0LL;
  type metadata accessor for UnsafeAtomicLazyReference.Storage(0LL, a2, a3, a4);
  sub_188F6DCC0();
  return v4;
}

uint64_t ManagedAtomicLazyReference._storage.getter()
{
  return 0LL;
}

uint64_t ManagedAtomicLazyReference.__allocating_init()()
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = 0LL;
  return result;
}

uint64_t ManagedAtomicLazyReference.init()()
{
  uint64_t result = v0;
  *(void *)(v0 + 16) = 0LL;
  return result;
}

uint64_t ManagedAtomicLazyReference.deinit()
{
  if (*(void *)(v0 + 16)) {
    swift_unknownObjectRelease();
  }
  return v0;
}

uint64_t ManagedAtomicLazyReference.__deallocating_deinit()
{
  if (*(void *)(v0 + 16)) {
    swift_unknownObjectRelease();
  }
  return swift_deallocClassInstance();
}

uint64_t sub_188F6ACDC()
{
  return v0 + 16;
}

unint64_t UnsafeAtomicLazyReference.storeIfNilThenLoad(_:)(unint64_t a1, unint64_t *a2)
{
  while (1)
  {
    unint64_t v4 = __ldaxr(a2);
    if (v4) {
      break;
    }
    if (!__stlxr(a1, a2)) {
      return a1;
    }
  }

  __clrex();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease_n();
  return v4;
}

uint64_t UnsafeAtomicLazyReference.load()(unint64_t *a1)
{
  uint64_t result = atomic_load(a1);
  if (result) {
    return swift_unknownObjectRetain();
  }
  return result;
}

unint64_t ManagedAtomicLazyReference.storeIfNilThenLoad(_:)(unint64_t a1)
{
  unint64_t v3 = (unint64_t *)(v1 + 16);
  swift_unknownObjectRetain();
  while (1)
  {
    unint64_t v4 = __ldaxr(v3);
    if (v4) {
      break;
    }
    if (!__stlxr(a1, v3)) {
      return a1;
    }
  }

  __clrex();
  swift_unknownObjectRetain();
  swift_unknownObjectRelease_n();
  return v4;
}

uint64_t ManagedAtomicLazyReference.load()()
{
  uint64_t result = atomic_load((unint64_t *)(v0 + 16));
  if (result) {
    return swift_unknownObjectRetain();
  }
  return result;
}

void *__swift_memcpy8_8(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_188F6AE10(uint64_t a1, int a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a2 != 1 && *(_BYTE *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 2);
  }
  if (*(void *)a1) {
    int v3 = -1;
  }
  else {
    int v3 = 0;
  }
  return (v3 + 1);
}

uint64_t sub_188F6AE54(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(void *)uint64_t result = a2 - 2;
    if (a3 >= 2) {
      *(_BYTE *)(result + 8) = 1;
    }
  }

  else
  {
    if (a3 >= 2) {
      *(_BYTE *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for UnsafeAtomicLazyReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for UnsafeAtomicLazyReference);
}

uint64_t sub_188F6AEA0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ManagedAtomicLazyReference( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for ManagedAtomicLazyReference);
}

uint64_t static UnsafeAtomic.create(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = sub_188F6DCD8();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))( v6,  AssociatedTypeWitness,  AssociatedConformanceWitness);
  sub_188F6AC08((uint64_t)v9, v10, AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v10;
}

uint64_t UnsafeAtomic.destroy()(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v7 - v4, a1, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))( AssociatedTypeWitness,  AssociatedConformanceWitness);
  sub_188F6DCCC();
  return sub_188F6DCC0();
}

uint64_t ManagedAtomic._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96LL);
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  v3,  AssociatedTypeWitness);
}

uint64_t ManagedAtomic._storage.setter(uint64_t a1)
{
  uint64_t v3 = v1 + *(void *)(*(void *)v1 + 96LL);
  swift_beginAccess();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( v3,  a1,  AssociatedTypeWitness);
  return swift_endAccess();
}

uint64_t (*ManagedAtomic._storage.modify())()
{
  return j__swift_endAccess;
}

uint64_t sub_188F6B284(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 80);
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1895F8858](a1);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v10 = (char *)&v14 - v9;
  uint64_t v11 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))( v6,  AssociatedTypeWitness,  AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))( v11 + *(void *)(*(void *)v11 + 96LL),  v10,  AssociatedTypeWitness);
  return v11;
}

uint64_t ManagedAtomic.deinit()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 80LL);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v4 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v6 = (char *)&v12 - v5;
  uint64_t v7 = *(void *)(v1 - 8);
  MEMORY[0x1895F8858](v4);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v0 + 16, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))( AssociatedTypeWitness,  AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0 + *(void *)(*(void *)v0 + 96LL), AssociatedTypeWitness);
  return v0;
}

uint64_t ManagedAtomic.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_188F6B534()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for UnsafeAtomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeAtomic);
}

uint64_t sub_188F6B548()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0LL;
    }
  }

  return result;
}

uint64_t type metadata accessor for ManagedAtomic(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ManagedAtomic);
}

AtomicsInternal::DoubleWord __swiftcall DoubleWord.init(high:low:)(Swift::UInt high, Swift::UInt low)
{
  Swift::UInt v4 = high;
  result.second = v4;
  result.first = low;
  return result;
}

uint64_t DoubleWord.high.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.high.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

void *(*DoubleWord.high.modify(void *a1))(void *result)
{
  *a1 = *(void *)(v1 + 8);
  a1[1] = v1;
  return sub_188F6B60C;
}

void *sub_188F6B60C(void *result)
{
  *(void *)(result[1] + 8LL) = *result;
  return result;
}

uint64_t DoubleWord.low.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*DoubleWord.low.modify(void *a1))(uint64_t result)
{
  *a1 = *v1;
  a1[1] = v1;
  return sub_188F6B63C;
}

uint64_t sub_188F6B63C(uint64_t result)
{
  **(void **)(result + 8) = *(void *)result;
  return result;
}

BOOL static DoubleWord.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

BOOL sub_188F6B658(void *a1, void *a2)
{
  return *a1 == *a2 && a1[1] == a2[1];
}

uint64_t DoubleWord.hash(into:)()
{
  return sub_188F6DD38();
}

uint64_t DoubleWord.hashValue.getter()
{
  return sub_188F6DD44();
}

uint64_t sub_188F6B6FC()
{
  return sub_188F6DD44();
}

uint64_t sub_188F6B754()
{
  return sub_188F6DD38();
}

uint64_t sub_188F6B78C()
{
  return sub_188F6DD44();
}

unint64_t DoubleWord.description.getter()
{
  return 0xD000000000000012LL;
}

unint64_t sub_188F6B8E8()
{
  unint64_t result = qword_18C75B990;
  if (!qword_18C75B990)
  {
    unint64_t result = MEMORY[0x1895DB1B8](&protocol conformance descriptor for DoubleWord, &type metadata for DoubleWord);
    atomic_store(result, (unint64_t *)&qword_18C75B990);
  }

  return result;
}

unint64_t sub_188F6B92C()
{
  return DoubleWord.description.getter();
}

Swift::Void __swiftcall atomicMemoryFence(ordering:)(AtomicsInternal::AtomicUpdateOrdering ordering)
{
  switch(ordering._rawValue)
  {
    case 0LL:
      return;
    case 2LL:
      __dmb(9u);
      break;
    case 3LL:
    case 4LL:
    case 5LL:
      __dmb(0xBu);
      break;
    default:
      sub_188F6DD08();
      __break(1u);
      break;
  }

uint64_t AtomicLoadOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicLoadOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicLoadOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL sub_188F6B9F0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t AtomicLoadOrdering.hash(into:)()
{
  return sub_188F6DD38();
}

uint64_t sub_188F6BA30()
{
  return sub_188F6DD38();
}

uint64_t AtomicLoadOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 5LL:
      return sub_188F6DC90();
    case 2LL:
      return 0x6E69726975716361LL;
    case 0LL:
      return 0x646578616C6572LL;
  }

  sub_188F6DCF0();
  uint64_t v2 = sub_188F6DC90();
  swift_bridgeObjectRelease();
  sub_188F6DD20();
  sub_188F6DC9C();
  swift_bridgeObjectRelease();
  sub_188F6DC90();
  sub_188F6DC9C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_188F6BB84()
{
  return AtomicLoadOrdering.description.getter(*v0);
}

uint64_t AtomicStoreOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicStoreOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicStoreOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t AtomicStoreOrdering.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 5LL:
      return sub_188F6DC90();
    case 3LL:
      return 0x6E697361656C6572LL;
    case 0LL:
      return 0x646578616C6572LL;
  }

  sub_188F6DCF0();
  uint64_t v2 = sub_188F6DC90();
  swift_bridgeObjectRelease();
  sub_188F6DD20();
  sub_188F6DC9C();
  swift_bridgeObjectRelease();
  sub_188F6DC90();
  sub_188F6DC9C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_188F6BCE4()
{
  return AtomicStoreOrdering.description.getter(*v0);
}

uint64_t AtomicUpdateOrdering._rawValue.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*AtomicUpdateOrdering._rawValue.modify())()
{
  return nullsub_1;
}

BOOL static AtomicUpdateOrdering.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t _s15AtomicsInternal18AtomicLoadOrderingV9hashValueSivg_0()
{
  return sub_188F6DD44();
}

uint64_t sub_188F6BD60()
{
  return sub_188F6DD44();
}

uint64_t sub_188F6BDA4()
{
  return sub_188F6DD44();
}

uint64_t AtomicUpdateOrdering.description.getter(uint64_t a1)
{
  uint64_t result = 0x6E69726975716361LL;
  switch(a1)
  {
    case 0LL:
      uint64_t result = 0x646578616C6572LL;
      break;
    case 2LL:
      return result;
    case 3LL:
    case 4LL:
    case 5LL:
      uint64_t result = sub_188F6DC90();
      break;
    default:
      sub_188F6DCF0();
      uint64_t v3 = sub_188F6DC90();
      swift_bridgeObjectRelease();
      sub_188F6DD20();
      sub_188F6DC9C();
      swift_bridgeObjectRelease();
      sub_188F6DC90();
      sub_188F6DC9C();
      swift_bridgeObjectRelease();
      uint64_t result = v3;
      break;
  }

  return result;
}

unint64_t sub_188F6BF38()
{
  unint64_t result = qword_18C75B998;
  if (!qword_18C75B998)
  {
    unint64_t result = MEMORY[0x1895DB1B8]( &protocol conformance descriptor for AtomicLoadOrdering,  &type metadata for AtomicLoadOrdering);
    atomic_store(result, (unint64_t *)&qword_18C75B998);
  }

  return result;
}

unint64_t sub_188F6BF80()
{
  unint64_t result = qword_18C75B9A0;
  if (!qword_18C75B9A0)
  {
    unint64_t result = MEMORY[0x1895DB1B8]( &protocol conformance descriptor for AtomicStoreOrdering,  &type metadata for AtomicStoreOrdering);
    atomic_store(result, (unint64_t *)&qword_18C75B9A0);
  }

  return result;
}

unint64_t sub_188F6BFC8()
{
  unint64_t result = qword_18C75B9A8[0];
  if (!qword_18C75B9A8[0])
  {
    unint64_t result = MEMORY[0x1895DB1B8]( &protocol conformance descriptor for AtomicUpdateOrdering,  &type metadata for AtomicUpdateOrdering);
    atomic_store(result, qword_18C75B9A8);
  }

  return result;
}

uint64_t sub_188F6C00C()
{
  return AtomicUpdateOrdering.description.getter(*v0);
}

ValueMetadata *type metadata accessor for AtomicLoadOrdering()
{
  return &type metadata for AtomicLoadOrdering;
}

ValueMetadata *type metadata accessor for AtomicStoreOrdering()
{
  return &type metadata for AtomicStoreOrdering;
}

ValueMetadata *type metadata accessor for AtomicUpdateOrdering()
{
  return &type metadata for AtomicUpdateOrdering;
}

uint64_t AtomicRawRepresentableStorage._storage.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  v1,  AssociatedTypeWitness);
}

uint64_t AtomicRawRepresentableStorage._storage.setter(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( v1,  a1,  AssociatedTypeWitness);
}

uint64_t (*AtomicRawRepresentableStorage._storage.modify())()
{
  return nullsub_1;
}

uint64_t sub_188F6C158@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v15 = a3;
  uint64_t v4 = *(void *)(a2 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v7 = (char *)&v14 - v6;
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1895F8858](v8);
  uint64_t v11 = (char *)&v14 - v10;
  sub_188F6DCA8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))( v7,  v8,  AssociatedConformanceWitness);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8LL))(a1, v4);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v15, v11, v8);
}

uint64_t sub_188F6C2BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  uint64_t v3 = *(void *)(a1 + 16);
  swift_getAssociatedTypeWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v7 = (char *)&v17 - v6;
  uint64_t v8 = swift_checkMetadataState();
  MEMORY[0x1895F8858](v8);
  uint64_t v9 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v9);
  uint64_t v11 = (char *)&v17 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v13 = v17;
  v12(v7, v17, AssociatedTypeWitness);
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 24))( AssociatedTypeWitness,  AssociatedConformanceWitness);
  sub_188F6DCB4();
  uint64_t v15 = *(void *)(v3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1LL, v3) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8LL))(v13, a1);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v11, v3);
  }

  return result;
}

uint64_t sub_188F6C4E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v20 = a1;
  uint64_t v21 = a2;
  uint64_t v22 = a4;
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v5);
  uint64_t v7 = (char *)&v19 - v6;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v10);
  uint64_t v14 = (char *)&v19 - v13;
  uint64_t v15 = swift_getAssociatedTypeWitness();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))( v20,  v21,  v15,  AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, AssociatedTypeWitness);
  sub_188F6DCB4();
  uint64_t v17 = *(void *)(v4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1LL, v4) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v22, v7, v4);
  }

  return result;
}

uint64_t sub_188F6C6FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v14 = a3;
  uint64_t v6 = *(void *)(a4 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v9 = (char *)&v13 - v8;
  uint64_t v10 = swift_getAssociatedTypeWitness();
  sub_188F6DCA8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))( v9,  a2,  v14,  v10,  AssociatedConformanceWitness);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8LL))(a1, v6);
}

uint64_t sub_188F6C82C@<X0>( uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v21 = a3;
  uint64_t v22 = a5;
  uint64_t v23 = a1;
  uint64_t v5 = *(void *)(a4 + 16);
  uint64_t v6 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v6);
  uint64_t v8 = (char *)&v20 - v7;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v10 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v11 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v11);
  uint64_t v15 = (char *)&v20 - v14;
  uint64_t v16 = swift_getAssociatedTypeWitness();
  sub_188F6DCA8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 48))( v13,  v20,  v21,  v16,  AssociatedConformanceWitness);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, AssociatedTypeWitness);
  sub_188F6DCB4();
  uint64_t v18 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1LL, v5) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v23, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, AssociatedTypeWitness);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v18 + 32))(v22, v8, v5);
  }

  return result;
}

uint64_t sub_188F6CA6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *, uint64_t), uint64_t a6)
{
  uint64_t v46 = a4;
  uint64_t v47 = a5;
  uint64_t v50 = a1;
  uint64_t v51 = a3;
  uint64_t v7 = *(void *)(a6 + 16);
  uint64_t v8 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v8);
  uint64_t v49 = (char *)&v40 - v9;
  uint64_t v10 = *(void *)(a6 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v45 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v12 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v12);
  uint64_t v16 = (char *)&v40 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v18 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v42 = TupleTypeMetadata2;
  uint64_t v48 = v18;
  uint64_t v19 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v44 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v21 = MEMORY[0x1895F8858](v19);
  uint64_t v23 = (char *)&v40 - v22;
  uint64_t v24 = MEMORY[0x1895F8858](v21);
  uint64_t v26 = (char *)&v40 - v25;
  uint64_t v41 = (char *)&v40 + *(int *)(v24 + 48) - v25;
  uint64_t v27 = swift_getAssociatedTypeWitness();
  uint64_t v43 = v10;
  sub_188F6DCA8();
  sub_188F6DCA8();
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  uint64_t v29 = v41;
  char v30 = (*(uint64_t (**)(char *, char *, char *, uint64_t, void (*)(char *, uint64_t), uint64_t, uint64_t))(AssociatedConformanceWitness + 56))( v41,  v16,  v14,  v46,  v47,  v27,  AssociatedConformanceWitness);
  uint64_t v31 = v45;
  uint64_t v32 = v16;
  uint64_t v33 = v42;
  uint64_t v47 = *(void (**)(char *, uint64_t))(v45 + 8);
  v47(v32, AssociatedTypeWitness);
  uint64_t v34 = v30 & 1;
  *uint64_t v26 = v30 & 1;
  int v35 = &v23[*(int *)(v33 + 48)];
  *uint64_t v23 = v30 & 1;
  char v36 = *(void (**)(char *, char *, uint64_t))(v31 + 16);
  v36(v35, v29, AssociatedTypeWitness);
  v36(&v44[*(int *)(v33 + 48)], v29, AssociatedTypeWitness);
  uint64_t v37 = v49;
  sub_188F6DCB4();
  uint64_t v38 = *(void *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48))(v37, 1LL, v7) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v51, v7);
    (*(void (**)(_BYTE *, uint64_t))(v48 + 8))(v26, v33);
    (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v50, v37, v7);
    v47(v35, AssociatedTypeWitness);
    return v34;
  }

  return result;
}

uint64_t sub_188F6CDDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v49 = a4;
  uint64_t v54 = a1;
  uint64_t v55 = a3;
  uint64_t v8 = *(void *)(a7 + 16);
  uint64_t v9 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v9);
  uint64_t v53 = (char *)&v42 - v10;
  uint64_t v11 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v45 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v42 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v47 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v46 = (char *)&v42 - v21;
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)&v42 - v23;
  uint64_t v43 = (char *)&v42 + *(int *)(v22 + 48) - v23;
  uint64_t v25 = swift_getAssociatedTypeWitness();
  uint64_t v44 = v11;
  sub_188F6DCA8();
  uint64_t v26 = v45;
  sub_188F6DCA8();
  uint64_t v27 = TupleTypeMetadata2;
  unint64_t v28 = v24;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v30 = v43;
  char v31 = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(AssociatedConformanceWitness + 64))( v43,  v16,  v26,  v49,  v50,  v51,  v25,  AssociatedConformanceWitness);
  uint64_t v32 = v48;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v48 + 8);
  v33(v16, AssociatedTypeWitness);
  uint64_t v34 = v31 & 1;
  uint64_t v51 = v28;
  *unint64_t v28 = v31 & 1;
  uint64_t v35 = *(int *)(v27 + 48);
  char v36 = v46;
  uint64_t v37 = &v46[v35];
  _BYTE *v46 = v31 & 1;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v38(&v36[v35], v30, AssociatedTypeWitness);
  uint64_t v39 = v53;
  v38(&v47[*(int *)(v27 + 48)], v30, AssociatedTypeWitness);
  sub_188F6DCB4();
  uint64_t v40 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v39, 1LL, v8) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v55, v8);
    (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v51, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v54, v39, v8);
    v33(v37, AssociatedTypeWitness);
    return v34;
  }

  return result;
}

uint64_t sub_188F6D164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6, uint64_t a7)
{
  uint64_t v50 = a5;
  uint64_t v51 = a6;
  uint64_t v49 = a4;
  uint64_t v54 = a1;
  uint64_t v55 = a3;
  uint64_t v8 = *(void *)(a7 + 16);
  uint64_t v9 = sub_188F6DCE4();
  MEMORY[0x1895F8858](v9);
  uint64_t v53 = (char *)&v42 - v10;
  uint64_t v11 = *(void *)(a7 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v48 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v13 = MEMORY[0x1895F8858](AssociatedTypeWitness);
  uint64_t v45 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  MEMORY[0x1895F8858](v13);
  uint64_t v16 = (char *)&v42 - v15;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  uint64_t v52 = *(void *)(TupleTypeMetadata2 - 8);
  uint64_t v18 = MEMORY[0x1895F8858](TupleTypeMetadata2);
  uint64_t v47 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  uint64_t v20 = MEMORY[0x1895F8858](v18);
  uint64_t v46 = (char *)&v42 - v21;
  uint64_t v22 = MEMORY[0x1895F8858](v20);
  uint64_t v24 = (char *)&v42 - v23;
  uint64_t v43 = (char *)&v42 + *(int *)(v22 + 48) - v23;
  uint64_t v25 = swift_getAssociatedTypeWitness();
  uint64_t v44 = v11;
  sub_188F6DCA8();
  uint64_t v26 = v45;
  sub_188F6DCA8();
  uint64_t v27 = TupleTypeMetadata2;
  unint64_t v28 = v24;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  char v30 = v43;
  char v31 = (*(uint64_t (**)(char *, char *, char *, uint64_t, uint64_t, _BYTE *, uint64_t, uint64_t))(AssociatedConformanceWitness + 80))( v43,  v16,  v26,  v49,  v50,  v51,  v25,  AssociatedConformanceWitness);
  uint64_t v32 = v48;
  uint64_t v33 = *(void (**)(char *, uint64_t))(v48 + 8);
  v33(v16, AssociatedTypeWitness);
  uint64_t v34 = v31 & 1;
  uint64_t v51 = v28;
  *unint64_t v28 = v31 & 1;
  uint64_t v35 = *(int *)(v27 + 48);
  char v36 = v46;
  uint64_t v37 = &v46[v35];
  _BYTE *v46 = v31 & 1;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
  v38(&v36[v35], v30, AssociatedTypeWitness);
  uint64_t v39 = v53;
  v38(&v47[*(int *)(v27 + 48)], v30, AssociatedTypeWitness);
  sub_188F6DCB4();
  uint64_t v40 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v39, 1LL, v8) == 1)
  {
    uint64_t result = sub_188F6DCFC();
    __break(1u);
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v55, v8);
    (*(void (**)(_BYTE *, uint64_t))(v52 + 8))(v51, v27);
    (*(void (**)(uint64_t, char *, uint64_t))(v40 + 32))(v54, v39, v8);
    v33(v37, AssociatedTypeWitness);
    return v34;
  }

  return result;
}

uint64_t sub_188F6D4EC()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0LL;
  }

  return result;
}

uint64_t *sub_188F6D58C(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 <= 7 && *(void *)(v5 + 64) <= 0x18uLL && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  }

  else
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~v6));
    swift_retain();
  }

  return a1;
}

uint64_t sub_188F6D64C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 8LL))( a1,  AssociatedTypeWitness);
}

uint64_t sub_188F6D6BC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 16LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F6D740(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 24LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F6D7C4(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F6D848(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 40LL))( a1,  a2,  AssociatedTypeWitness);
  return a1;
}

uint64_t sub_188F6D8CC(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = *(void *)(v5 + 64);
  char v8 = 8 * v7;
  if (v7 <= 3)
  {
    unsigned int v10 = ((a2 - v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      int v9 = *(_DWORD *)(a1 + v7);
      if (!v9) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 > 0xFF)
    {
      int v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7)) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }

    if (v10 < 2)
    {
LABEL_18:
      if ((_DWORD)v6) {
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, v6, AssociatedTypeWitness);
      }
      return 0LL;
    }
  }

  int v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7)) {
    goto LABEL_18;
  }
LABEL_11:
  int v11 = (v9 - 1) << v8;
  if ((_DWORD)v7)
  {
    __asm { BR              X11 }
  }

  return (v6 + v11 + 1);
}

void sub_188F6DA3C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  size_t v8 = *(void *)(v6 + 64);
  if (a3 <= v7)
  {
    unsigned int v9 = 0u;
  }

  else if (v8 <= 3)
  {
    unsigned int v11 = ((a3 - v7 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
    if (HIWORD(v11))
    {
      unsigned int v9 = 4u;
    }

    else if (v11 >= 0x100)
    {
      unsigned int v9 = 2;
    }

    else
    {
      unsigned int v9 = v11 > 1;
    }
  }

  else
  {
    unsigned int v9 = 1u;
  }

  if (v7 < a2)
  {
    unsigned int v10 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        int v12 = v10 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *(_WORD *)a1 = v12;
          a1[2] = BYTE2(v12);
        }

        else if ((_DWORD)v8 == 2)
        {
          *(_WORD *)a1 = v12;
        }

        else
        {
          *a1 = v12;
        }
      }
    }

    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v10;
    }

    __asm { BR              X10 }
  }

  __asm { BR              X11 }

uint64_t type metadata accessor for AtomicRawRepresentableStorage( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata( a1,  a2,  a3,  a4,  (uint64_t)&nominal type descriptor for AtomicRawRepresentableStorage);
}

uint64_t DoubleWord.first.setter(uint64_t result)
{
  void *v1 = result;
  return result;
}

uint64_t (*DoubleWord.first.modify())()
{
  return nullsub_1;
}

uint64_t DoubleWord.second.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t DoubleWord.second.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*DoubleWord.second.modify())()
{
  return nullsub_1;
}

ValueMetadata *type metadata accessor for DoubleWord()
{
  return &type metadata for DoubleWord;
}

uint64_t sub_188F6DC90()
{
  return MEMORY[0x189617D98]();
}

uint64_t sub_188F6DC9C()
{
  return MEMORY[0x189617E70]();
}

uint64_t sub_188F6DCA8()
{
  return MEMORY[0x189618220]();
}

uint64_t sub_188F6DCB4()
{
  return MEMORY[0x189618230]();
}

uint64_t sub_188F6DCC0()
{
  return MEMORY[0x189618A68]();
}

uint64_t sub_188F6DCCC()
{
  return MEMORY[0x189618A80]();
}

uint64_t sub_188F6DCD8()
{
  return MEMORY[0x189618A98]();
}

uint64_t sub_188F6DCE4()
{
  return MEMORY[0x189618AC0]();
}

uint64_t sub_188F6DCF0()
{
  return MEMORY[0x1896191E8]();
}

uint64_t sub_188F6DCFC()
{
  return MEMORY[0x1896198A0]();
}

uint64_t sub_188F6DD08()
{
  return MEMORY[0x1896198A8]();
}

uint64_t sub_188F6DD14()
{
  return MEMORY[0x189619978]();
}

uint64_t sub_188F6DD20()
{
  return MEMORY[0x189619CC8]();
}

uint64_t sub_188F6DD2C()
{
  return MEMORY[0x18961A680]();
}

uint64_t sub_188F6DD38()
{
  return MEMORY[0x18961A690]();
}

uint64_t sub_188F6DD44()
{
  return MEMORY[0x18961A6C0]();
}

void bzero(void *a1, size_t a2)
{
}

uint64_t swift_allocObject()
{
  return MEMORY[0x18961B0B0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x18961B0B8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x18961B0C0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x18961B0F8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x18961B108]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x18961B128]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x18961B150]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x18961B180]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x18961B1D8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x18961B218]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x18961B220]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x18961B290]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x18961B2F8]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x18961B328]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x18961B330]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x18961B358]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x18961B3D0]();
}

uint64_t swift_retain()
{
  return MEMORY[0x18961B3E0]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x18961B3E8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x18961B458]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x18961B460]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x18961B468]();
}
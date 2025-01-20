uint64_t __atomic_is_lock_free(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  v2 = a1 - 1;
  result = 1LL;
  switch(v2)
  {
    case 0LL:
      return result;
    case 1LL:
      if ((a2 & 1) != 0) {
        goto LABEL_7;
      }
      break;
    case 3LL:
      if ((a2 & 3) != 0) {
        goto LABEL_7;
      }
      break;
    case 7LL:
      if ((a2 & 7) != 0) {
        goto LABEL_7;
      }
      break;
    default:
LABEL_7:
      result = 0LL;
      break;
  }

  return result;
}

uint64_t __atomic_load(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6 = result;
  switch((int)result)
  {
    case 1:
      else {
        unsigned __int8 v7 = *a2;
      }
      *a3 = v7;
      break;
    case 2:
      else {
        unsigned __int16 v8 = *(_WORD *)a2;
      }
      *(_WORD *)a3 = v8;
      break;
    case 4:
      else {
        unsigned int v9 = *(_DWORD *)a2;
      }
      *(_DWORD *)a3 = v9;
      break;
    case 8:
      else {
        unint64_t v10 = *(void *)a2;
      }
      *(void *)a3 = v10;
      break;
    default:
LABEL_14:
      _os_nospin_lock_lock();
      memcpy(a3, a2, v6);
      result = _os_nospin_lock_unlock();
      break;
  }

  return result;
}

uint64_t __atomic_store(uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, int a4)
{
  int v6 = result;
  switch((int)result)
  {
    case 1:
      unsigned __int8 v7 = *a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v7, a2);
      }
      else {
        *a2 = v7;
      }
      break;
    case 2:
      unsigned __int16 v8 = *(_WORD *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v8, (unsigned __int16 *)a2);
      }
      else {
        *(_WORD *)a2 = v8;
      }
      break;
    case 4:
      unsigned int v9 = *(_DWORD *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v9, (unsigned int *)a2);
      }
      else {
        *(_DWORD *)a2 = v9;
      }
      break;
    case 8:
      unint64_t v10 = *(void *)a3;
      if (a4 == 3 || a4 == 5) {
        atomic_store(v10, (unint64_t *)a2);
      }
      else {
        *(void *)a2 = v10;
      }
      break;
    default:
LABEL_14:
      _os_nospin_lock_lock();
      memcpy(a2, a3, v6);
      result = _os_nospin_lock_unlock();
      break;
  }

  return result;
}

uint64_t __atomic_compare_exchange( int a1, unsigned __int8 *a2, _BYTE *a3, unsigned __int8 *a4, int a5, int a6)
{
  switch(a1)
  {
    case 1:
      unsigned __int8 v10 = *a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v27 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v27) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }

            else
            {
              int v37 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v37) {
                  goto LABEL_196;
                }
              }

              while (__stxr(v10, a2));
            }
          }

          else
          {
            int v11 = *a3;
            do
            {
              int v12 = __ldaxr(a2);
              if (v12 != v11) {
                goto LABEL_196;
              }
            }

            while (__stxr(v10, a2));
          }

          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v34 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v34) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }

            else
            {
              int v54 = *a3;
              do
              {
                int v12 = __ldxr(a2);
                if (v12 != v54) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }
          }

          else
          {
            int v24 = *a3;
            do
            {
              int v12 = __ldaxr(a2);
              if (v12 != v24) {
                goto LABEL_196;
              }
            }

            while (__stlxr(v10, a2));
          }

          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v35 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v35) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }

            else
            {
              int v55 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v55) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }
          }

          else
          {
            int v25 = *a3;
            do
            {
              int v12 = __ldaxr(a2);
              if (v12 != v25) {
                goto LABEL_196;
              }
            }

            while (__stlxr(v10, a2));
          }

          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v36 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v36) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }

            else
            {
              int v56 = *a3;
              do
              {
                int v12 = __ldaxr(a2);
                if (v12 != v56) {
                  goto LABEL_196;
                }
              }

              while (__stlxr(v10, a2));
            }
          }

          else
          {
            int v26 = *a3;
            do
            {
              int v12 = __ldaxr(a2);
              if (v12 != v26) {
                goto LABEL_196;
              }
            }

            while (__stlxr(v10, a2));
          }

          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v33 = *a3;
              while (1)
              {
                int v12 = __ldaxr(a2);
                if (v12 != v33) {
                  break;
                }
                if (!__stlxr(v10, a2)) {
                  goto LABEL_296;
                }
              }
            }

            else
            {
              int v53 = *a3;
              while (1)
              {
                int v12 = __ldxr(a2);
                if (v12 != v53) {
                  break;
                }
                if (!__stxr(v10, a2)) {
                  goto LABEL_296;
                }
              }
            }
          }

          else
          {
            int v23 = *a3;
            while (1)
            {
              int v12 = __ldaxr(a2);
              if (v12 != v23) {
                break;
              }
              if (!__stxr(v10, a2)) {
                goto LABEL_296;
              }
            }
          }

LABEL_196:
          __clrex();
          uint64_t result = 0LL;
          *a3 = v12;
          break;
      }

      break;
    case 2:
      unsigned __int16 v13 = *(_WORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v32 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v32) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }

            else
            {
              int v52 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v52) {
                  goto LABEL_261;
                }
              }

              while (__stxr(v13, (unsigned __int16 *)a2));
            }
          }

          else
          {
            int v14 = *(unsigned __int16 *)a3;
            do
            {
              int v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v14) {
                goto LABEL_261;
              }
            }

            while (__stxr(v13, (unsigned __int16 *)a2));
          }

          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v49 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v49) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }

            else
            {
              int v68 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldxr((unsigned __int16 *)a2);
                if (v15 != v68) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }

          else
          {
            int v29 = *(unsigned __int16 *)a3;
            do
            {
              int v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v29) {
                goto LABEL_261;
              }
            }

            while (__stlxr(v13, (unsigned __int16 *)a2));
          }

          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v50 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v50) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }

            else
            {
              int v69 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v69) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }

          else
          {
            int v30 = *(unsigned __int16 *)a3;
            do
            {
              int v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v30) {
                goto LABEL_261;
              }
            }

            while (__stlxr(v13, (unsigned __int16 *)a2));
          }

          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v51 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v51) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }

            else
            {
              int v70 = *(unsigned __int16 *)a3;
              do
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v70) {
                  goto LABEL_261;
                }
              }

              while (__stlxr(v13, (unsigned __int16 *)a2));
            }
          }

          else
          {
            int v31 = *(unsigned __int16 *)a3;
            do
            {
              int v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v31) {
                goto LABEL_261;
              }
            }

            while (__stlxr(v13, (unsigned __int16 *)a2));
          }

          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v48 = *(unsigned __int16 *)a3;
              while (1)
              {
                int v15 = __ldaxr((unsigned __int16 *)a2);
                if (v15 != v48) {
                  break;
                }
              }
            }

            else
            {
              int v67 = *(unsigned __int16 *)a3;
              while (1)
              {
                int v15 = __ldxr((unsigned __int16 *)a2);
                if (v15 != v67) {
                  break;
                }
              }
            }
          }

          else
          {
            int v28 = *(unsigned __int16 *)a3;
            while (1)
            {
              int v15 = __ldaxr((unsigned __int16 *)a2);
              if (v15 != v28) {
                break;
              }
            }
          }

LABEL_261:
          __clrex();
          uint64_t result = 0LL;
          *(_WORD *)a3 = v15;
          break;
      }

      break;
    case 4:
      unsigned int v16 = *(_DWORD *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v42 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v42) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }

            else
            {
              int v61 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v61) {
                  goto LABEL_278;
                }
              }

              while (__stxr(v16, (unsigned int *)a2));
            }
          }

          else
          {
            int v17 = *(_DWORD *)a3;
            do
            {
              unsigned int v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v17) {
                goto LABEL_278;
              }
            }

            while (__stxr(v16, (unsigned int *)a2));
          }

          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v58 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v58) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }

            else
            {
              int v72 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldxr((unsigned int *)a2);
                if (v18 != v72) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }
          }

          else
          {
            int v39 = *(_DWORD *)a3;
            do
            {
              unsigned int v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v39) {
                goto LABEL_278;
              }
            }

            while (__stlxr(v16, (unsigned int *)a2));
          }

          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v59 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v59) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }

            else
            {
              int v73 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v73) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }
          }

          else
          {
            int v40 = *(_DWORD *)a3;
            do
            {
              unsigned int v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v40) {
                goto LABEL_278;
              }
            }

            while (__stlxr(v16, (unsigned int *)a2));
          }

          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v60 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v60) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }

            else
            {
              int v74 = *(_DWORD *)a3;
              do
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v74) {
                  goto LABEL_278;
                }
              }

              while (__stlxr(v16, (unsigned int *)a2));
            }
          }

          else
          {
            int v41 = *(_DWORD *)a3;
            do
            {
              unsigned int v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v41) {
                goto LABEL_278;
              }
            }

            while (__stlxr(v16, (unsigned int *)a2));
          }

          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              int v57 = *(_DWORD *)a3;
              while (1)
              {
                unsigned int v18 = __ldaxr((unsigned int *)a2);
                if (v18 != v57) {
                  break;
                }
              }
            }

            else
            {
              int v71 = *(_DWORD *)a3;
              while (1)
              {
                unsigned int v18 = __ldxr((unsigned int *)a2);
                if (v18 != v71) {
                  break;
                }
              }
            }
          }

          else
          {
            int v38 = *(_DWORD *)a3;
            while (1)
            {
              unsigned int v18 = __ldaxr((unsigned int *)a2);
              if (v18 != v38) {
                break;
              }
            }
          }

LABEL_278:
          __clrex();
          uint64_t result = 0LL;
          *(_DWORD *)a3 = v18;
          break;
      }

      break;
    case 8:
      unint64_t v20 = *(void *)a4;
      switch(a5)
      {
        case 1:
        case 2:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              uint64_t v47 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v47) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }

            else
            {
              uint64_t v66 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v66) {
                  goto LABEL_295;
                }
              }

              while (__stxr(v20, (unint64_t *)a2));
            }
          }

          else
          {
            uint64_t v21 = *(void *)a3;
            do
            {
              unint64_t v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v21) {
                goto LABEL_295;
              }
            }

            while (__stxr(v20, (unint64_t *)a2));
          }

          goto LABEL_296;
        case 3:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              uint64_t v63 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v63) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }

            else
            {
              uint64_t v76 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldxr((unint64_t *)a2);
                if (v22 != v76) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }
          }

          else
          {
            uint64_t v44 = *(void *)a3;
            do
            {
              unint64_t v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v44) {
                goto LABEL_295;
              }
            }

            while (__stlxr(v20, (unint64_t *)a2));
          }

          goto LABEL_296;
        case 4:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              uint64_t v64 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v64) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }

            else
            {
              uint64_t v77 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v77) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }
          }

          else
          {
            uint64_t v45 = *(void *)a3;
            do
            {
              unint64_t v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v45) {
                goto LABEL_295;
              }
            }

            while (__stlxr(v20, (unint64_t *)a2));
          }

          goto LABEL_296;
        case 5:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              uint64_t v65 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v65) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }

            else
            {
              uint64_t v78 = *(void *)a3;
              do
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v78) {
                  goto LABEL_295;
                }
              }

              while (__stlxr(v20, (unint64_t *)a2));
            }
          }

          else
          {
            uint64_t v46 = *(void *)a3;
            do
            {
              unint64_t v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v46) {
                goto LABEL_295;
              }
            }

            while (__stlxr(v20, (unint64_t *)a2));
          }

          goto LABEL_296;
        default:
          if ((a6 - 1) >= 2)
          {
            if (a6 == 5)
            {
              uint64_t v62 = *(void *)a3;
              while (1)
              {
                unint64_t v22 = __ldaxr((unint64_t *)a2);
                if (v22 != v62) {
                  break;
                }
              }
            }

            else
            {
              uint64_t v75 = *(void *)a3;
              while (1)
              {
                unint64_t v22 = __ldxr((unint64_t *)a2);
                if (v22 != v75) {
                  break;
                }
              }
            }
          }

          else
          {
            uint64_t v43 = *(void *)a3;
            while (1)
            {
              unint64_t v22 = __ldaxr((unint64_t *)a2);
              if (v22 != v43) {
                break;
              }
            }
          }

LABEL_295:
          __clrex();
          uint64_t result = 0LL;
          *(void *)a3 = v22;
          break;
      }

      break;
    default:
LABEL_23:
      _os_nospin_lock_lock();
      if (!memcmp(a2, a3, a1))
      {
        memcpy(a2, a4, a1);
        _os_nospin_lock_unlock();
LABEL_296:
        uint64_t result = 1LL;
      }

      else
      {
        memcpy(a3, a2, a1);
        _os_nospin_lock_unlock();
        uint64_t result = 0LL;
      }

      break;
  }

  return result;
}

uint64_t __atomic_exchange( uint64_t result, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 *a4, int a5)
{
  int v8 = result;
  switch((int)result)
  {
    case 1:
      unsigned __int8 v9 = *a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            unsigned __int8 v10 = __ldaxr(a2);
          while (__stxr(v9, a2));
          break;
        case 3:
          do
            unsigned __int8 v10 = __ldxr(a2);
          while (__stlxr(v9, a2));
          break;
        case 4:
          do
            unsigned __int8 v10 = __ldaxr(a2);
          while (__stlxr(v9, a2));
          break;
        case 5:
          do
            unsigned __int8 v10 = __ldaxr(a2);
          while (__stlxr(v9, a2));
          break;
        default:
          do
            unsigned __int8 v10 = __ldxr(a2);
          while (__stxr(v9, a2));
          break;
      }

      *a4 = v10;
      break;
    case 2:
      unsigned __int16 v11 = *(_WORD *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            unsigned __int16 v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stxr(v11, (unsigned __int16 *)a2));
          break;
        case 3:
          do
            unsigned __int16 v12 = __ldxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        case 4:
          do
            unsigned __int16 v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        case 5:
          do
            unsigned __int16 v12 = __ldaxr((unsigned __int16 *)a2);
          while (__stlxr(v11, (unsigned __int16 *)a2));
          break;
        default:
          do
            unsigned __int16 v12 = __ldxr((unsigned __int16 *)a2);
          while (__stxr(v11, (unsigned __int16 *)a2));
          break;
      }

      *(_WORD *)a4 = v12;
      break;
    case 4:
      unsigned int v13 = *(_DWORD *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            unsigned int v14 = __ldaxr((unsigned int *)a2);
          while (__stxr(v13, (unsigned int *)a2));
          break;
        case 3:
          do
            unsigned int v14 = __ldxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        case 4:
          do
            unsigned int v14 = __ldaxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        case 5:
          do
            unsigned int v14 = __ldaxr((unsigned int *)a2);
          while (__stlxr(v13, (unsigned int *)a2));
          break;
        default:
          do
            unsigned int v14 = __ldxr((unsigned int *)a2);
          while (__stxr(v13, (unsigned int *)a2));
          break;
      }

      *(_DWORD *)a4 = v14;
      break;
    case 8:
      unint64_t v15 = *(void *)a3;
      switch(a5)
      {
        case 1:
        case 2:
          do
            unint64_t v16 = __ldaxr((unint64_t *)a2);
          while (__stxr(v15, (unint64_t *)a2));
          break;
        case 3:
          do
            unint64_t v16 = __ldxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        case 4:
          do
            unint64_t v16 = __ldaxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        case 5:
          do
            unint64_t v16 = __ldaxr((unint64_t *)a2);
          while (__stlxr(v15, (unint64_t *)a2));
          break;
        default:
          do
            unint64_t v16 = __ldxr((unint64_t *)a2);
          while (__stxr(v15, (unint64_t *)a2));
          break;
      }

      *(void *)a4 = v16;
      break;
    default:
LABEL_38:
      _os_nospin_lock_lock();
      memcpy(a4, a2, v8);
      memcpy(a2, a3, v8);
      uint64_t result = _os_nospin_lock_unlock();
      break;
  }

  return result;
}

uint64_t __atomic_load_1(unsigned __int8 *a1, int a2)
{
  else {
    return *a1;
  }
}

uint64_t __atomic_load_2(unsigned __int16 *a1, int a2)
{
  else {
    return *a1;
  }
}

uint64_t __atomic_load_4(unsigned int *a1, int a2)
{
  else {
    return *a1;
  }
}

unint64_t __atomic_load_8(unint64_t *a1, int a2)
{
  else {
    return *a1;
  }
}

unsigned __int8 *__atomic_store_1(unsigned __int8 *result, unsigned __int8 a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unsigned __int16 *__atomic_store_2(unsigned __int16 *result, unsigned __int16 a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unsigned int *__atomic_store_4(unsigned int *result, unsigned int a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

unint64_t *__atomic_store_8(unint64_t *result, unint64_t a2, int a3)
{
  if (a3 == 3 || a3 == 5) {
    atomic_store(a2, result);
  }
  else {
    *uint64_t result = a2;
  }
  return result;
}

uint64_t __atomic_exchange_1(unsigned __int8 *a1, unsigned __int8 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      goto LABEL_11;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
LABEL_11:
      uint64_t v4 = v3;
      break;
    default:
      do
        uint64_t v4 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }

  return v4;
}

uint64_t __atomic_exchange_2(unsigned __int16 *a1, unsigned __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      goto LABEL_11;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      goto LABEL_11;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
LABEL_11:
      uint64_t v4 = v3;
      break;
    default:
      do
        uint64_t v4 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }

  return v4;
}

uint64_t __atomic_exchange_4(unsigned int *a1, unsigned int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_exchange_8(unint64_t *a1, unint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_compare_exchange_1(unsigned __int8 *a1, _BYTE *a2, unsigned __int8 a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v11 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v11) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v16 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v16) {
              goto LABEL_74;
            }
          }

          while (__stxr(a3, a1));
        }
      }

      else
      {
        int v5 = *a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v5) {
            goto LABEL_74;
          }
        }

        while (__stxr(a3, a1));
      }

      return 1LL;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v13 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v13) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v18 = *a2;
          do
          {
            int v6 = __ldxr(a1);
            if (v6 != v18) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v8 = *a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v8) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v14 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v14) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v19 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v19) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v9 = *a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v9) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v15 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v15) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v20 = *a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v20) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v10 = *a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v10) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v12 = *a2;
          while (1)
          {
            int v6 = __ldaxr(a1);
            if (v6 != v12) {
              break;
            }
            if (!__stlxr(a3, a1)) {
              return 1LL;
            }
          }
        }

        else
        {
          int v17 = *a2;
          while (1)
          {
            int v6 = __ldxr(a1);
            if (v6 != v17) {
              break;
            }
            if (!__stxr(a3, a1)) {
              return 1LL;
            }
          }
        }
      }

      else
      {
        int v7 = *a2;
        while (1)
        {
          int v6 = __ldaxr(a1);
          if (v6 != v7) {
            break;
          }
          if (!__stxr(a3, a1)) {
            return 1LL;
          }
        }
      }

LABEL_74:
      __clrex();
      uint64_t result = 0LL;
      *a2 = v6;
      return result;
  }

      __clrex();
      uint64_t result = 0LL;
      *a2 = v6;
      return result;
  }

      __clrex();
      uint64_t result = 0LL;
      *a2 = v6;
      return result;
  }
}

uint64_t __atomic_compare_exchange_2(unsigned __int16 *a1, _WORD *a2, unsigned __int16 a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v11 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v11) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v16 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v16) {
              goto LABEL_74;
            }
          }

          while (__stxr(a3, a1));
        }
      }

      else
      {
        int v5 = (unsigned __int16)*a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v5) {
            goto LABEL_74;
          }
        }

        while (__stxr(a3, a1));
      }

      return 1LL;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v13 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v13) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v18 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldxr(a1);
            if (v6 != v18) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v8 = (unsigned __int16)*a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v8) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v14 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v14) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v19 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v19) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v9 = (unsigned __int16)*a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v9) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v15 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v15) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          int v20 = (unsigned __int16)*a2;
          do
          {
            int v6 = __ldaxr(a1);
            if (v6 != v20) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        int v10 = (unsigned __int16)*a2;
        do
        {
          int v6 = __ldaxr(a1);
          if (v6 != v10) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          int v12 = (unsigned __int16)*a2;
          while (1)
          {
            int v6 = __ldaxr(a1);
            if (v6 != v12) {
              break;
            }
            if (!__stlxr(a3, a1)) {
              return 1LL;
            }
          }
        }

        else
        {
          int v17 = (unsigned __int16)*a2;
          while (1)
          {
            int v6 = __ldxr(a1);
            if (v6 != v17) {
              break;
            }
            if (!__stxr(a3, a1)) {
              return 1LL;
            }
          }
        }
      }

      else
      {
        int v7 = (unsigned __int16)*a2;
        while (1)
        {
          int v6 = __ldaxr(a1);
          if (v6 != v7) {
            break;
          }
          if (!__stxr(a3, a1)) {
            return 1LL;
          }
        }
      }

uint64_t __atomic_compare_exchange_4(unsigned int *a1, unsigned int *a2, unsigned int a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unsigned int v11 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v11) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unsigned int v16 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v16) {
              goto LABEL_74;
            }
          }

          while (__stxr(a3, a1));
        }
      }

      else
      {
        unsigned int v5 = *a2;
        do
        {
          unsigned int v6 = __ldaxr(a1);
          if (v6 != v5) {
            goto LABEL_74;
          }
        }

        while (__stxr(a3, a1));
      }

      return 1LL;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unsigned int v13 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v13) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unsigned int v18 = *a2;
          do
          {
            unsigned int v6 = __ldxr(a1);
            if (v6 != v18) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unsigned int v8 = *a2;
        do
        {
          unsigned int v6 = __ldaxr(a1);
          if (v6 != v8) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unsigned int v14 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v14) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unsigned int v19 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v19) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unsigned int v9 = *a2;
        do
        {
          unsigned int v6 = __ldaxr(a1);
          if (v6 != v9) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unsigned int v15 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v15) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unsigned int v20 = *a2;
          do
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v20) {
              goto LABEL_74;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unsigned int v10 = *a2;
        do
        {
          unsigned int v6 = __ldaxr(a1);
          if (v6 != v10) {
            goto LABEL_74;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unsigned int v12 = *a2;
          while (1)
          {
            unsigned int v6 = __ldaxr(a1);
            if (v6 != v12) {
              break;
            }
            if (!__stlxr(a3, a1)) {
              return 1LL;
            }
          }
        }

        else
        {
          unsigned int v17 = *a2;
          while (1)
          {
            unsigned int v6 = __ldxr(a1);
            if (v6 != v17) {
              break;
            }
            if (!__stxr(a3, a1)) {
              return 1LL;
            }
          }
        }
      }

      else
      {
        unsigned int v7 = *a2;
        while (1)
        {
          unsigned int v6 = __ldaxr(a1);
          if (v6 != v7) {
            break;
          }
          if (!__stxr(a3, a1)) {
            return 1LL;
          }
        }
      }

uint64_t __atomic_compare_exchange_8( unint64_t *a1, unint64_t *a2, unint64_t a3, int a4, int a5)
{
  switch(a4)
  {
    case 1:
    case 2:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unint64_t v10 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v10) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unint64_t v15 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v15) {
              goto LABEL_72;
            }
          }

          while (__stxr(a3, a1));
        }
      }

      else
      {
        unint64_t v5 = *a2;
        do
        {
          unint64_t v6 = __ldaxr(a1);
          if (v6 != v5) {
            goto LABEL_72;
          }
        }

        while (__stxr(a3, a1));
      }

      return 1LL;
    case 3:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unint64_t v12 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v12) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unint64_t v17 = *a2;
          do
          {
            unint64_t v6 = __ldxr(a1);
            if (v6 != v17) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unint64_t v7 = *a2;
        do
        {
          unint64_t v6 = __ldaxr(a1);
          if (v6 != v7) {
            goto LABEL_72;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 4:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unint64_t v13 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v13) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unint64_t v18 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v18) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unint64_t v8 = *a2;
        do
        {
          unint64_t v6 = __ldaxr(a1);
          if (v6 != v8) {
            goto LABEL_72;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    case 5:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unint64_t v14 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v14) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }

        else
        {
          unint64_t v19 = *a2;
          do
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v19) {
              goto LABEL_72;
            }
          }

          while (__stlxr(a3, a1));
        }
      }

      else
      {
        unint64_t v9 = *a2;
        do
        {
          unint64_t v6 = __ldaxr(a1);
          if (v6 != v9) {
            goto LABEL_72;
          }
        }

        while (__stlxr(a3, a1));
      }

      return 1LL;
    default:
      if ((a5 - 1) >= 2)
      {
        if (a5 == 5)
        {
          unint64_t v16 = *a2;
          while (1)
          {
            unint64_t v6 = __ldaxr(a1);
            if (v6 != v16) {
              break;
            }
            if (!__stlxr(a3, a1)) {
              return 1LL;
            }
          }
        }

        else
        {
          unint64_t v20 = *a2;
          while (1)
          {
            unint64_t v6 = __ldxr(a1);
            if (v6 != v20) {
              break;
            }
            if (!__stxr(a3, a1)) {
              return 1LL;
            }
          }
        }
      }

      else
      {
        unint64_t v11 = *a2;
        while (1)
        {
          unint64_t v6 = __ldaxr(a1);
          if (v6 != v11) {
            break;
          }
          if (!__stxr(a3, a1)) {
            return 1LL;
          }
        }
      }

LABEL_72:
      __clrex();
      uint64_t result = 0LL;
      *a2 = v6;
      return result;
  }

uint64_t __atomic_fetch_add_1(unsigned __int8 *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_add_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_add_4(unsigned int *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_fetch_add_8(unint64_t *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 + a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(v3 + a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_sub_1(unsigned __int8 *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_sub_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_sub_4(unsigned int *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_fetch_sub_8(unint64_t *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 - a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(v3 - a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_and_1(unsigned __int8 *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_and_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_and_4(unsigned int *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_fetch_and_8(unint64_t *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 & a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(v3 & a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_or_1(unsigned __int8 *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_or_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_or_4(unsigned int *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_fetch_or_8(unint64_t *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 | a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(v3 | a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_xor_1(unsigned __int8 *a1, char a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_xor_2(unsigned __int16 *a1, __int16 a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }

  return v3;
}

uint64_t __atomic_fetch_xor_4(unsigned int *a1, int a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        uint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        uint64_t v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }

  return v3;
}

unint64_t __atomic_fetch_xor_8(unint64_t *a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 1:
    case 2:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
    case 3:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 4:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    case 5:
      do
        unint64_t v3 = __ldaxr(a1);
      while (__stlxr(v3 ^ a2, a1));
      break;
    default:
      do
        unint64_t v3 = __ldxr(a1);
      while (__stxr(v3 ^ a2, a1));
      break;
  }

  return v3;
}

void atomic_flag_clear(std::atomic_flag *__o)
{
}

void atomic_flag_clear_explicit(std::atomic_flag *__o, std::memory_order __m)
{
  if (__m == memory_order_release || __m == memory_order_seq_cst) {
    atomic_store(0, (unsigned __int8 *)__o);
  }
  else {
    __o->__a_ = 0;
  }
}

BOOL atomic_flag_test_and_set(std::atomic_flag *__o)
{
  do
    unsigned __int8 v1 = __ldaxr((unsigned __int8 *)__o);
  while (__stlxr(1u, (unsigned __int8 *)__o));
  return v1 & 1;
}

BOOL atomic_flag_test_and_set_explicit(std::atomic_flag *__o, std::memory_order __m)
{
  switch(__m)
  {
    case memory_order_consume:
    case memory_order_acquire:
      do
        unsigned __int8 v2 = __ldaxr((unsigned __int8 *)__o);
      while (__stxr(1u, (unsigned __int8 *)__o));
      goto LABEL_11;
    case memory_order_release:
      do
        unsigned __int8 v2 = __ldxr((unsigned __int8 *)__o);
      while (__stlxr(1u, (unsigned __int8 *)__o));
      goto LABEL_11;
    case memory_order_acq_rel:
      do
        unsigned __int8 v2 = __ldaxr((unsigned __int8 *)__o);
      while (__stlxr(1u, (unsigned __int8 *)__o));
      goto LABEL_11;
    case memory_order_seq_cst:
      do
        unsigned __int8 v2 = __ldaxr((unsigned __int8 *)__o);
      while (__stlxr(1u, (unsigned __int8 *)__o));
LABEL_11:
      unsigned __int8 v3 = v2;
      break;
    default:
      do
        unsigned __int8 v3 = __ldxr((unsigned __int8 *)__o);
      while (__stxr(1u, (unsigned __int8 *)__o));
      break;
  }

  return v3 & 1;
}

  ;
}

void atomic_thread_fence(std::memory_order __m)
{
  switch(__m)
  {
    case memory_order_consume:
    case memory_order_acquire:
      __dmb(9u);
      break;
    case memory_order_release:
    case memory_order_acq_rel:
    case memory_order_seq_cst:
      __dmb(0xBu);
      break;
    default:
      return;
  }

uint64_t __clzti2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    a1 = 0LL;
  }
  return __clz(a1 | a2) + ((a2 == 0) << 6);
}

unint64_t __divti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a1 ^ (a2 >> 63);
  uint64_t v5 = a4 >> 63;
  unint64_t v6 = v4 + ((unint64_t)a2 >> 63);
  else {
    unint64_t v7 = a2 ^ (a2 >> 63);
  }
  uint64_t v8 = a3 ^ (a4 >> 63);
  unint64_t v9 = v8 + ((unint64_t)a4 >> 63);
  else {
    unint64_t v10 = a4 ^ (a4 >> 63);
  }
  return (__udivmodti4(v6, v7, v9, v10, 0LL) ^ v5 ^ (a2 >> 63)) - (v5 ^ (a2 >> 63));
}

float __extendhfsf2(__int16 a1)
{
  unsigned int v1 = a1 & 0x7FFF;
  unsigned int v2 = __clz(v1);
  int v3 = (v1 << (v2 - 8)) ^ 0x800000 | (1124073472 - (v2 << 23));
  if ((a1 & 0x7FFF) == 0) {
    int v3 = 0;
  }
  else {
    int v4 = v3;
  }
  int v5 = (v1 << 13) + 939524096;
  if (((a1 & 0x7FFFu) - 1024) >> 11 > 0xE) {
    int v5 = v4;
  }
  LODWORD(result) = v5 | ((a1 & 0x8000) << 16);
  return result;
}

uint64_t __gcc_personality_v0(int a1, char a2, int a3, uintptr_t a4, _Unwind_Context *context)
{
  if ((a2 & 1) != 0) {
    return 8LL;
  }
  uintptr_t LanguageSpecificData = _Unwind_GetLanguageSpecificData(context);
  if (!LanguageSpecificData) {
    return 8LL;
  }
  uint64_t v8 = (unsigned __int8 *)LanguageSpecificData;
  uintptr_t IP = _Unwind_GetIP(context);
  uintptr_t RegionStart = _Unwind_GetRegionStart(context);
  unsigned int v13 = *v8;
  unint64_t v12 = (unsigned __int16 *)(v8 + 1);
  unsigned int v11 = v13;
  int v32 = v12;
  if (v13 != 255)
  {
    readEncodedPointer(&v32, v11);
    unint64_t v12 = v32;
  }

  int v15 = *(unsigned __int8 *)v12;
  unint64_t v14 = (unsigned __int16 *)((char *)v12 + 1);
  int v32 = v14;
  if (v15 != 255)
  {
    do
    {
      int v16 = *(char *)v14;
      unint64_t v14 = (unsigned __int16 *)((char *)v14 + 1);
    }

    while (v16 < 0);
  }

  int v17 = 0;
  unsigned int v18 = 0;
  unint64_t v19 = IP + ~RegionStart;
  unint64_t v20 = (unsigned __int16 *)((char *)v14 + 1);
  int v32 = (unsigned __int16 *)((char *)v14 + 1);
  unsigned int v21 = *(unsigned __int8 *)v14;
  do
  {
    char v22 = *(_BYTE *)v20;
    unint64_t v20 = (unsigned __int16 *)((char *)v20 + 1);
    v18 |= (v22 & 0x7F) << v17;
    v17 += 7;
  }

  while (v22 < 0);
  int v31 = v20;
  if (!v18) {
    return 8LL;
  }
  int v23 = (unsigned __int16 *)((char *)v20 + v18);
  while (1)
  {
    unint64_t v24 = readEncodedPointer(&v31, v21);
    unint64_t v25 = readEncodedPointer(&v31, v21);
    unint64_t v26 = readEncodedPointer(&v31, v21);
    unint64_t v27 = v26;
    int v28 = v31;
    do
    {
      int v29 = *(char *)v28;
      int v28 = (unsigned __int16 *)((char *)v28 + 1);
    }

    while (v29 < 0);
    int v31 = v28;
    if (v26)
    {
      if (v24 <= v19 && v19 < v25 + v24) {
        break;
      }
    }

    if (v28 >= v23) {
      return 8LL;
    }
  }

  _Unwind_SetGR(context, 0, a4);
  _Unwind_SetGR(context, 1, 0LL);
  _Unwind_SetIP(context, v27 + RegionStart);
  return 7LL;
}

unint64_t readEncodedPointer(unsigned __int16 **a1, unsigned int a2)
{
  if (a2 == 255) {
    return 0LL;
  }
  unsigned int v2 = *a1;
  switch(a2 & 0xF)
  {
    case 0u:
    case 4u:
    case 0xCu:
      int v4 = v2 + 4;
      unint64_t v3 = *(void *)v2;
      break;
    case 1u:
      int v5 = 0;
      unint64_t v3 = 0LL;
      int v4 = *a1;
      do
      {
        char v6 = *(_BYTE *)v4;
        int v4 = (unsigned __int16 *)((char *)v4 + 1);
        v3 |= (v6 & 0x7F) << v5;
        v5 += 7;
      }

      while (v6 < 0);
      break;
    case 2u:
      int v4 = v2 + 1;
      unint64_t v3 = *v2;
      break;
    case 3u:
      int v4 = v2 + 2;
      unint64_t v3 = *(unsigned int *)v2;
      break;
    case 0xAu:
      int v4 = v2 + 1;
      unint64_t v3 = (__int16)*v2;
      break;
    case 0xBu:
      int v4 = v2 + 2;
      unint64_t v3 = *(int *)v2;
      break;
    default:
      __compilerrt_abort_impl( "/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c",  121,  "readEncodedPointer");
  }

  int v7 = (a2 >> 4) & 7;
  if (v7)
  {
    if (v7 != 1) {
      __compilerrt_abort_impl( "/Library/Caches/com.apple.xbs/Sources/Libcompiler_rt/lib/builtins/gcc_personality_v0.c",  139,  "readEncodedPointer");
    }
    v3 += (unint64_t)v2;
  }

  if ((a2 & 0x80) != 0) {
    unint64_t v3 = *(void *)v3;
  }
  *a1 = v4;
  return v3;
}

void __compilerrt_abort_impl(char *a1, int a2, char *a3)
{
}

unint64_t __modti3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 ^ (a4 >> 63);
  unint64_t v6 = v5 + ((unint64_t)a4 >> 63);
  else {
    unint64_t v7 = a4 ^ (a4 >> 63);
  }
  uint64_t v8 = a1 ^ (a2 >> 63);
  unint64_t v9 = v8 + ((unint64_t)a2 >> 63);
  else {
    unint64_t v10 = a2 ^ (a2 >> 63);
  }
  __udivmodti4(v9, v10, v6, v7, &v12);
  return (v12 ^ (a2 >> 63)) + ((unint64_t)a2 >> 63);
}

double __muldc3(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

float __mulsc3(float a1, float a2, float a3, float a4)
{
  return (float)(a1 * a3) - (float)(a2 * a4);
}

double __powidf2(int a1, double a2)
{
  if ((a1 & 1) != 0) {
    double v2 = a2;
  }
  else {
    double v2 = 1.0;
  }
  if ((a1 + 1) >= 3)
  {
    int v3 = a1;
    do
    {
      if (v3 >= 0) {
        int v4 = v3;
      }
      else {
        int v4 = v3 + 1;
      }
      int v3 = v4 >> 1;
      a2 = a2 * a2;
      if (((v4 >> 1) & 1) != 0) {
        double v5 = a2;
      }
      else {
        double v5 = 1.0;
      }
      double v2 = v2 * v5;
    }

    while ((v3 + 1) > 2);
  }

  double result = 1.0 / v2;
  if (a1 >= 0) {
    return v2;
  }
  return result;
}

float __powisf2(int a1, float a2)
{
  if ((a1 & 1) != 0) {
    float v2 = a2;
  }
  else {
    float v2 = 1.0;
  }
  if ((a1 + 1) >= 3)
  {
    int v3 = a1;
    do
    {
      if (v3 >= 0) {
        int v4 = v3;
      }
      else {
        int v4 = v3 + 1;
      }
      int v3 = v4 >> 1;
      a2 = a2 * a2;
      if (((v4 >> 1) & 1) != 0) {
        float v5 = a2;
      }
      else {
        float v5 = 1.0;
      }
      float v2 = v2 * v5;
    }

    while ((v3 + 1) > 2);
  }

  float result = 1.0 / v2;
  if (a1 >= 0) {
    return v2;
  }
  return result;
}

uint64_t __truncdfhf2(double a1)
{
  unint64_t v1 = *(void *)&a1 & 0x7FFFFFFFFFFFFFFFLL;
  if ((*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL) - 0x3F10000000000000LL >= (*(void *)&a1 & 0x7FFFFFFFFFFFFFFFuLL)
                                                                        - 0x40F0000000000000LL)
  {
    if (v1 < 0x7FF0000000000001LL)
    {
      unint64_t v4 = v1 >> 52;
      if (v4 <= 0x40E)
      {
        if (v4 >= 0x3BD)
        {
          char v5 = -15 - v4;
          unint64_t v6 = *(void *)&a1 & 0xFFFFFFFFFFFFFLL | 0x10000000000000LL;
          BOOL v7 = v6 << (v4 + 79) != 0;
          unint64_t v8 = v6 >> v5;
          unint64_t v9 = v8 >> 42;
          unint64_t v10 = v8 & 0x3FFFFFFFFFFLL | v7;
          int v11 = ((v8 >> 42) & 1) + (v8 >> 42);
          if (v10 != 0x20000000000LL) {
            LOWORD(v11) = v9;
          }
          if (v10 >= 0x20000000001LL) {
            LOWORD(v2) = v9 + 1;
          }
          else {
            LOWORD(v2) = v11;
          }
        }

        else
        {
          LOWORD(v2) = 0;
        }
      }

      else
      {
        LOWORD(v2) = 31744;
      }
    }

    else
    {
      LODWORD(v2) = (*(void *)&a1 >> 42) & 0x1FF | 0x7E00;
    }
  }

  else
  {
    uint64_t v2 = *(void *)&a1 >> 42;
    int v3 = (*(void *)&a1 >> 42) + 0x4000;
    if ((*(void *)&a1 & 0x3FFFFFFFFFFLL) == 0x20000000000LL) {
      v3 += (*(void *)&a1 >> 42) & 1;
    }
    LOWORD(v2) = v2 + 16385;
    if ((*(void *)&a1 & 0x3FFFFFFFFFFuLL) < 0x20000000001LL) {
      LOWORD(v2) = v3;
    }
  }

  return (unsigned __int16)(v2 | HIWORD(a1) & 0x8000);
}

uint64_t __truncsfhf2(float a1)
{
  unsigned int v1 = LODWORD(a1) & 0x7FFFFFFF;
  if ((LODWORD(a1) & 0x7FFFFFFFu) - 947912704 >= (LODWORD(a1) & 0x7FFFFFFFu) - 1199570944)
  {
    if (v1 < 0x7F800001)
    {
      unsigned int v5 = v1 >> 23;
      unsigned int v6 = HIBYTE(v1);
      unsigned int v7 = LODWORD(a1) & 0x7FFFFF | 0x800000;
      BOOL v8 = v7 << ((v1 >> 23) - 81) != 0;
      unsigned int v9 = v7 >> (113 - (v1 >> 23));
      unsigned int v10 = v9 >> 13;
      unsigned int v11 = v9 & 0x1FFF | v8;
      int v4 = ((v9 >> 13) & 1) + (v9 >> 13);
      if (v11 != 4096) {
        LOWORD(v4) = v10;
      }
      if (v11 > 0x1000) {
        LOWORD(v4) = v10 + 1;
      }
      if (v6 < 0x2D) {
        LOWORD(v4) = 0;
      }
      if (v5 > 0x8E) {
        LOWORD(v4) = 31744;
      }
    }

    else
    {
      int v4 = (LODWORD(a1) >> 13) & 0x1FF | 0x7E00;
    }
  }

  else
  {
    __int16 v2 = LODWORD(a1) >> 13;
    __int16 v3 = v2 + 0x4000;
    if ((LOWORD(a1) & 0x1FFF) == 0x1000) {
      __int16 v3 = ((LODWORD(a1) >> 13) & 1) + v2 + 0x4000;
    }
    if ((LOWORD(a1) & 0x1FFFu) > 0x1000) {
      LOWORD(v4) = v2 + 16385;
    }
    else {
      LOWORD(v4) = v3;
    }
  }

  return (unsigned __int16)(v4 | (LODWORD(a1) >> 31 << 15));
}

unint64_t __udivmodti4( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5 = a2;
  if (__PAIR128__(a2, a1) >= __PAIR128__(a4, a3))
  {
    if (a4)
    {
      int v7 = __clz(a4);
      int v8 = __clz(a2);
      unint64_t v6 = 0LL;
      char v9 = v7 - v8;
      if (v7 - v8 >= 0)
      {
        unint64_t v10 = a3 << v9;
        BOOL v11 = (v9 & 0x40) == 0LL;
        if ((((_BYTE)v7 - (_BYTE)v8) & 0x40) != 0) {
          unint64_t v12 = a3 << v9;
        }
        else {
          unint64_t v12 = (a4 << v9) | (a3 >> 1 >> ~v9);
        }
        if (v11) {
          uint64_t v13 = v10;
        }
        else {
          uint64_t v13 = 0LL;
        }
        int v14 = ~v7 + v8;
        do
        {
          uint64_t v15 = ~v5 + __CFADD__(v13, ~a1) + v12;
          *((void *)&v16 + 1) = v6;
          *(void *)&__int128 v16 = v15;
          unint64_t v6 = v16 >> 63;
          unint64_t v5 = (__PAIR128__(v5, a1) - __PAIR128__(v12 & (v15 >> 63), v13 & (unint64_t)(v15 >> 63))) >> 64;
          a1 -= v13 & (v15 >> 63);
          *((void *)&v16 + 1) = v12;
          *(void *)&__int128 v16 = v13;
          uint64_t v13 = v16 >> 1;
          v12 >>= 1;
        }

        while (!__CFADD__(v14++, 1));
      }

      if (a5)
      {
        *a5 = a1;
        a5[1] = v5;
      }
    }

    else
    {
      if (a2 >= a3)
      {
        char v19 = __clz(a3);
        unint64_t v20 = a3 << v19;
        unint64_t v31 = ((a2 % a3) << v19) | (a1 >> 1 >> ~v19);
        unint64_t v32 = a3 << v19 >> 32;
        uint64_t v33 = (a3 << v19);
        unint64_t v34 = a1 << v19 >> 32;
        uint64_t v25 = (a1 << v19);
        unint64_t v26 = v31 / v32;
        unint64_t v35 = v31 % v32;
        do
        {
          if (!HIDWORD(v26) && v26 * v33 <= (v34 | (v35 << 32))) {
            break;
          }
          --v26;
          v35 += v32;
        }

        while (!HIDWORD(v35));
        unint64_t v28 = (v34 | (v31 << 32)) - v26 * v20;
        unint64_t v29 = v28 / v32;
        unint64_t v36 = v28 % v32;
        do
        {
          if (!HIDWORD(v29) && v29 * v33 <= (v25 | (v36 << 32))) {
            break;
          }
          --v29;
          v36 += v32;
        }

        while (!HIDWORD(v36));
      }

      else
      {
        char v19 = __clz(a3);
        unint64_t v20 = a3 << v19;
        unint64_t v21 = (a2 << v19) | (a1 >> 1 >> ~v19);
        unint64_t v22 = a3 << v19 >> 32;
        uint64_t v23 = (a3 << v19);
        unint64_t v24 = a1 << v19 >> 32;
        uint64_t v25 = (a1 << v19);
        unint64_t v26 = v21 / v22;
        unint64_t v27 = v21 % v22;
        do
        {
          if (!HIDWORD(v26) && v26 * v23 <= (v24 | (v27 << 32))) {
            break;
          }
          --v26;
          v27 += v22;
        }

        while (!HIDWORD(v27));
        unint64_t v28 = (v24 | (v21 << 32)) - v26 * v20;
        unint64_t v29 = v28 / v22;
        unint64_t v30 = v28 % v22;
        do
        {
          if (!HIDWORD(v29) && v29 * v23 <= (v25 | (v30 << 32))) {
            break;
          }
          --v29;
          v30 += v22;
        }

        while (!HIDWORD(v30));
      }

      unint64_t v37 = ((v25 | (v28 << 32)) - v29 * v20) >> v19;
      unint64_t v6 = v29 + (v26 << 32);
      if (a5)
      {
        *a5 = v37;
        a5[1] = 0LL;
      }
    }
  }

  else
  {
    unint64_t v6 = 0LL;
    if (a5)
    {
      *a5 = a1;
      a5[1] = a2;
    }
  }

  return v6;
}

unint64_t __udivti3( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  return __udivmodti4(a1, a2, a3, a4, 0LL);
}

unint64_t __umodti3( unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  return v5;
}

uintptr_t _Unwind_GetIP(_Unwind_Context *context)
{
  return MEMORY[0x1896008E0](context);
}

uintptr_t _Unwind_GetLanguageSpecificData(_Unwind_Context *context)
{
  return MEMORY[0x1896008E8](context);
}

uintptr_t _Unwind_GetRegionStart(_Unwind_Context *context)
{
  return MEMORY[0x1896008F0](context);
}

void _Unwind_SetGR(_Unwind_Context *context, int index, uintptr_t new_value)
{
}

void _Unwind_SetIP(_Unwind_Context *a1, uintptr_t new_value)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x189600410]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x189600418]();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}
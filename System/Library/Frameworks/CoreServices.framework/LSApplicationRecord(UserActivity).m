@interface LSApplicationRecord(UserActivity)
+ (uint64_t)applicationRecordsForUserActivityType:()UserActivity limit:error:;
@end

@implementation LSApplicationRecord(UserActivity)

+ (uint64_t)applicationRecordsForUserActivityType:()UserActivity limit:error:
{
  uint64_t v8 = result;
LABEL_2:
  v96 = (int *)(a2 - 16);
  unint64_t v9 = v8;
  while (2)
  {
    uint64_t v8 = v9;
    uint64_t v10 = a2 - v9;
    uint64_t v11 = (uint64_t)(a2 - v9) >> 4;
    switch(v11)
    {
      case 0LL:
      case 1LL:
        return result;
      case 2LL:
        result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(a2 - 8), *(void *)(v8 + 8));
        if (result == -1)
        {
          int v42 = *(_DWORD *)v8;
          *(_DWORD *)uint64_t v8 = *(_DWORD *)(a2 - 16);
          *(_DWORD *)(a2 - 16) = v42;
          uint64_t v43 = *(void *)(v8 + 8);
          *(void *)(v8 + 8) = *(void *)(a2 - 8);
          *(void *)(a2 - 8) = v43;
        }

        return result;
      case 3LL:
        return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)v8,  (int *)(v8 + 16),  v96,  a3);
      case 4LL:
        return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( v8,  v8 + 16,  v8 + 32,  (uint64_t)v96,  a3);
      case 5LL:
        return std::__sort5_maybe_branchless[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *,0>( v8,  v8 + 16,  v8 + 32,  v8 + 48,  (uint64_t)v96,  a3);
      default:
        if (v10 <= 383)
        {
          v44 = (_DWORD *)(v8 + 16);
          BOOL v46 = v8 == a2 || v44 == (_DWORD *)a2;
          if ((a5 & 1) != 0)
          {
            if (!v46)
            {
              uint64_t v47 = 0LL;
              v48 = (_DWORD *)v8;
              do
              {
                v49 = v44;
                result = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *((void *)v48 + 3),  *((void *)v48 + 1));
                if (result == -1)
                {
                  unint64_t v50 = a2;
                  int v51 = *v49;
                  uint64_t v52 = *((void *)v48 + 3);
                  uint64_t v53 = v47;
                  while (1)
                  {
                    uint64_t v54 = v8 + v53;
                    *(_DWORD *)(v54 + 16) = *(_DWORD *)(v8 + v53);
                    *(void *)(v54 + 24) = *(void *)(v8 + v53 + 8);
                    if (!v53) {
                      break;
                    }
                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, v52, *(void *)(v54 - 8));
                    v53 -= 16LL;
                    if (result != -1)
                    {
                      uint64_t v55 = v8 + v53 + 16;
                      goto LABEL_74;
                    }
                  }

                  uint64_t v55 = v8;
LABEL_74:
                  *(_DWORD *)uint64_t v55 = v51;
                  *(void *)(v55 + 8) = v52;
                  a2 = v50;
                }

                v44 = v49 + 4;
                v47 += 16LL;
                v48 = v49;
              }

              while (v49 + 4 != (_DWORD *)a2);
            }
          }

          else if (!v46)
          {
            v86 = (uint64_t *)(v8 + 24);
            do
            {
              v87 = v44;
              result = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v8 + 24),  *(void *)(v8 + 8));
              if (result == -1)
              {
                unint64_t v88 = a2;
                int v89 = *v87;
                uint64_t v90 = *(void *)(v8 + 24);
                v91 = v86;
                do
                {
                  v92 = v91;
                  int v93 = *((_DWORD *)v91 - 6);
                  uint64_t v94 = *(v91 - 2);
                  v91 -= 2;
                  *((_DWORD *)v92 - 2) = v93;
                  uint64_t *v92 = v94;
                  result = _LSBundleCompareForActivityContinuationSuitability(***a3, v90, *(v92 - 4));
                }

                while (result == -1);
                *((_DWORD *)v91 - 2) = v89;
                uint64_t *v91 = v90;
                a2 = v88;
              }

              v44 = v87 + 4;
              v86 += 2;
              uint64_t v8 = (uint64_t)v87;
            }

            while (v87 + 4 != (int *)a2);
          }

          return result;
        }

        if (!a4)
        {
          if (v8 != a2)
          {
            unint64_t v95 = a2;
            int64_t v56 = (unint64_t)(v11 - 2) >> 1;
            int64_t v57 = v56;
            do
            {
              int64_t v58 = v57;
              if (v56 >= v57)
              {
                uint64_t v59 = (2 * v57) | 1;
                uint64_t v60 = v8 + 16 * v59;
                if (2 * v57 + 2 < v11)
                {
                  uint64_t v61 = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v60 + 8),  *(void *)(v60 + 24));
                  v60 += 16LL * (v61 == -1);
                  if (v61 == -1) {
                    uint64_t v59 = 2 * v58 + 2;
                  }
                }

                uint64_t v62 = v8 + 16 * v58;
                uint64_t v64 = *(void *)(v62 + 8);
                v63 = (uint64_t *)(v62 + 8);
                result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v60 + 8), v64);
                if (result != -1)
                {
                  int64_t v99 = v58;
                  uint64_t v65 = v8 + 16 * v58;
                  int v97 = *(_DWORD *)v65;
                  uint64_t v66 = *v63;
                  do
                  {
                    uint64_t v67 = v65;
                    uint64_t v65 = v60;
                    *(_DWORD *)uint64_t v67 = *(_DWORD *)v60;
                    *(void *)(v67 + 8) = *(void *)(v60 + 8);
                    if (v56 < v59) {
                      break;
                    }
                    uint64_t v68 = (2 * v59) | 1;
                    uint64_t v60 = v8 + 16 * v68;
                    uint64_t v69 = 2 * v59 + 2;
                    if (v69 < v11)
                    {
                      uint64_t v70 = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v60 + 8),  *(void *)(v60 + 24));
                      v60 += 16LL * (v70 == -1);
                      if (v70 == -1) {
                        uint64_t v68 = v69;
                      }
                    }

                    result = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v60 + 8), v66);
                    uint64_t v59 = v68;
                  }

                  while (result != -1);
                  *(_DWORD *)uint64_t v65 = v97;
                  *(void *)(v65 + 8) = v66;
                  int64_t v58 = v99;
                }
              }

              int64_t v57 = v58 - 1;
            }

            while (v58);
            uint64_t v71 = (unint64_t)v10 >> 4;
            unint64_t v72 = v95;
            do
            {
              uint64_t v73 = 0LL;
              int v100 = *(_DWORD *)v8;
              uint64_t v74 = *(void *)(v8 + 8);
              uint64_t v75 = v8;
              do
              {
                unint64_t v76 = v75 + 16 * (v73 + 1);
                uint64_t v77 = (2 * v73) | 1;
                uint64_t v78 = 2 * v73 + 2;
                if (v78 < v71)
                {
                  result = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v76 + 8),  *(void *)(v76 + 24));
                  v76 += 16LL * (result == -1);
                  if (result == -1) {
                    uint64_t v77 = v78;
                  }
                }

                *(_DWORD *)uint64_t v75 = *(_DWORD *)v76;
                *(void *)(v75 + 8) = *(void *)(v76 + 8);
                uint64_t v75 = v76;
                uint64_t v73 = v77;
              }

              while (v77 <= (uint64_t)((unint64_t)(v71 - 2) >> 1));
              unint64_t v79 = v72 - 16;
              if (v76 == v72 - 16)
              {
                *(_DWORD *)unint64_t v76 = v100;
                *(void *)(v76 + 8) = v74;
              }

              else
              {
                *(_DWORD *)unint64_t v76 = *(_DWORD *)(v72 - 16);
                *(void *)(v76 + 8) = *(void *)(v72 - 8);
                *(_DWORD *)(v72 - 16) = v100;
                *(void *)(v72 - 8) = v74;
                uint64_t v80 = v76 - v8 + 16;
                if (v80 >= 17)
                {
                  unint64_t v81 = (((unint64_t)v80 >> 4) - 2) >> 1;
                  result = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v8 + 16 * v81 + 8),  *(void *)(v76 + 8));
                  if (result == -1)
                  {
                    int v82 = *(_DWORD *)v76;
                    uint64_t v83 = *(void *)(v76 + 8);
                    do
                    {
                      unint64_t v84 = v76;
                      unint64_t v76 = v8 + 16 * v81;
                      *(_DWORD *)unint64_t v84 = *(_DWORD *)v76;
                      *(void *)(v84 + 8) = *(void *)(v76 + 8);
                      if (!v81) {
                        break;
                      }
                      unint64_t v81 = (v81 - 1) >> 1;
                      result = _LSBundleCompareForActivityContinuationSuitability( ***a3,  *(void *)(v8 + 16 * v81 + 8),  v83);
                    }

                    while (result == -1);
                    *(_DWORD *)unint64_t v76 = v82;
                    *(void *)(v76 + 8) = v83;
                  }
                }
              }

              unint64_t v72 = v79;
            }

            while (v71-- > 2);
          }

          return result;
        }

        unint64_t v12 = (unint64_t)v11 >> 1;
        unint64_t v13 = v8 + 16 * ((unint64_t)v11 >> 1);
        if ((unint64_t)v10 < 0x801)
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)v13,  (int *)v8,  v96,  a3);
        }

        else
        {
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)v8,  (int *)v13,  v96,  a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)(v8 + 16),  (int *)(v13 - 16),  (int *)(a2 - 32),  a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)(v8 + 32),  (int *)(v8 + 16 + 16 * v12),  (int *)(a2 - 48),  a3);
          std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,+[LSApplicationRecord(UserActivity) applicationRecordsForUserActivityType:limit:error:]::$_0 &,std::pair<unsigned int,LSBundleData const*> *>( (int *)(v13 - 16),  (int *)v13,  (int *)(v8 + 16 + 16 * v12),  a3);
          int v14 = *(_DWORD *)v8;
          *(_DWORD *)uint64_t v8 = *(_DWORD *)v13;
          *(_DWORD *)unint64_t v13 = v14;
          uint64_t v15 = *(void *)(v8 + 8);
          *(void *)(v8 + 8) = *(void *)(v13 + 8);
          *(void *)(v13 + 8) = v15;
        }

        --a4;
        if ((a5 & 1) == 0
          && _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v8 - 8), *(void *)(v8 + 8)) != -1)
        {
          int v32 = *(_DWORD *)v8;
          uint64_t v33 = *(void *)(v8 + 8);
          result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(void *)(a2 - 8));
          if (result == -1)
          {
            unint64_t v35 = v8;
            do
            {
              unint64_t v9 = v35 + 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(void *)(v35 + 24));
              unint64_t v35 = v9;
            }

            while (result != -1);
          }

          else
          {
            unint64_t v34 = v8 + 16;
            do
            {
              unint64_t v9 = v34;
              if (v34 >= a2) {
                break;
              }
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(void *)(v34 + 8));
              unint64_t v34 = v9 + 16;
            }

            while (result != -1);
          }

          unint64_t v36 = a2;
          if (v9 < a2)
          {
            unint64_t v37 = a2;
            do
            {
              unint64_t v36 = v37 - 16;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, *(void *)(v37 - 8));
              unint64_t v37 = v36;
            }

            while (result == -1);
          }

          while (v9 < v36)
          {
            int v38 = *(_DWORD *)v9;
            *(_DWORD *)unint64_t v9 = *(_DWORD *)v36;
            *(_DWORD *)unint64_t v36 = v38;
            uint64_t v39 = *(void *)(v9 + 8);
            *(void *)(v9 + 8) = *(void *)(v36 + 8);
            *(void *)(v36 + 8) = v39;
            do
            {
              uint64_t v40 = *(void *)(v9 + 24);
              v9 += 16LL;
            }

            while (_LSBundleCompareForActivityContinuationSuitability(***a3, v33, v40) != -1);
            do
            {
              uint64_t v41 = *(void *)(v36 - 8);
              v36 -= 16LL;
              result = _LSBundleCompareForActivityContinuationSuitability(***a3, v33, v41);
            }

            while (result == -1);
          }

          if (v9 - 16 != v8)
          {
            *(_DWORD *)uint64_t v8 = *(_DWORD *)(v9 - 16);
            *(void *)(v8 + 8) = *(void *)(v9 - 8);
          }

          a5 = 0;
          *(_DWORD *)(v9 - 16) = v32;
          *(void *)(v9 - 8) = v33;
          continue;
        }

        uint64_t v16 = 0LL;
        int v17 = *(_DWORD *)v8;
        uint64_t v18 = *(void *)(v8 + 8);
        do
        {
          uint64_t v19 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v8 + v16 + 24), v18);
          v16 += 16LL;
        }

        while (v19 == -1);
        unint64_t v20 = v8 + v16;
        unint64_t v21 = a2;
        if (v16 == 16)
        {
          unint64_t v24 = a2;
          while (v20 < v24)
          {
            unint64_t v22 = v24 - 16;
            uint64_t v25 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v24 - 8), v18);
            unint64_t v24 = v22;
            if (v25 == -1) {
              goto LABEL_21;
            }
          }

          unint64_t v22 = v24;
        }

        else
        {
          do
          {
            unint64_t v22 = v21 - 16;
            uint64_t v23 = _LSBundleCompareForActivityContinuationSuitability(***a3, *(void *)(v21 - 8), v18);
            unint64_t v21 = v22;
          }

          while (v23 != -1);
        }

@end
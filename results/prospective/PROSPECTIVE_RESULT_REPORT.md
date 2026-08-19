# Prospective 900-Case Result

Complete scope: 1,200 development + 900 sealed prospective = **2,100 queries**.

## Prospective reliability result

All six model/method controllers meet the prespecified prospective unsafe-acceptance criterion: each 95% upper confidence bound is at most 5%. The table also records device energy during these executions, but the camera-ready energy claim is based on the separate three-draw, 630-query repeated-workload analysis under `results/replication/`.

On this 900-case population, all six cells have a positive point estimate for energy reduction, but only 13B FastV and 13B SCOPE have a positive paired 95% lower bound. These secondary observations should not be combined with the repeated-workload criterion or described as deployment certification.

## Mandatory boundaries

- Prospective labels were revealed only after all six one-action executions completed.
- Every evaluation query used exactly one backend invocation.
- Intervention grids are evaluation labels, not controller inputs.
- GPU energy is measured device energy, not full-system lifecycle carbon.
- Results must be reported by model and pruning method; pooled averages cannot hide failures.
